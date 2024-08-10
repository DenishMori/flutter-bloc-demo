import 'package:bloc_demo/app/service/api_client.dart';
import 'package:bloc_demo/core/bloc/post/post_event.dart';
import 'package:bloc_demo/core/bloc/post/post_state.dart';
import 'package:bloc_demo/core/model/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  ApiClient client = ApiClient();
  PostBloc() : super(PostInitialState()) {
    on<GetAllPostEvent>(
      (event, emit) async {
        emit.call(PostLoadingState());
        try {
          List<PostModel> posts = await client.getPostDetails();
          emit.call(
            PostLoadedState(
              posts: posts,
            ),
          );
        } catch (e) {
          emit.call(
            PostErrorState(
              error: e.toString(),
            ),
          );
        }
      },
    );
  }
}
