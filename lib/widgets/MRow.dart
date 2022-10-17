import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_table/widgets/MCell.dart';
import 'package:flutter_table/widgets/MDialog.dart';
import 'package:flutter_table/widgets/MTable.dart';
import 'package:provider/provider.dart';

class MRow extends StatefulWidget {
  final List<Widget> children;
  final Border? border;
  final bool isDraggable;
  final bool isDragTarget;
  const MRow({
    super.key,
    this.children = const <Widget>[],
    this.border,
    this.isDraggable = false,
    this.isDragTarget = false,
  });

  @override
  State<MRow> createState() => _MRowState();
}

class _MRowState extends State<MRow> {
  Widget body = Container();

  // @override
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     body = Container(
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           ...context.watch<TableData>().allChildData,
  //         ],
  //       ),
  //     );
  //   });
  // }

  @override
  void initState() {
    body = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...widget.children,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Widget body = Container(
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       ...context.watch<TableData>().allChildData,
    //     ],
    //   ),
    // );
    final TableData tableData = context.watch<TableData>();
    // log('data: ${tableData.getAllChild.toString()}');

    if (widget.isDraggable) {
      return Draggable(
        onDragCompleted: () {
          // body = Container(
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [],
          //   ),
          // );
          context.read<TableData>().removeData(widget.key);
          // log('key: ${widget.key}');
        },
        data: body,
        feedback: body,
        child: body,
        childWhenDragging: buildRow(['', '', '']),
      );
    } else if (widget.isDragTarget) {
      return DragTarget(
        onWillAccept: (data) {
          // showDialogWindow(context).then((value) {
          //   log('data widget: ${value as bool}');
          //   return true;
          // });

          return true;
        },
        onAccept: (Widget data) {
          log('data widget: ${widget.key}');
          context.read<TableData>().changeData(data, widget.key);
          context
              .read<TableData>()
              .addData(buildRow(['', '', ''], isDragTarget: true));
          // setState(() {
          //   body = data;
          // });
          // log('data widget: ${widget.key}');
          // log(context.watch<TableData>().allChildData.toString());
        },
        builder: (context, data, rejectedData) {
          return body;
        },
      );
    } else {
      return body;
    }
  }
}

MRow buildRow(
  List<String> cells, {
  bool isHeader = false,
  bool isDraggable = false,
  bool isDragTarget = false,
}) =>
    MRow(
      key: UniqueKey(),
      isDragTarget: isDragTarget,
      isDraggable: isDraggable,
      children: cells.map((cell) {
        final styleText = TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 18,
        );

        return MCell(
          border: Border.all(),
          child: Container(
            color: isHeader
                ? Color.fromARGB(255, 126, 126, 126)
                : Color.fromARGB(255, 75, 75, 75),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Text(
                  cell,
                  style: styleText,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
