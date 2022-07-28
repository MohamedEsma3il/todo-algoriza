import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:todo_algoriza/core/util/widgets/task_item.dart';

class TaskBuilder extends StatelessWidget {
  TaskBuilder({Key? key, required this.tasks}) : super(key: key);

   final List<Map> tasks;

  @override
  Widget build(BuildContext context) {
    return  ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (BuildContext context) => ListView.separated(
        itemBuilder: (context, index) => BuildTaskItem(model: tasks[index],),
        separatorBuilder: (context, index) => Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: tasks.length,
      ),
      fallback: (BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet ,Please Add Some Tasks',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
