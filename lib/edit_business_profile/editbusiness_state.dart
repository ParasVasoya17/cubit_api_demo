import 'package:equatable/equatable.dart';

abstract class EditBusinessState extends Equatable {}

class InitialState extends EditBusinessState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends EditBusinessState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends EditBusinessState {
  LoadedState(this.editbusiness);
  // ignore: prefer_typing_uninitialized_variables
  final editbusiness;

  @override
  List<Object?> get props => [editbusiness];
}

class ErrorState extends EditBusinessState {
  @override
  List<Object?> get props => [];
}
