import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spotify/core/utils/resources/color_manager.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/widgets/basic_app_button.dart';

import '../../../../../core/utils/resources/route_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import '../../../../../core/utils/widgets/app_bar/logo_app_bar.dart';
import '../../../../../core/utils/widgets/forgot_password_button.dart';
import '../../../../../core/utils/widgets/or_with_dividers.dart';
import '../../../../../core/utils/widgets/support_text.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: FadeInRight(
              duration: const Duration(milliseconds: AppDuration.d500),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p64,
                  horizontal: AppPadding.p30,
                ).copyWith(bottom: AppPadding.p0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // signin text
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppStrings.signIn,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    const SizedBox(height: AppSize.s24),

                    const SupportText(),

                    const SizedBox(height: AppSize.s25),

                    // email text field
                    _usernameOrEmailField(),
                    const SizedBox(height: AppSize.s16),
                    // password text field
                    _passwordField(),

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
                      onPressed: () {},
                    ),

                    const SizedBox(height: AppSize.s25),

                    // Or text and dividers
                    const OrWithDividers(),

                    const Expanded(child: SizedBox()),

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p16),
                      child: FadeInRight(
                        duration:
                            const Duration(milliseconds: AppDuration.d500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.dontHaveAccount,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                  AppRoutes.signupRoute,
                                );
                              },
                              child: Text(
                                AppStrings.registerNow,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextField _usernameOrEmailField() {
    return const TextField(
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: AppStrings.usernameOrEmail,
      ),
    );
  }

  TextField _passwordField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: AppStrings.password,
      ),
    );
  }
}
