import 'package:cubit_postmethod_api/get_business/get_business_model.dart';
import 'package:equatable/equatable.dart';

abstract class GetBusinessState extends Equatable {}

class InitialState extends GetBusinessState {
  @override
  List<Object> get props => [];
}

class LoadingState extends GetBusinessState {
  @override
  List<Object> get props => [];
}

class LoadedState extends GetBusinessState {
  LoadedState(this.get);

  final GetBusinessModel get;
  // final getBusiness;
  @override
  List<Object> get props => [get];
}

class ErrorState extends GetBusinessState {
  @override
  List<Object> get props => [];
}
