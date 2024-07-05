import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spotify/features/presentation/pages/auth/pages/signup_form.dart';

import '../../../../../core/utils/resources/strings_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import '../../../../../core/utils/widgets/or_with_dividers.dart';
import '../../../../../core/utils/widgets/support_text.dart';

class SignUpPageBody extends StatelessWidget {
  const SignUpPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadeInRight(
        duration: const Duration(milliseconds: AppDuration.d500),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p64,
            horizontal: AppPadding.p30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // register text
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.register,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(height: AppSize.s24),

              const SupportText(),

              const SizedBox(height: AppSize.s25),

              // full name text field
              const SignUpForm(),

              const SizedBox(height: AppSize.s25),

              // Or text and dividers
              const OrWithDividers()
            ],
          ),
        ),
      ),
    );
  }
}
