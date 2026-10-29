import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/cubits/task_cubit.dart';
import 'package:todo_app/bloc/states/task_states.dart';
import 'package:todo_app/pages/details.dart';
import '../component/todo_list.dart';

class HomePage extends StatefulWidget {
  static Function()? refresh;
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    // SPHelper.refreshPage = () {
    //   setState(() {});
    // };
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        centerTitle: true,
      ),
      body: BlocConsumer<TasksCubit, TaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          TasksCubit tasksCubit = TasksCubit.get(context);
          return ListView.builder(
            itemBuilder: (context, index) {
              return TodoList(
                index: index,
                tm: tasksCubit.taskList[index],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return Details(
                          tm: tasksCubit.taskList[index],
                          index: index,
                        );
                      },
                    ),
                  );
                },
              );
            },
            itemCount: tasksCubit.taskList.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return Details(
                  tm: null,
                  index: -1,
                );
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
