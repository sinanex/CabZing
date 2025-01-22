import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vikncodes/services/invoices/invoice_services.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    InvoiceServices _services = InvoiceServices();
    _services.salesPage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8), // Adds some space between TextField and Container
                Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(27, 43, 48, 1),
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: Center(
                    child: Icon(
                      Icons.filter_list, // Optional icon or text inside the container
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
