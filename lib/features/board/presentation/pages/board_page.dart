import 'package:flutter/material.dart';
import 'package:todo_algoriza/features/board/presentation/widgets/board_widget.dart';
// import 'package:todo_algoriza/features/schedual_tasks/presentation/pages/schedule_page.dart';
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
    return BoardWidget();
  }
}
