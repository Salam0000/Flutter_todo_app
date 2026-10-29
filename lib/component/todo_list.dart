import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/pages/details.dart';
import 'package:todo_app/utils/sp_helper.dart';

import '../bloc/cubits/task_cubit.dart';

class TodoList extends StatefulWidget {
  final TaskModel tm;
  final int index;
  final Function()? onTap;
  const TodoList({
    Key? key,
    required this.index,
    required this.tm,
    this.onTap,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.tm.title),
      subtitle: Text(widget.tm.description),
      onTap: widget.onTap,
      leading: Checkbox(
        value: widget.tm.isDone,
        onChanged: (value) {},
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Are you sure ?"),
              content: const Text("Do you want to delete this item ?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text(
                    "No",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    TasksCubit.get(context).remove(widget.index);
                    Navigator.pop(context);
                  },
                  child: const Text("Yes"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
