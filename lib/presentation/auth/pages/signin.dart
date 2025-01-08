import 'package:eazy_quizy/common/bloc/button/button_state.dart';
import 'package:eazy_quizy/common/bloc/button/button_state_cubit.dart';
import 'package:eazy_quizy/common/helper/navigator/app_navigator.dart';
import 'package:eazy_quizy/common/widgets/appbar/app_bar.dart';
import 'package:eazy_quizy/common/widgets/button/basic_app_button.dart';
import 'package:eazy_quizy/common/widgets/button/basic_reactive_button.dart';
import 'package:eazy_quizy/common/widgets/textfield/app_textformfield.dart';
import 'package:eazy_quizy/data/auth/models/user_signin_req.dart';
import 'package:eazy_quizy/domain/auth/usecases/signin.dart';
import 'package:eazy_quizy/presentation/auth/pages/enter_password.dart';
import 'package:eazy_quizy/presentation/auth/pages/signup.dart';
import 'package:eazy_quizy/presentation/home/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: true,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            child: BlocProvider(
              create: (context) => ButtonStateCubit(),
              child: BlocListener<ButtonStateCubit, ButtonState>(
                listener: (context, state) {
                  if (state is ButtonFailureState) {
                    var snackbar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.errorMessage),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }

                  if (state is ButtonSuccessState) {
                    AppNavigator.pushAndRemove(context, const Home());
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _siginText(context),
                    const SizedBox(
                      height: 20,
                    ),
                    _emailField(context),
                    const SizedBox(
                      height: 20,
                    ),
                    _passwordField(context),
                    const SizedBox(
                      height: 40,
                    ),
                    _signinButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return const Center(
      child: Text(
        'Sign in',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return AppTextFormField(
      controller: _emailCon,
      labelText: 'Enter email',
    );
  }

  Widget _passwordField(BuildContext context) {
    return AppTextFormField(
      controller: _passwordCon,
      labelText: 'Enter password',
      obscureText: true,
    );
  }

  Widget _signinButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                usecase: SigninUseCase(),
                params: UserSigninReq(
                    email: _emailCon.text.trim(),
                    password: _passwordCon.text.trim()));
          },
          title: 'Continue');
    });
  }
}
