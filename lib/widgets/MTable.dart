import 'package:flutter/material.dart';
import 'package:flutter_table/widgets/MRow.dart';
import 'package:provider/provider.dart';

class TableData extends ChangeNotifier {
  List<Widget> _data = <Widget>[];

  set childData(List<Widget> data) {
    _data = data;
    notifyListeners();
  }

  List<Widget> get allChildData => [..._data];

  void addData(Widget data) {
    _data.add(data);
    notifyListeners();
  }

  void removeData(Key key) {
    _data.removeWhere((element) => element.key == key);
    notifyListeners();
  }

  Widget getData(Key key) {
    return _data.firstWhere((element) => element.key == key);
  }

  void changeData(Widget data, Key key) {
    _data.forEach((element) {
      if (element.key == key) {
        element = data;
        return;
      }
    });
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

  // @override
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     tableData.childData = [...widget.children];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TableData>(
      create: (context) => TableData(),
      child: Container(
        color: Colors.black,
        width: 500,
        child: Center(
          child: Column(
            children: [
              ...widget.children
              // ...context.watch<TableData>().allChildData,
            ],
          ),
        ),
      ),
    );
  }
}
