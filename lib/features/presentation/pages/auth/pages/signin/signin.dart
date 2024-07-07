import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/constants/custom_loading_indicator.dart';
import 'package:spotify/core/utils/widgets/app_bar/logo_app_bar.dart';
import 'package:spotify/features/presentation/pages/auth/pages/signin/signin_body.dart';
import '../../../../../../core/utils/resources/route_manager.dart';
import '../../../../bloc/auth_bloc/auth_bloc.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppBar(),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
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
            listener: (context, state) {
              if (state is SigninSuccess) {
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
              current is AuthLoading || current is SigninSuccess,
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
