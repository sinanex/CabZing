import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/controller/sale_controller.dart';
import 'package:vikncodes/model/invoice_model.dart';

Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1000:
        text = '1k';
        break;
      case 2000:
        text = '2k';
        break;
      case 3000:
        text = '3k';
        break;
      case 4000:
        text = '4k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(BuildContext context) {
    List<Data> saleList = Provider.of<SaleController>(context).saleList;
    print(saleList.length);

    List<FlSpot> chartData = processSaleData(saleList);
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.black,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.blue,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: Text('',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
          sideTitles: SideTitles(
            reservedSize: 50,
            interval: 40,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 30,
      minY: -130,
      maxY: 4000,
      lineBarsData: [
        LineChartBarData(
          spots: chartData,
          isCurved: true,
          gradient: LinearGradient(
            colors: [Colors.blue[300]!, Colors.blue[100]!],
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [Colors.blue[300]!, Colors.blue[300]!]
                  .map((color) => color.withValues(alpha: 0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

List<FlSpot> processSaleData(List<Data> saleList) {
  List<FlSpot> chartData = [];
  for (int i = 1; i < saleList.length; i++) {
    chartData.add(FlSpot(i.toDouble(), saleList[i].totalGrossAmtRounded!));
  }
  return chartData;
}
