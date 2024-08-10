import 'package:bloc_demo/core/model/post_model.dart';

abstract class PostState {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  List<PostModel>? posts;
  PostLoadedState({this.posts});
}

class PostErrorState extends PostState {
  String error;

  PostErrorState({
    required this.error,
  });
}
