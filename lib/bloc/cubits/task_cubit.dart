import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/bloc/states/task_states.dart';

import '../../models/task_model.dart';



class TasksCubit extends Cubit<TaskStates> {
  TasksCubit(this.sp) : super(TasksInitState());
  List<TaskModel> taskList = [];
  SharedPreferences sp; 

  static TasksCubit get(context) => BlocProvider.of(context);

  void getData() {
    List<String> taskAsString = sp.getStringList("tasks") ?? [];
    List taskAsJson = [];

    for (var element in taskAsString) {
      taskAsJson.add(jsonDecode(element));
    }

    taskList.clear();
    for (var element in taskAsJson) {
      taskList.add(TaskModel.fromJSON(element));
    }
    // refreshPage.call();
    emit(RefreshTaskUiState());
  }

  Future<void> add(TaskModel todo) async {
    taskList.add(todo);
    await save();
    getData();
  }

  Future<void> edit(int index, TaskModel taskModel) async {
    taskList[index].title = taskModel.title;
    taskList[index].description = taskModel.description;
    taskList[index].isDone = taskModel.isDone;
    await save();
    getData();
    // TaskModel editTodo =
    // taskList.firstWhere((item) => item.toString() == todo.toString());
    // taskList[editTodo.toString()] = todo; //for the reference
  }

  Future<void> save() async {
    List taskAsJson = [];
    for (var element in taskList) {
      taskAsJson.add(element.toJSON());
    }
    List<String> taskAsString = [];
    for (var element in taskAsJson) {
      taskAsString.add(jsonEncode(element));
    }
    await sp.setStringList("tasks", taskAsString);

    // taskList.forEach((element) {
    //   Map<String, dynamic> map = element.toJSON();
    //   sp.setStringList(
    //     map.toString(),
    //     <String>[
    //       map["title"],
    //       map["description"],
    //       map["isDone"].toString(),
    //     ],
    //   );
    // });
  }

  Future<void> remove(int index) async {
    taskList.removeAt(index);
    await save();
    getData();
    // final delete = sp.remove(todo.toString());
  }
}
