import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/features/add_task/presentation/cubit/states.dart';

class AddTaskCubit extends Cubit<AddTaskStates>{
  AddTaskCubit() : super(AddTaskInitialState());
  static AddTaskCubit get(context) => BlocProvider.of(context);

  void changeReminderMenu({selectedItem,value})
  {
    selectedItem=value;


    emit( AddTaskChangeRemindMenuState());
  }
}