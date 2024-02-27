import 'package:cubit_postmethod_api/add_business/addbusiness_repository.dart';
import 'package:cubit_postmethod_api/add_business/addbusiness_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AddBusinessCubit extends Cubit<AddBusinessState> {
  AddBusinessCubit({required this.repository}) : super(InitialState());
  // {
  //   postUser();
  // }

  final AddBusinessRepository repository;

  void postUser(logo, namecontroller, phonecontroller, emailcontroller,
      addresscontroller, websitecontroller) async {
    try {
      emit(LoadingState());
      final addbusiness = await repository.addBusiness(
          logo,
          namecontroller,
          phonecontroller,
          emailcontroller,
          addresscontroller,
          websitecontroller);
      emit(LoadedState(addbusiness));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
