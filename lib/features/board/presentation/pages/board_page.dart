import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/board/presentation/widgets/board_widget.dart';
import 'package:todo_algoriza/core/util/widgets/my_divider.dart';
import 'package:todo_algoriza/features/all%20tasks/presentation/pages/all_tasks_page.dart';
import 'package:todo_algoriza/features/complete_tasks/presentation/pages/complete_tasks_page.dart';
import 'package:todo_algoriza/features/favorite%20tasks/presentation/pages/favorite_page.dart';
import 'package:todo_algoriza/features/uncomplete%20tasks/presentation/pages/uncomplete_tasks_page.dart';
import '../../../../core/util/widgets/my_button.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'Board',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              iconSize: 26.0,
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(0.0),
            ),
            IconButton(
              iconSize: 26.0,
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(0.0),
            ),
            IconButton(
              iconSize: 26.0,
              onPressed: () {},
              icon: const Icon(
                Icons.list,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(0),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyDivider(),
              const TabBar
                ( labelColor: Colors.black,
                  isScrollable: true,
                  indicatorColor:Colors.black ,
                  indicatorWeight:3.0 ,

                  tabs: [
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
              const SizedBox(height: 4.0,),
              Expanded(
                child: const TabBarView(children: [
                  AllTasksPage(),
                  CompleteTasksPage(),
                  UnCompleteTasksPage(),
                  FavoriteTasksPage(),
                ]),
              ),
              const SizedBox(height: 10.0,),
              MyButton(text: 'add task', function: () {}),
              const SizedBox(height: 20.0,)
            ],
          ),
        )
      ),
    );
  }
}
