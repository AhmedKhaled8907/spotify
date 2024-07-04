import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/utils/resources/color_manager.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify/core/utils/widgets/basic_app_button.dart';

import '../../../../../core/utils/constants/assets.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import '../../../../../core/utils/widgets/or_with_dividers.dart';
import '../../../../../core/utils/widgets/support_text.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          Assets.vectorsSpotifyLogo,
          width: AppSize.s40,
          height: AppSize.s40,
          fit: BoxFit.cover,
        ),
      ),
      body: SingleChildScrollView(
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
              _fullNameField(),
              const SizedBox(height: AppSize.s16),
              // email text field
              __emailField(),
              const SizedBox(height: AppSize.s16),
              // password text field
              _passwordField(),
              const SizedBox(height: AppSize.s36),

              // register button
              BasicAppButton(
                title: AppStrings.createAccount,
                onPressed: () {},
              ),

              const SizedBox(height: AppSize.s25),

              // Or text and dividers
              const OrWithDividers()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.haveAccount,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.signIn,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField __emailField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: AppStrings.email,
      ),
    );
  }

  TextField _fullNameField() {
    return const TextField(
      decoration: InputDecoration(
        hintText: AppStrings.fullName,
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
