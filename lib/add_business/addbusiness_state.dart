import 'package:equatable/equatable.dart';

abstract class AddBusinessState extends Equatable {}

class InitialState extends AddBusinessState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AddBusinessState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AddBusinessState {
  LoadedState(this.addbusiness);

  // final List<PostModel> post;
  final addbusiness;
  @override
  List<Object> get props => [addbusiness];
}

class ErrorState extends AddBusinessState {
  @override
  List<Object> get props => [];
}
