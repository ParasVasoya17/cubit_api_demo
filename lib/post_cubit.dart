import 'package:cubit_postmethod_api/post_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'post_repository.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit({required this.repository}) : super(InitialState());
  // {
  //   postUser();
  // }

  final PostRepository repository;

  void postUser(logo, namecontroller, phonecontroller, emailcontroller,
      websitecontroller) async {
    try {
      emit(LoadingState());
      final post = await repository.postPost(logo, namecontroller,
          phonecontroller, emailcontroller, websitecontroller);
      emit(LoadedState(post));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
