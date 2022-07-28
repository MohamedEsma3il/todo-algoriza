import 'package:flutter/material.dart';
import 'package:todo_algoriza/core/util/widgets/my_button.dart';
import 'package:todo_algoriza/core/util/widgets/my_divider.dart';
import 'package:todo_algoriza/features/add_task/presentation/pages/add_task_page.dart';
import 'package:todo_algoriza/features/all%20tasks/presentation/pages/all_tasks_page.dart';
import 'package:todo_algoriza/features/complete_tasks/presentation/pages/complete_tasks_page.dart';
import 'package:todo_algoriza/features/favorite%20tasks/presentation/pages/favorite_page.dart';
import 'package:todo_algoriza/features/schedule_tasks/presentation/pages/schedule_page.dart';
import 'package:todo_algoriza/features/uncomplete%20tasks/presentation/pages/uncomplete_tasks_page.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Board',
          ),
          actions: [
            IconButton(
              iconSize: 26.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SchedualePage()));
              },
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyDivider(),
              TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400]!,
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  indicatorWeight: 3.0,
                  tabs: const [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Completed',
                    ),
                    Tab(
                      text: 'Uncompleted',
                    ),
                    Tab(
                      text: 'Favorite',
                    ),
                  ]),
              const MyDivider(),
              const SizedBox(
                height: 6.0,
              ),
              const Expanded(
                child: TabBarView(children: [
                  AllTasksPage(),
                  CompleteTasksPage(),
                  UnCompleteTasksPage(),
                  FavoriteTasksPage(),
                ]),
              ),
              const SizedBox(
                height: 16.0,
              ),
              MyButton(
                  text: 'add task',
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddTaskPage()));
                  }),
              const SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
