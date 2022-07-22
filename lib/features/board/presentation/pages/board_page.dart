import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/board/presentation/widgets/board_widget.dart';
// import 'package:todo_algoriza/core/util/widgets/my_divider.dart';
// import 'package:todo_algoriza/features/all%20tasks/presentation/pages/all_tasks_page.dart';
// import 'package:todo_algoriza/features/complete_tasks/presentation/pages/complete_tasks_page.dart';
// import 'package:todo_algoriza/features/favorite%20tasks/presentation/pages/favorite_page.dart';
// import 'package:todo_algoriza/features/uncomplete%20tasks/presentation/pages/uncomplete_tasks_page.dart';
// import '../../../../core/util/widgets/my_button.dart';

class BoardPage extends StatelessWidget {
   const BoardPage({Key? key}) : super(key: key);
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
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: const BoardWidget(),
      ),
    );
  }
}
