import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/utils/constants/assets.dart';

import '../../../../../core/utils/resources/route_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          Assets.vectorsSpotifyLogo,
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(
      const Duration(seconds: AppDuration.d2),
      () => Navigator.of(context).pushReplacementNamed(
        AppRoutes.getStartedRoute,
      ),
    );
  }
}
