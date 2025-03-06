import 'package:flutter/material.dart';

class TaskTileWidget extends StatefulWidget {
  const TaskTileWidget({super.key});

  @override
  State<TaskTileWidget> createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.green)),
      child: ListTile(
        leading: Checkbox(
          shape: OutlinedBorder.lerp(CircleBorder(), CircleBorder(), 1),
          value: true,
          onChanged: (bool? value) {},
          activeColor: Colors.green,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Task Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Chip(
              label: Text(
                'Pending',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.amberAccent,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
          ],
        ),
        subtitle: Text(DateTime.timestamp().toString()),
      ),
    );
  }
}
