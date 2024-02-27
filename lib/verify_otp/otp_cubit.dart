import 'package:cubit_postmethod_api/post_state.dart';
import 'otp_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOtpCubit extends Cubit<PostState> {
  VerifyOtpCubit({required this.repository}) : super(InitialState());

  final VerifyOtpRepository repository;

  void verifyOtp(phone, otp) async {
    try {
      emit(LoadingState());
      final verifyotp = await repository.verifyotp(phone, otp);
      emit(LoadedState(verifyotp));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
