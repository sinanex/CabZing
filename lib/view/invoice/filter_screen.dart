import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vikncodes/view/invoice/widgets.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Filters',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Iconsax.eye,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Filter",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              celenderContainer(),
              celenderContainer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btnContainer(color: Colors.blue,text: 'Pending'),
              btnContainer(text: 'Invoiced'),
              btnContainer(text: 'Cancelled'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Customer'), Icon(Icons.keyboard_arrow_down)],
                ),
              ),
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(8, 19, 30, 1),
                  border: Border.all(color: Color.fromRGBO(28, 51, 71, 1))),
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Sinan',style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  Icon(Icons.close,
                  color: Colors.blue,)
                ],
              ),
              width: 180,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
               color: Color.fromRGBO(27, 43, 48, 1)
              ),
            ),
          ),
        ],
      )),
    );
  }
}
