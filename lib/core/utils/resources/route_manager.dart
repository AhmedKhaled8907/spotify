import 'package:flutter/material.dart';
import 'package:spotify/core/utils/constants/no_route.dart';
import 'package:spotify/features/data/models/song/song_model.dart';
import 'package:spotify/features/presentation/pages/auth/pages/signin/signin.dart';
import 'package:spotify/features/presentation/pages/auth/pages/signin_or_signup.dart';
import 'package:spotify/features/presentation/pages/auth/pages/signup/signup.dart';
import 'package:spotify/features/presentation/pages/choose_mode/pages/choose_mode.dart';
import 'package:spotify/features/presentation/pages/get_started/pages/get_started.dart';
import 'package:spotify/features/presentation/pages/song_player.dart/song_player.dart';
import 'package:spotify/features/presentation/pages/splash/pages/splash.dart';

import '../../../features/presentation/pages/home/pages/home.dart';

class AppRoutes {
  static const String splashRoute = "/";
  static const String getStartedRoute = "/GetStarted";
  static const String chooseModeRoute = "/ChooseMode";
  static const String signinOrSignupRoute = "/signinOrSignup";
  static const String signinRoute = "/login";
  static const String signupRoute = "/signup";
  static const String homeRoute = "/home";
  static const String songPlayerRoute = "/songPlayer";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.splashRoute:
      //   return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoutes.getStartedRoute:
        return MaterialPageRoute(builder: (_) => const GetStartedPage());
      case AppRoutes.chooseModeRoute:
        return MaterialPageRoute(builder: (_) => const ChooseModePage());
      case AppRoutes.signinOrSignupRoute:
        return MaterialPageRoute(builder: (_) => const SignInOrSignUpPage());
      case AppRoutes.signinRoute:
        return MaterialPageRoute(builder: (_) => const SigninPage());
      case AppRoutes.signupRoute:
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.songPlayerRoute:
        final args = settings.arguments as SongModel;
        return MaterialPageRoute(builder: (_) => SongPlayer(model: args));

      default:
        return noRoute();
    }
  }

  static Route<dynamic> noRoute() {
    return MaterialPageRoute(
      builder: (_) => const NoRoutePage(),
    );
  }
}
