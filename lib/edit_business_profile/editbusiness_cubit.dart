import 'package:cubit_postmethod_api/edit_business_profile/editbusiness_repository.dart';
import 'package:cubit_postmethod_api/edit_business_profile/editbusiness_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class EditBusinessCubit extends Cubit<EditBusinessState> {
  EditBusinessCubit({required this.repository}) : super(InitialState());
  final EditbusinessRepository repository;

  void editBusiness(logo, name, phone, email, address, website) async {
    try {
      emit(LoadingState());
      final editbusiness =
          repository.editBusiness(logo, name, phone, email, address, website);
      emit(LoadedState(editbusiness));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
