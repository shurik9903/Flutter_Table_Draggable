import 'package:flutter/widgets.dart';
import 'package:flutter_table/widgets/MRow.dart';

class RowData {
  // final _data = [
  //   buildRow(['Семена', '1000', '50']),
  //   buildRow(['Цветы', '200', '200']),
  //   buildRow(['Корни', '500', '100']),
  // ];

  final List<Map> _data = [
    {
      'row': ['Наименование', 'Количество', 'цена за шт.'],
      'isHeader': true
    },
    {
      'row': ['Семена', '1000', '50']
    },
    {
      'row': ['Цветы', '200', '200']
    },
    {
      'row': ['Корни', '500', '100']
    },
  ];

  List<Map> get rowData => [..._data];
}
