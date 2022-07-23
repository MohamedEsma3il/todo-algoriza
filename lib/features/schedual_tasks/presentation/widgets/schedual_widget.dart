import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/core/util/blocs/cubit.dart';
import 'package:todo_algoriza/core/util/blocs/states.dart';
import 'package:todo_algoriza/core/util/widgets/my_divider.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class SchedualeWidget extends StatelessWidget {
  SchedualeWidget({Key? key}) : super(key: key);

  DateTime selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Schedule'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const MyDivider(),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: selectedValue,
                  selectionColor: Colors.lightGreen,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    AppCubit.get(context).changeScheduleDate(
                      selectedDate: selectedValue,
                      date: date,
                    );
                  },
                ),
                const MyDivider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Sunday',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17.0),
                      ),
                      Text('24jul,2022',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
