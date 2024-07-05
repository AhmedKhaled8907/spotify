import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/utils/constants/custom_loading_indicator.dart';
import 'package:spotify/core/utils/resources/color_manager.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/features/presentation/pages/auth/pages/signup_body.dart';
import '../../../../../core/utils/constants/assets.dart';
import '../../../../../core/utils/resources/route_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _buildAppBar(),
      ),
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

      // bottom nav
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
        child: FadeInRight(
          duration: const Duration(milliseconds: AppDuration.d500),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.haveAccount,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                    AppRoutes.signinRoute,
                  );
                },
                child: Text(
                  AppStrings.signIn,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FadeInRight _buildAppBar() {
    return FadeInRight(
      duration: const Duration(milliseconds: AppDuration.d500),
      child: SvgPicture.asset(
        Assets.vectorsSpotifyLogo,
        width: AppSize.s40,
        height: AppSize.s40,
        fit: BoxFit.cover,
      ),
    );
  }
}
