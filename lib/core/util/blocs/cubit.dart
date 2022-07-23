import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/core/util/blocs/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void changeReminderMenu({selectedItem, value}) {
    selectedItem = value;

    emit(AddTaskChangeRemindMenuState());
  }

  void changeScheduleDate({selectedDate, date}) {
    selectedDate = date;

    emit(AppChangeSelectedScheduleDateState());

  }
}
