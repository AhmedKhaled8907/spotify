import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/constants/app_validators.dart';
import 'package:spotify/core/utils/widgets/basic_app_button.dart';
import 'package:spotify/features/presentation/bloc/auth_bloc/auth_bloc.dart';

import '../../../../../core/utils/resources/strings_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
// controllers
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  final _formKey = GlobalKey<FormState>();
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode fullNameFocusNode;
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    fullNameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    fullNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // full name form text field
          TextFormField(
            controller: fullNameController,
            focusNode: fullNameFocusNode,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: AppStrings.fullName,
            ),
            validator: (value) {
              return AppValidators.displayNameValidator(value);
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(emailFocusNode);
            },
          ),
          const SizedBox(height: AppSize.s16),

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
              _signupUser(context);
            },
          ),

          const SizedBox(height: 20),
          BasicAppButton(
            onPressed: () {
              _signupUser(context);
            },
            title: AppStrings.createAccount,
          ),
        ],
      ),
    );
  }

  void _signupUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();

      context.read<AuthBloc>().add(
            SignUpEvent(
              email: emailController.text,
              password: passwordController.text,
              fullName: fullNameController.text,
            ),
          );
    }
  }
}
