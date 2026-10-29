import 'package:flutter/material.dart';
import 'package:todo_app/bloc/cubits/task_cubit.dart';
import 'package:todo_app/models/task_model.dart';

class Details extends StatefulWidget {
  final TaskModel? tm;
  final titleController = TextEditingController();
  final descController = TextEditingController();
  bool isDone = false;
  final int index;
  Details({
    Key? key,
    this.tm,
    required this.index,
  }) : super(key: key) {
    if (tm == null) {
      titleController.text = "";
      descController.text = "";
      isDone = false;
    } else {
      titleController.text = tm!.title;
      descController.text = tm!.description;
      isDone = tm!.isDone;
    }
  }

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // get value from TextField
  String title = "";
  String description = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Details",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text("Title"),
            TextFormField(
              controller: widget.titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("title"),
              ),
              // onChanged: (value) => title = value,
            ),
            const SizedBox(
              height: 8,
            ),
            // const Text("Descrption"),
            TextFormField(
              controller: widget.descController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Descrption"),
              ),
              // onChanged: (value) => description = value,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Is Done ?"),
                Checkbox(
                  value: widget.isDone,
                  onChanged: (value) {
                    setState(() {
                      widget.isDone = value ?? false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //inkwell it allow to press
                  width: 660,
                  // color: Colors.black,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (widget.tm == null) {
                        await TasksCubit.get(context).add(TaskModel(
                            title: widget.titleController.text.trim(),
                            description: widget.descController.text.trim(),
                            isDone: widget.isDone));
                      } else {
                        TasksCubit.get(context).edit(
                            widget.index,
                            TaskModel(
                                title: widget.titleController.text.trim(),
                                description: widget.descController.text.trim(),
                                isDone: widget.isDone));
                      }
                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
