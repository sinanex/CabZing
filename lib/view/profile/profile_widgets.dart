 import 'package:flutter/material.dart';

Container profileContainer({
    String? mainTitle,
    String? sub,
    String? imagePAth,
    String? text,
    Color? color,
  }) {
    return Container(
      width: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Image.asset(imagePAth!),
            width: 38,
            height: 78,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(118)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
    
              Text(
                mainTitle ?? '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(sub ?? ''),
              Text(
                text ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              )
            ],
          ),
        ],
      ),
    );
  }


    Padding profilePagetile({String? text,IconData? icon}) {
    return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 60,
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon),
              
                Text(text??''),
                Spacer(),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        );
  }