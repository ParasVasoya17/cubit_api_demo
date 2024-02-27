import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {}

class InitialState extends PostState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PostState {
  @override
  List<Object> get props => [];
}

class LoadedState extends PostState {
  LoadedState(this.post);

  // final List<PostModel> post;
  final post;
  @override
  List<Object> get props => [post];
}

class ErrorState extends PostState {
  @override
  List<Object> get props => [];
}
