import 'package:flutter/material.dart';
import 'package:flutter_table/modules/DataRow.dart';
import 'package:flutter_table/widgets/MCell.dart';
import 'package:flutter_table/widgets/MRow.dart';
import 'package:flutter_table/widgets/MTable.dart';
import 'package:provider/provider.dart';

class HomeData extends ChangeNotifier {
  List<Map> _data = <Map>[];

  set childData(List<Map> data) {
    _data = data;
    notifyListeners();
  }

  List<Map> get getAllChild => _data;

  void addData(Map data) {
    _data.add(data);
    notifyListeners();
  }

  // void removeData(Key? key) {
  //   _data.removeWhere((element) => element.key == key);
  //   notifyListeners();
  // }

  // Widget getData(Key? key) {
  //   return _data.firstWhere((element) => element.key == key);
  // }

  // void changeData(Widget data, Key? key) {
  //   _data = _data.map((e) {
  //     if (e.key == key) {
  //       return data;
  //     } else {
  //       return e;
  //     }
  //   }).toList();

  //   notifyListeners();
  // }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeData _data = HomeData();

  @override
  void initState() {
    _data.childData = [...RowData().rowData];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomeData>(
        create: (context) => _data,
        builder: (context, child) {
          return Container(
            color: Colors.amber,
            child: Column(
              children: <Widget>[
                Wrap(
                  runSpacing: 20,
                  children: [
                    Center(
                      child: MTable(
                        children: [
                          // buildRow(
                          //   ['Наименование', 'Количество', 'цена за шт.'],
                          //   isHeader: true,
                          //   isDraggable: false,
                          // ),

                          // ...context
                          //     .watch<HomeData>()
                          //     .getAllChild
                          //     .fold<List<Widget>>([], (prev, item) {
                          //   if (!item.containsKey('isHeader')) {
                          //     prev.add(
                          //       buildRow(
                          //         item['row'],
                          //         isHeader: item.containsKey('isHeader')
                          //             ? true
                          //             : false,
                          //         isDraggable: item.containsKey('isHeader')
                          //             ? false
                          //             : true,
                          //       ),
                          //     );
                          //   }
                          //   return prev;
                          // })

                          // ...context.watch<HomeData>().getAllChild.map((item) {
                          //   if (item.containsKey('isHeader')) {
                          //     return buildRow(
                          //       item['row'],
                          //       isHeader:
                          //           item.containsKey('isHeader') ? true : false,
                          //       isDraggable:
                          //           item.containsKey('isHeader') ? false : true,
                          //     );
                          //   }
                          // })

                          ...context.watch<HomeData>().getAllChild.map((item) {
                            return buildRow(
                              item['row'],
                              isHeader:
                                  item.containsKey('isHeader') ? true : false,
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
          );
        },
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