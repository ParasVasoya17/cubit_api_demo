import 'package:cubit_postmethod_api/post_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_repository.dart';

class SendOtpCubit extends Cubit<PostState> {
  SendOtpCubit({required this.repository}) : super(InitialState());

  final SendOtpRepository repository;

  void sendOtp(phone) async {
    try {
      emit(LoadingState());
      final otp = await repository.sendOtp(phone);
      emit(LoadedState(otp));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
