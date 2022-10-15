import 'package:flutter/material.dart';
import 'package:flutter_table/modules/DataRow.dart';
import 'package:flutter_table/widgets/MCell.dart';
import 'package:flutter_table/widgets/MRow.dart';
import 'package:flutter_table/widgets/MTable.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Column(
          children: <Widget>[
            Wrap(
              runSpacing: 20,
              children: [
                Center(
                  child: MTable(
                    children: [
                      ...RowData().rowData.map((item) {
                        return buildRow(
                          item['row'],
                          isHeader: item.containsKey('isHeader') ? true : false,
                          isDraggable:
                              item.containsKey('isHeader') ? false : true,
                        );
                      }),
                    ],
                  ),
                ),
                Center(
                  child: MTable(
                    children: [
                      buildRow(
                        ['Наименование', 'Количество', 'цена за шт.'],
                        isHeader: true,
                        isDraggable: false,
                      ),
                      buildRow(
                        ['', '', ''],
                        isDragTarget: true,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

            // Wrap(
            //   runSpacing: 20,
            //   children: <Widget>[
            //     Center(
            //       child: MYTable(
            //         tableRow: [
            //           buildRow(
            //             ['Наименование', 'Количество', 'цена за шт.'],
            //             isHeader: true,
            //           ),
            //           ...RowData().rowData
            //         ],
            //       ),
            //     ),
            //     Center(
            //       child: MYTable(
            //         tableRow: [
            //           buildRow(
            //             ['Наименование', 'Количество', 'цена за шт.'],
            //             isHeader: true,
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),