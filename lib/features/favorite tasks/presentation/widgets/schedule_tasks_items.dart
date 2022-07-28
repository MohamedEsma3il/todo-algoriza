import 'package:flutter/material.dart';
import 'package:todo_algoriza/core/util/colors.dart';

class ScheduleTasksItem extends StatelessWidget {
   ScheduleTasksItem({Key? key,required this.model}) : super(key: key);
  final Map<dynamic, dynamic> model;
  @override
  Widget build(BuildContext context) {
    // return ListView.separated(
    //   //shrinkWrap: true,
    //   scrollDirection: Axis.vertical,
    //   physics: BouncingScrollPhysics(),
    //   itemCount: 5,
    //   separatorBuilder: (context, index) => const SizedBox(
    //     height: 16.0,
    //   ),
    //   itemBuilder: (context, index) {
    //     return
    //
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Container(
            height: 60.0,
            decoration: BoxDecoration(
                color:model['color'] == 0
                    ? myRedColor
                    : model['color'] == 1
                    ? myOrangeColor
                    : model['color'] == 2
                    ? myYellowColor
                    : myBlueColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model['startTime']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        '${model['title']}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Icon(model['isCompleted']==1?
                    Icons.check_circle_outline:Icons.circle_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        );
      //},
    //);
  }
}
