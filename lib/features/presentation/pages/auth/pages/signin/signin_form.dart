import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/constants/app_validators.dart';
import 'package:spotify/core/utils/widgets/basic_app_button.dart';

import '../../../../../../core/utils/resources/strings_manager.dart';
import '../../../../../../core/utils/resources/values_manager.dart';
import '../../../../../../core/utils/widgets/forgot_password_button.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
// controllers
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // email form text field
          TextFormField(
            controller: emailController,
            focusNode: emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: AppStrings.email,
            ),
            validator: (value) {
              return AppValidators.emailValidator(value);
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
          ),
          const SizedBox(height: AppSize.s16),

          // password form text field
          TextFormField(
            controller: passwordController,
            focusNode: passwordFocusNode,
            obscureText: isObscure,
            decoration: InputDecoration(
              hintText: AppStrings.password,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: isObscure
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            validator: (value) {
              return AppValidators.passwordValidator(value);
            },
            onFieldSubmitted: (value) {
              _signinUser(context);
            },
          ),

          const SizedBox(height: AppSize.s8),

          // forgot password
          Align(
            alignment: Alignment.topLeft,
            child: ForgotPasswordButton(
              onPressed: () {},
            ),
          ),

          const SizedBox(height: AppSize.s24),

          // register button
          BasicAppButton(
            title: AppStrings.signIn,
            onPressed: () {
              _signinUser(context);
            },
          ),
        ],
      ),
    );
  }

  void _signinUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();

      context.read<AuthBloc>().add(
            SigninEvent(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    }
  }
}
