import 'package:flutter/material.dart';

class UnCompleteTasksWidget extends StatelessWidget {
  const UnCompleteTasksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text('UnCompleteTasksPage'),
    );
  }
}
