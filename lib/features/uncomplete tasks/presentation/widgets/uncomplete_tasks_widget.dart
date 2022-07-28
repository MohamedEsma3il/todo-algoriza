import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/core/util/blocs/cubit.dart';
import 'package:todo_algoriza/core/util/blocs/states.dart';
import 'package:todo_algoriza/core/util/widgets/task_builder.dart';

class UnCompleteTasksWidget extends StatelessWidget {
  const UnCompleteTasksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context,  state) {
        var tasks =AppCubit.get(context).uncompletedTasks;
        return TaskBuilder(tasks: tasks,)

        ; },
    );
  }
}
