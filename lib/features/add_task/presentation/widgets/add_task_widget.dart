import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/core/util/widgets/default_form_field.dart';
import 'package:todo_algoriza/core/util/widgets/my_button.dart';
import 'package:todo_algoriza/core/util/widgets/my_divider.dart';
import 'package:todo_algoriza/features/add_task/presentation/cubit/cubit.dart';
import 'package:todo_algoriza/features/add_task/presentation/cubit/states.dart';

class AddTaskWidget extends StatelessWidget {
  AddTaskWidget({Key? key}) : super(key: key);

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  var selectedReminderTime;
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit,AddTaskStates>(
        listener: ( context, state) {  },
        builder: ( context,  state) { return Scaffold(
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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const SizedBox(height: 10),
                        DefaultFormField(
                          validate: ( value) {
                            if (value!.isEmpty) {
                              return ('This field is required');
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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const SizedBox(height: 10),
                        DefaultFormField(
                          validate:  ( value) {
                            if (value!.isEmpty) {
                              return ('This field is required');
                            } else {
                              return null;
                            }
                          },
                          controller: dateController,
                          isPassword: false,
                          type: TextInputType.datetime,
                          label: '',
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
                                        fontWeight: FontWeight.bold, fontSize: 18.0),
                                  ),
                                  const SizedBox(height: 10),
                                  DefaultFormField(
                                    validate:  ( value) {
                                      if (value!.isEmpty) {
                                        return ('This field is required');
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: startTimeController,
                                    isPassword: false,
                                    type: TextInputType.datetime,
                                    label: '',
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
                                        fontWeight: FontWeight.bold, fontSize: 18.0),
                                  ),
                                  const SizedBox(height: 10),
                                  DefaultFormField(
                                    validate:  ( value) {
                                      if (value!.isEmpty) {
                                        return ('This field is required');
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: endTimeController,
                                    isPassword: false,
                                    type: TextInputType.datetime,
                                    label: '',
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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField(
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
                            AddTaskCubit.get(context).changeReminderMenu(
                              selectedItem: selectedReminderTime,
                              value: val,
                            );
                          },
                          value: selectedReminderTime,
                        ),
                        SizedBox(height:60,),
                        MyButton(text: 'create task', function: (){
                          if(formKey.currentState!.validate())
                          {
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
        ); },

      ),
    );
  }
}
