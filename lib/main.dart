import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/cubits/task_cubit.dart';

Future<void> main(List<String> args) async {
  //Future : any value takes time to get it.
  //Future of sp is sp after i wait awhile.
  //we  put it in main because main execute one time.
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp =
      await SharedPreferences.getInstance(); //await before run =>error
  // SPHelper.init(sp);
  // SPHelper.getData();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TasksCubit>(
            create: ((context) => TasksCubit(sp)..getData()))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        colorScheme: const ColorScheme(
            secondary: Colors.red,
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.cyan,
            onBackground: Colors.grey,
            surface: Colors.green,
            onSurface: Colors.black,
            primary: Colors.black38,
            brightness: Brightness.light,
            onPrimary: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}
