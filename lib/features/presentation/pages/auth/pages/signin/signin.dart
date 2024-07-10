import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/constants/custom_loading_indicator.dart';
import 'package:spotify/core/utils/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify/features/presentation/pages/auth/pages/signin/signin_body.dart';
import '../../../../../../core/utils/resources/route_manager.dart';
import '../../../../../../core/utils/widgets/app_logo.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: AppLogo(),
        hideBack: true,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listenWhen: (previous, current) => current is AuthFailure,
            listener: (context, state) {
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listenWhen: (previous, current) => current is SigninSuccess,
            listener: (context, state) {
              if (state is SigninSuccess) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.homeRoute,
                  (route) => false,
                );
              }
            },
          ),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const CustomLoadingIndicator();
            }
            return const SigninBodyPage();
          },
        ),
      ),
    );
  }
}
