import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/core/util/widgets/default_form_field.dart';
import 'package:todo_algoriza/core/util/widgets/my_button.dart';
import 'package:todo_algoriza/core/util/widgets/my_divider.dart';
import 'package:todo_algoriza/core/util/blocs/cubit.dart';
import 'package:todo_algoriza/core/util/blocs/states.dart';
import 'package:intl/intl.dart';

class AddTaskWidget extends StatelessWidget {
  AddTaskWidget({Key? key}) : super(key: key);

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  var selectedReminderTime;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const MyDivider(),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //*************title*********************
                          const Text(
                            'Title',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          const SizedBox(height: 10),
                          DefaultFormField(
                            validate: (value) {
                              if (value!.isEmpty) {
                                return ('Title is required');
                              } else {
                                return null;
                              }
                            },
                            controller: titleController,
                            isPassword: false,
                            type: TextInputType.text,
                            label: '',
                          ),
                          const SizedBox(height: 20),
                          //***************date********************
                          const Text(
                            'Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          const SizedBox(height: 10),
                          DefaultFormField(
                            validate: (value) {
                              if (value!.isEmpty) {
                                return ('Date is required');
                              } else {
                                return null;
                              }
                            },
                            controller: dateController,
                            isPassword: false,
                            type: TextInputType.datetime,
                            label: '',
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2025-12-30'))
                                  .then((value) {
                                dateController.text =
                                    DateFormat.yMMMd().format(value!);
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          //**********time*************************
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Start time',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    const SizedBox(height: 10),
                                    DefaultFormField(
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return ('Start Time is required');
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: startTimeController,
                                      isPassword: false,
                                      type: TextInputType.datetime,
                                      label: '',
                                      suffix: Icons.watch_later_outlined,
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          startTimeController.text =
                                              value!.format(context).toString();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 150.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'End time',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    const SizedBox(height: 10),
                                    DefaultFormField(
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return ('End Time is required');
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: endTimeController,
                                      isPassword: false,
                                      type: TextInputType.datetime,
                                      label: '',
                                      suffix: Icons.watch_later_outlined,
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          endTimeController.text =
                                              value!.format(context).toString();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          //***********reminder********
                          const Text(
                            'Remind',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            validator: (value) {
                              if (value == null) {
                                return ('Reminder Time is required');
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: const OutlineInputBorder(),
                            ),
                            items: [
                              '1 day before',
                              '1 hour before',
                              '30 min before',
                              ' 10 min before'
                            ]
                                .map((e) => DropdownMenuItem(
                                      child: Text("$e "),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (val) {
                              AppCubit.get(context).changeReminderMenu(
                                selectedItem: selectedReminderTime,
                                value: val,
                              );
                            },
                            value: selectedReminderTime,
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          MyButton(
                              text: 'create task',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  debugPrint('validation success');
                                }
                              }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
