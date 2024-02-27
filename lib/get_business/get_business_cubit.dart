import 'package:cubit_postmethod_api/get_business/get_business_repository.dart';
import 'package:cubit_postmethod_api/get_business/get_business_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class GetBusinessCubit extends Cubit<GetBusinessState> {
  GetBusinessCubit({required this.repository}) : super(InitialState()) {
    GetBusiness();
  }

  final GetBusinessRepository repository;

  void GetBusiness() async {
    try {
      emit(LoadingState());
      final get = await repository.getBusiness();
      emit(LoadedState(get));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
