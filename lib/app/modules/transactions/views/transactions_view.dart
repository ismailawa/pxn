import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/sections_header.dart';

import '../controllers/transactions_controller.dart';

class TransactionsView extends GetView<TransactionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100.withOpacity(0.3),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeaderSection(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black12.withOpacity(0.1),
                                            offset: Offset(0, 5),
                                            blurRadius: 10)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 20,
                                        left: 10,
                                        right: 10,
                                        bottom: 10),
                                    child: BarChart(
                                      BarChartData(
                                        alignment:
                                            BarChartAlignment.spaceAround,
                                        maxY: 20,
                                        barTouchData: BarTouchData(
                                          enabled: false,
                                          touchTooltipData: BarTouchTooltipData(
                                            tooltipBgColor: Colors.transparent,
                                            tooltipPadding:
                                                const EdgeInsets.all(0),
                                            tooltipMargin: 8,
                                            getTooltipItem: (
                                              BarChartGroupData group,
                                              int groupIndex,
                                              BarChartRodData rod,
                                              int rodIndex,
                                            ) {
                                              return BarTooltipItem(
                                                rod.y.round().toString(),
                                                TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        titlesData: FlTitlesData(
                                          show: false,
                                          bottomTitles: SideTitles(
                                            showTitles: true,
                                            getTextStyles: (value) =>
                                                const TextStyle(
                                                    color: Color(0xff7589a2),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                            margin: 0,
                                            getTitles: (double value) {
                                              switch (value.toInt()) {
                                                case 0:
                                                  return '';
                                                case 1:
                                                  return '';
                                                case 2:
                                                  return '';
                                                case 3:
                                                  return '';
                                                case 4:
                                                  return '';
                                                case 5:
                                                  return '';
                                                case 6:
                                                  return '';
                                                default:
                                                  return '';
                                              }
                                            },
                                          ),
                                          leftTitles:
                                              SideTitles(showTitles: false),
                                        ),
                                        borderData: FlBorderData(
                                          show: false,
                                        ),
                                        barGroups: [
                                          BarChartGroupData(
                                            x: 0,
                                            barRods: [
                                              BarChartRodData(y: 8, colors: [
                                                Colors.lightBlueAccent,
                                                Colors.greenAccent
                                              ])
                                            ],
                                            showingTooltipIndicators: [0],
                                          ),
                                          BarChartGroupData(
                                            x: 1,
                                            barRods: [
                                              BarChartRodData(y: 10, colors: [
                                                Colors.lightBlueAccent,
                                                Colors.greenAccent
                                              ])
                                            ],
                                            showingTooltipIndicators: [0],
                                          ),
                                          BarChartGroupData(
                                            x: 2,
                                            barRods: [
                                              BarChartRodData(y: 14, colors: [
                                                Colors.lightBlueAccent,
                                                Colors.greenAccent
                                              ])
                                            ],
                                            showingTooltipIndicators: [0],
                                          ),
                                          BarChartGroupData(
                                            x: 3,
                                            barRods: [
                                              BarChartRodData(y: 15, colors: [
                                                Colors.lightBlueAccent,
                                                Colors.greenAccent
                                              ])
                                            ],
                                            showingTooltipIndicators: [0],
                                          ),
                                          BarChartGroupData(
                                            x: 3,
                                            barRods: [
                                              BarChartRodData(y: 13, colors: [
                                                Colors.lightBlueAccent,
                                                Colors.greenAccent
                                              ])
                                            ],
                                            showingTooltipIndicators: [0],
                                          ),
                                          BarChartGroupData(
                                            x: 3,
                                            barRods: [
                                              BarChartRodData(y: 5, colors: [
                                                Colors.lightBlueAccent,
                                                Colors.greenAccent
                                              ])
                                            ],
                                            showingTooltipIndicators: [0],
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black12.withOpacity(0.1),
                                            offset: Offset(0, 5),
                                            blurRadius: 10)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12.withOpacity(0.1),
                                    offset: Offset(0, 5),
                                    blurRadius: 10)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
