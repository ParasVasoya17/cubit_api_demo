import 'package:cubit_postmethod_api/get_all_business/get_all-business_state.dart';
import 'package:cubit_postmethod_api/get_all_business/get_all_business_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllBusinessCubit extends Cubit<GetAllBusinessState> {
  GetAllBusinessCubit({required this.repository}) : super(InitialState()) {
    GetAllBusiness();
  }

  final GetAllBusinessRepository repository;

  void GetAllBusiness() async {
    try {
      emit(LoadingState());
      final getBusiness = await repository.getAllBusiness();
      emit(LoadedState(getBusiness));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
