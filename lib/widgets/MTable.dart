import 'package:flutter/material.dart';
import 'package:flutter_table/widgets/MRow.dart';

// class MYTable extends StatefulWidget {
//   const MYTable({super.key, this.tableRow});

//   final List<TableRow>? tableRow;

//   @override
//   State<MYTable> createState() => _MYTableState();
// }

// class _MYTableState extends State<MYTable> {
//   @override
//   Widget build(BuildContext context) {
//     return Table(
//       border: TableBorder.all(),
//       defaultColumnWidth: FixedColumnWidth(200),
//       children: [
//         ...?widget.tableRow,
//       ],
//     );
//   }
// }

// TableRow buildRow(List<String> cells, {bool isHeader = false}) =>
//     TableRow(children: [
//       MyRow(
//         cells: [...cells],
//       )
//     ]
//         // children: cells.map((cell) {
//         //   final styleText = TextStyle(
//         //     fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//         //     fontSize: 18,
//         //   );

//         //   // return Draggable(
//         //   //     child: Container(
//         //   //       color: Colors.white,
//         //   //       child: Text('q'),
//         //   //     ),
//         //   //     feedback: Container(
//         //   //       color: Colors.black,
//         //   //       child: Text('q'),
//         //   //     ));

//         //   return Container(
//         //     color: isHeader
//         //         ? Color.fromARGB(255, 126, 126, 126)
//         //         : Color.fromARGB(255, 75, 75, 75),
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(5),
//         //       child: Center(
//         //         child: Text(
//         //           cell,
//         //           style: styleText,
//         //         ),
//         //       ),
//         //     ),
//         //   );
//         // }).toList(),
//         );

// class MyRow extends StatefulWidget {
//   final List<String>? cells;
//   const MyRow({super.key, this.cells});

//   @override
//   State<MyRow> createState() => _MyRowState();
// }

// class _MyRowState extends State<MyRow> {
//   @override
//   Widget build(BuildContext context) {
//     return Draggable<Widget>(

//       feedback: Row(
//         children: [Text('123')],
//       ),
//       child: Row(
//         children: widget.cells!.map<Widget>((cell) {
//           return Text('qwe');
//         }).toList(),
//       ),
//     );
//   }
// }

class MTable extends StatefulWidget {
  final List<Widget> children;
  final Border? border;
  const MTable({super.key, this.children = const <Widget>[], this.border});

  @override
  State<MTable> createState() => _MTableState();
}

class _MTableState extends State<MTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 500,
      child: Center(
        child: Column(
          children: [
            ...widget.children,
          ],
        ),
      ),
    );
  }
}
