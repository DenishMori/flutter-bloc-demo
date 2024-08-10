import 'package:bloc_demo/app/screen/home_screen.dart';
import 'package:bloc_demo/core/bloc/post/post_bloc.dart';
import 'package:bloc_demo/core/bloc/post/post_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (BuildContext context) => PostBloc()..add(GetAllPostEvent()),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
