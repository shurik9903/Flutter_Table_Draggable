import 'package:flutter/widgets.dart';
import 'package:flutter_table/widgets/MRow.dart';

class RowData {
  final List<Map> _data = [
    {
      'id': 1,
      'row': ['Наименование', 'Количество', 'цена за шт.'],
      'isHeader': true
    },
    {
      'id': 2,
      'row': ['Семена', '1000', '50']
    },
    {
      'id': 3,
      'row': ['Цветы', '200', '200']
    },
    {
      'id': 4,
      'row': ['Корни', '500', '100']
    },
  ];

  List<Map> get rowData => [..._data];
}
