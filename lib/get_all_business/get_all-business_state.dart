import 'package:cubit_postmethod_api/get_all_business/get_all_business_model.dart';
import 'package:equatable/equatable.dart';

abstract class GetAllBusinessState extends Equatable {}

class InitialState extends GetAllBusinessState {
  @override
  List<Object> get props => [];
}

class LoadingState extends GetAllBusinessState {
  @override
  List<Object> get props => [];
}

class LoadedState extends GetAllBusinessState {
  LoadedState(this.getBusiness);

  final GetAllBusinessModel getBusiness;
  // final getBusiness;
  @override
  List<Object> get props => [getBusiness];
}

class ErrorState extends GetAllBusinessState {
  @override
  List<Object> get props => [];
}
