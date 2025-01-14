import 'package:eazy_quizy/common/helper/navigator/app_navigator.dart';
import 'package:eazy_quizy/core/configs/theme/app_colors.dart';
import 'package:eazy_quizy/presentation/home/bloc/dispatcher_cubit.dart';
import 'package:eazy_quizy/presentation/home/bloc/dispatcher_state.dart';
import 'package:eazy_quizy/presentation/home/pages/home.dart';
import 'package:eazy_quizy/presentation/home/pages/host_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDispatcher extends StatelessWidget {
  const HomeDispatcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DispatcherCubit()..pageStarted(),
      child: BlocListener<DispatcherCubit, DispatcherState>(
        listener: (context, state) {
          if (state is IsHost) {
            AppNavigator.pushReplacement(context, const HostHome());
          }
          if (state is IsGuest) {
            AppNavigator.pushReplacement(context, const Home());
          }
        },
        child: const Scaffold(
          backgroundColor: AppColors.background,
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
