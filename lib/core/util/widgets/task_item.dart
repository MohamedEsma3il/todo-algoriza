import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_algoriza/core/util/blocs/cubit.dart';
import 'package:todo_algoriza/core/util/colors.dart';

class BuildTaskItem extends StatelessWidget {
  BuildTaskItem({
    Key? key,
    required this.model,
  }) : super(key: key);
  final Map<dynamic, dynamic> model;

//BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
      child: Row(
        children: [
          Checkbox(
            value: model['isCompleted'] == 1 ? true : false,
            onChanged: (val) {
              // AppCubit.get(context).changeCheckBoxValue(
              //   value: val,
              //);
            },
            side: BorderSide(
                color: model['color'] == 0
                    ? myRedColor
                    : model['color'] == 1
                        ? myOrangeColor
                        : model['color'] == 2
                            ? myYellowColor
                            : myBlueColor,
                width: 2.0),
            activeColor: model['color'] == 0
                ? myRedColor
                : model['color'] == 1
                ? myOrangeColor
                : model['color'] == 2
                ? myYellowColor
                : myBlueColor,
          ),
          //const SizedBox(width: 2.0,),
          Expanded(
              child: Text(
            '${model['title']}',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
          //Spacer(),
          SizedBox(
            width: 144,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).updateIsCompletedData(
                          isCompleted: 1, id: model['id']);
                    },
                    icon: Icon(
                      Icons.done_outline,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).updateIsCompletedData(
                          isCompleted: 0, id: model['id']);
                    },
                    icon: Icon(
                      Icons.remove_done_outlined,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).updateIsFavoriteData(
                          isFavorite: model['isFavorite'] == 0 ? 1 : 0,
                          id: model['id']);
                    },
                    icon: Icon(
                      model['isFavorite'] == 0
                          ? Icons.favorite_border_outlined
                          : Icons.favorite,
                      color: Colors.red,
                    )),
              ],
            ),
          ),

          // IconButton(onPressed: (){
          //   AppCubit.get(context).updateIsFavoriteData(isFavorite: 0, id: model['id']);
          // }, icon: Icon(Icons.highlight_remove_outlined,color: Colors.black)),
        ],
      ),
    );
  }
}
