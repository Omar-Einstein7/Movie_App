import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/helper/message/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/config/assets/app_vectors.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/presentation/auth/pages/signin.dart';
import 'package:movie_app/presentation/main/pages/main_page.dart';
import 'package:movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(right: 16, left: 16, bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo(),
            const SizedBox(height: 20),
            _signupText(context),
            const SizedBox(height: 30),
            _emailField(context),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 60),
            _signupButton(context),
            const SizedBox(height: 20),
            _signinText(context),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return SvgPicture.asset(AppVectors.logo, height: 40);
  }

  Widget _signupText(BuildContext context) {
    return Text(
      'Sign Up',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      obscureText: true,
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async {
        return await sl<SignupUseCase>().call(
          params: SignupReqParams(
            email: _emailCon.text,
            password: _passwordCon.text,
          ),
        );
      },

      onSuccess: () {
        AppNavigator.pushAndRemove(context, const MainPage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Do you have account? ",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
          TextSpan(
            text: 'Sign In',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SigninScreen());
              },
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
