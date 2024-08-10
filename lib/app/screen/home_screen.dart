import 'package:bloc_demo/app/widgets/user_tile.dart';
import 'package:bloc_demo/core/bloc/post/post_bloc.dart';
import 'package:bloc_demo/core/bloc/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context,state) {
          if (state is PostLoadingState || state is PostInitialState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (state is PostLoadedState) {
            return ListView.builder(
              itemCount: state.posts?.length,
              itemBuilder: (context, index) {
                return UserTile(
                  imageUrl: state.posts![index].thumbnailUrl!,
                  title: state.posts![index].title!,
                );
              },
            );
          } else if (state is PostErrorState) {
            WidgetsBinding.instance.addPostFrameCallback((callback) {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text(state.error.toString()),
                    );
                  });
            });
            return const SizedBox.shrink();
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
