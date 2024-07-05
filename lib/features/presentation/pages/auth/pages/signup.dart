import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/constants/custom_loading_indicator.dart';
import 'package:spotify/core/utils/widgets/app_bar/logo_app_bar.dart';
import 'package:spotify/features/presentation/pages/auth/pages/signup_body.dart';
import '../../../../../core/utils/resources/route_manager.dart';
import '../../../bloc/auth_bloc/auth_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppBar(),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listenWhen: (previous, current) => current is AuthFailure,
            listener: (context, state) {
              if (state is AuthFailure) {
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
            listenWhen: (previous, current) => current is AuthSuccess,
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.rootRoute,
                  (route) => false,
                );
              }
            },
          ),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) =>
              current is AuthSuccess || current is AuthLoading,
          builder: (context, state) {
            if (state is AuthLoading) {
              return const CustomLoadingIndicator();
            }
            return const SignUpPageBody();
          },
        ),
      ),
    );
  }
}
