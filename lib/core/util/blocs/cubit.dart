//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_algoriza/core/util/blocs/states.dart';
import 'package:path/path.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  var mySelectedDate = DateTime.now();
  var mySelectedColor = 0;
  bool checkBoxValue = false;

  void changeReminderMenu({selectedItem, value}) {
    selectedItem = value;

    emit(AddTaskChangeRemindMenuState());
  }

  void changeScheduleDate({selectedDate, date}) {
    selectedDate = date;
    mySelectedDate = date;

    emit(AppChangeSelectedScheduleDateState());
  }

  void changeSelectedColor({index}) {
    //selectedColor = index;
    mySelectedColor = index;

    emit(AppChangeSelectedColorState());
  }

  void changeCheckBoxValue({value}) {
    checkBoxValue = value;

    emit(AppChangeCheckBoxValueState());
  }

  // *****************************************************************

  late Database database;
  List<Map> allTasks = [];
  List<Map> completedTasks = [];
  List<Map> uncompletedTasks = [];
  List<Map> favoriteTasks = [];
  //********


  void initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');

    debugPrint('AppDatabaseInitialized');

    openAppDatabase(
      path: path,
    );

    emit(AppDatabaseInitializedState());
  }

  void openAppDatabase({
    required String path,
  }) async {
    openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT,date TEXT,startTime TEXT,endTime TEXT,remind TEXT,color INTEGER,isCompleted INTEGER,isFavorite INTEGER,allTasks INTEGER)',
        );

        debugPrint('Table Created');
      },
      onOpen: (Database db) {
        debugPrint('AppDatabaseOpened');
        database = db;
        getDataFromDatabase(database);
        //getUsersData();
      },
    );
    emit(AppDatabaseOpenedState());
  }

  Future insertToDatabase({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required String remind,
    required int color,
    // required int isCompleted,
    // required int isFavorite,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO tasks(title, date, startTime, endTime, remind, color, isCompleted, isFavorite ,allTasks) VALUES("$title","$date","$startTime","$endTime","$remind","$color","0","0","1")')
          .then((value) {
        debugPrint('$value successfully inserted');
        emit(AppInsertDataBaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        debugPrint('error when inserting new row ${error.toString()}');
      });
    });
  }

  void getDataFromDatabase(database) {
    allTasks = [];
    completedTasks = [];
    uncompletedTasks = [];
    favoriteTasks = [];
    //******
    //scheduleTasks =[];

    emit(AppGetDataBaseLoadingState());

    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['isCompleted'] == 1) {
          completedTasks.add(element);
        } else if (element['isCompleted'] == 0) {
          uncompletedTasks.add(element);
        }
        if (element['isFavorite'] == 1) {
          favoriteTasks.add(element);
        }
        if (element['allTasks'] == 1){
          allTasks.add(element);
        }
        //******
        // if (element['date'] == mySelectedDate.toString()){
        //   scheduleTasks.add(element);
        // }
      });
      emit(AppGetDataBaseState());
    });
    debugPrint('database opened');
    debugPrint(allTasks.toString());
  }

  void updateIsCompletedData({
    required int isCompleted,
    required int id,
  }) {
    database.rawUpdate('UPDATE tasks SET isCompleted = ? WHERE id = ?',
        ['$isCompleted', '$id']).then((value) {
      getDataFromDatabase(database);
      emit(AppUpDateDataBaseState());
    });
  }
  void deleteData({

    required int id,
  }) {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteFromDataBaseState());
    });
  }

  void updateIsFavoriteData({
    required int isFavorite,
    required int id,
  }) {
    database.rawUpdate('UPDATE tasks SET isFavorite = ? WHERE id = ?',
        [ '$isFavorite', '$id']).then((value) {
      getDataFromDatabase(database);
      emit(AppUpDateDataBaseState());
    });
  }

  List<Map<dynamic, dynamic>> scheduleTasks (){return allTasks.where((element) => element['date']==mySelectedDate).toList();}

}
