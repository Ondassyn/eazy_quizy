import 'package:eazy_quizy/common/helper/navigator/app_navigator.dart';
import 'package:eazy_quizy/core/configs/assets/app_images.dart';
import 'package:eazy_quizy/core/configs/assets/app_vectors.dart';
import 'package:eazy_quizy/core/configs/theme/app_colors.dart';
import 'package:eazy_quizy/presentation/auth/pages/signin.dart';
import 'package:eazy_quizy/presentation/home/pages/home.dart';
import 'package:eazy_quizy/presentation/home/pages/home_dispatcher.dart';
import 'package:eazy_quizy/presentation/home/pages/host_home.dart';
import 'package:eazy_quizy/presentation/splash/bloc/splash_cubit.dart';
import 'package:eazy_quizy/presentation/splash/bloc/splash_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, SigninPage());
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(context, const HomeDispatcher());
        }
      },
      child: const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Image(image: AssetImage(AppImages.appLogo)),
          ),
        ),
      ),
    );
  }
}
