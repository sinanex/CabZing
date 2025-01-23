import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

Container btnContainer({Color? color,required String text}) {
    return Container(
      width: 115,
      height: 48,
      decoration: BoxDecoration(
        color: color ?? Color.fromRGBO(27, 43, 48, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Container celenderContainer() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Iconsax.calendar_1,
            color: Colors.blue,
          ),
          Text(
            '12/09/2023',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
      width: 148,
      height: 38,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(27, 43, 48, 1)),
    );
  }

