import 'package:flutter/material.dart';
import 'package:flutter_table/widgets/MRow.dart';
import 'package:provider/provider.dart';

class TableData extends ChangeNotifier {
  List<Widget> _data = <Widget>[];

  set childData(List<Widget> data) {
    _data = data;
    notifyListeners();
  }

  List<Widget> get getAllChild => _data;

  void addData(Widget data) {
    _data.add(data);
    notifyListeners();
  }

  void removeData(Key? key) {
    _data.removeWhere((element) => element.key == key);
    notifyListeners();
  }

  Widget getData(Key? key) {
    return _data.firstWhere((element) => element.key == key);
  }

  void changeData(Widget data, Key? key) {
    _data = _data.map((e) {
      if (e.key == key) {
        return data;
      } else {
        return e;
      }
    }).toList();

    notifyListeners();
  }
}

class MTable extends StatefulWidget {
  final List<Widget> children;
  final Border? border;
  const MTable({super.key, this.children = const <Widget>[], this.border});

  @override
  State<MTable> createState() => _MTableState();
}

class _MTableState extends State<MTable> {
  TableData tableData = TableData();

  @override
  void initState() {
    tableData.childData = [...widget.children];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TableData>(
      create: (context) => tableData,
      builder: (context, child) {
        return Container(
          color: Colors.black,
          width: 500,
          child: Center(
            child: Column(
              children: [
                // ...tableData.getAllChild,

                ...context.watch<TableData>().getAllChild,
              ],
            ),
          ),
        );
      },
      // child: Container(
      //   color: Colors.black,
      //   width: 500,
      //   child: Center(
      //     child: Column(
      //       children: [
      //         ...tableData.getAllChild,

      //         // ...context.watch<TableData>().getAllChild,
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
