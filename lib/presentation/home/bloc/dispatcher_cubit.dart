import 'package:eazy_quizy/domain/auth/usecases/get_user.dart';
import 'package:eazy_quizy/presentation/home/bloc/dispatcher_state.dart';
import 'package:eazy_quizy/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DispatcherCubit extends Cubit<DispatcherState> {
  DispatcherCubit() : super(DispatcherLoading());

  void pageStarted() async {
    // await Future.delayed(const Duration(seconds: 2));
    var returnedData = await sl<GetUserUseCase>().call();

    returnedData.fold((error) {
      emit(DispatcherError());
    }, (data) {
      if (data.role == 'host') {
        emit(IsHost());
      }
      if (data.role == 'guest') {
        emit(IsGuest());
      }

      emit(UnknownRole());
    });
  }
}
