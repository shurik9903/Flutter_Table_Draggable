import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_table/widgets/MCell.dart';

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
  late Widget body;

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
    //       ...widget.children,
    //     ],
    //   ),
    // );

    if (widget.isDraggable)
      return Draggable(
        data: body,
        feedback: body,
        child: body,
        childWhenDragging: buildRow(['', '', '']),
      );
    else if (widget.isDragTarget)
      return DragTarget(
        onAccept: (Widget data) {
          setState(() {
            body = data;
          });
          log('data: $body');
        },
        builder: (context, data, rejectedData) {
          return body;
        },
      );
    else
      return body;
  }
}

MRow buildRow(List<String> cells,
        {bool isHeader = false,
        bool isDraggable = false,
        bool isDragTarget = false}) =>
    MRow(
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
