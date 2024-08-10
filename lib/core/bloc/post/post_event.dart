import '../../model/post_model.dart';

abstract class PostEvent {}

class GetAllPostEvent extends PostEvent {
  List<PostModel>? posts;

  GetAllPostEvent({this.posts});
}
