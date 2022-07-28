import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/core/util/blocs/cubit.dart';
import 'package:todo_algoriza/features/board/presentation/pages/board_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( context) =>AppCubit()..initDatabase(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 26.0,
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          primarySwatch: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        home: const BoardPage(),
      ),
    );
  }
}
