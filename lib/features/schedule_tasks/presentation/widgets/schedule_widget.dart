import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/core/util/blocs/cubit.dart';
import 'package:todo_algoriza/core/util/blocs/states.dart';
import 'package:todo_algoriza/core/util/colors.dart';
import 'package:todo_algoriza/core/util/widgets/my_divider.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:todo_algoriza/features/favorite%20tasks/presentation/widgets/schedule_task_builder.dart';

class ScheduleWidget extends StatelessWidget {
  ScheduleWidget({Key? key}) : super(key: key);

  DateTime selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks =AppCubit.get(context).scheduleTasks;
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Schedule'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              const MyDivider(),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: selectedValue,
                selectionColor: Colors.lightGreen,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  cubit.changeScheduleDate(
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
                  children: [
                    Text(
                      DateFormat('EEEE')
                          .format(cubit.mySelectedDate)
                          .toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 17.0),
                    ),
                    Text(
                        DateFormat('d MMMM y')
                            .format(cubit.mySelectedDate)
                            .toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ),
              Expanded(child: ScheduleTaskBuilder(tasks: tasks)),
              // Expanded(
              //   child: ListView.separated(
              //     //shrinkWrap: true,
              //     scrollDirection: Axis.vertical,
              //     physics: BouncingScrollPhysics(),
              //     itemCount: 5,
              //     separatorBuilder: (context, index) => const SizedBox(
              //       height: 16.0,
              //     ),
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 16.0,
              //         ),
              //         child: Container(
              //           height: 60.0,
              //           decoration: BoxDecoration(
              //               color: myRedColor,
              //               borderRadius: BorderRadius.circular(8.0)),
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       '09:00 Am',
              //                       style: TextStyle(color: Colors.white),
              //                     ),
              //                     const SizedBox(
              //                       height: 6.0,
              //                     ),
              //                     Text(
              //                       'Design team meating',
              //                       style: TextStyle(color: Colors.white),
              //                     ),
              //                   ],
              //                 ),
              //                 Icon(
              //                   Icons.check_circle_outline,
              //                   color: Colors.white,
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              //**********task item ********************

            ],
          ),
        );
      },
    );
  }
}
