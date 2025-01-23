import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/controller/sale_controller.dart';
import 'package:vikncodes/view/invoice/filter_screen.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});
  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SaleController>(context, listen: false).getSaleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Invoices"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (val) {
                      Provider.of<SaleController>(context, listen: false)
                          .searchList(val);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FilterScreen()));
                  },
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(27, 43, 48, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Add Filters",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.filter_list,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Consumer<SaleController>(
              builder: (context, value, child) => Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: value.filteredSaleList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value.filteredSaleList[index].voucherNo ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                value.filteredSaleList[index].customerName ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                value.filteredSaleList[index].status == 'Invoiced'
                                    ? 'Invoiced'
                                    : 'Other Status',
                                style: TextStyle(
                                  color:
                                      value.filteredSaleList[index].status == 'Invoiced'
                                          ? Colors.blue
                                          : Colors.red,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'SAR. ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    '${value.filteredSaleList[index].grandTotal},',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
