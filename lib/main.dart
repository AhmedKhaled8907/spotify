import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/constants/app_bloc_observer.dart';
import 'package:spotify/core/utils/functions/init_hydrated_bloc.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/theme/app_theme.dart';
import 'package:spotify/core/utils/widgets/favorite_button/favorite_button_cubit/favorite_button_cubit.dart';
import 'package:spotify/features/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:spotify/core/utils/constants/service_locator.dart';
import 'package:spotify/features/presentation/pages/song_player.dart/song_player_cubit/song_player_cubit.dart';

import 'core/utils/functions/init_firebase.dart';
import 'core/utils/resources/route_manager.dart';
import 'features/presentation/pages/choose_mode/bloc/theme_cubit.dart';

void main() async {
  await initHydratedBloc();
  await initFirebase();
  await initServiceLocator();
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => sl<SongPlayerCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<FavoriteButtonCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            themeMode: mode,
            theme: lightTheme(context),
            darkTheme: darkTheme(context),
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: AppRoutes.splashRoute,
          );
        },
      ),
    );
  }
}
