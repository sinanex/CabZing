import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/controller/sale_controller.dart';
import 'package:vikncodes/controller/user_controller.dart';
import 'package:vikncodes/view/home/dashbord.dart';
import 'package:vikncodes/view/invoice/invoices.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool showAvg = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SaleController>(context, listen: false).getSaleData();
      Provider.of<UserController>(context, listen: false).getProfileData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                  Image.asset('assets/icon.png',width: 40,),
                    SizedBox(
                    width: 10,
                  ),
                  Text(
                    'CabZing',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Consumer<UserController>(
                    builder: (context, value, child) => Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          '${value.photo}',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SAR 2,78,000.00',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text(
                          '21% ',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          'than last month.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'Revenue',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
            AspectRatio(
              aspectRatio: 1.70,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 18,
                  left: 12,
                  top: 24,
                  bottom: 12,
                ),
                child: LineChart(
                  mainData(context),
                ),
              ),
            ),
            Center(
              child: Text(
                'September 2023',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            itemContainer(
                color: Color.fromRGBO(246, 239, 237, 1),
                mainText: 'Booking',
                text: '123',
                sub: 'reserved'),
            itemContainer(
                color: Color.fromRGBO(169, 201, 197, 1),
                mainText: 'Invoices',
                text: '10,232.00',
                sub: 'Rupees'),
          ],
        ),
      ),
    );
  }

  Widget itemContainer(
      {Color? color, String? mainText, String? text, String? sub}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InvoicesScreen()));
        },
        child: Container(
          height: 129,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(15, 15, 15, 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 40,
                height: 92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(118),
                  color: color,
                ),
                child: Icon(
                  Iconsax.bag_2,
                  color: Color.fromRGBO(40, 99, 91, 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      mainText ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      text ?? '',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      sub ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
