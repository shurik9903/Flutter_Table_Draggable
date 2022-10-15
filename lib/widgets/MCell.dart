import 'package:flutter/material.dart';

class MCell extends StatefulWidget {
  final Widget? child;
  final Border? border;
  const MCell({super.key, this.child, this.border});

  @override
  State<MCell> createState() => _MCellState();
}

class _MCellState extends State<MCell> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        // width: 200,
        decoration: BoxDecoration(
          border: widget.border,
        ),
        child: widget.child,
      ),
    );
    // children: widget.children.map<Widget>((item) {
    //   return Container(
    //     decoration: BoxDecoration(
    //       border: Border.all(),
    //     ),
    //     child: item,
    //   );
    // }).toList(),;
  }
}
