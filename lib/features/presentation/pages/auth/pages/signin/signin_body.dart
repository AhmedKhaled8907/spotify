import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spotify/features/presentation/pages/auth/pages/signin/signin_form.dart';

import '../../../../../../core/utils/resources/color_manager.dart';
import '../../../../../../core/utils/resources/route_manager.dart';
import '../../../../../../core/utils/resources/strings_manager.dart';
import '../../../../../../core/utils/resources/values_manager.dart';
import '../../../../../../core/utils/widgets/or_with_dividers.dart';
import '../../../../../../core/utils/widgets/support_text.dart';

class SigninBodyPage extends StatelessWidget {
  const SigninBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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

                  const SignInForm(),

                  const SizedBox(height: AppSize.s25),

                  // Or text and dividers
                  const OrWithDividers(),

                  const Expanded(child: SizedBox()),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p16),
                    child: FadeInRight(
                      duration: const Duration(milliseconds: AppDuration.d500),
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
    );
  }
}
