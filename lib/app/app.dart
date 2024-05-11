import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toad_app/app/features/home/ui/cubit/home_cubit.dart';
import 'package:toad_app/app/shared/ui/app_colors.dart';

import 'package:toad_app/core/navigation/app_navigation_config.dart';

class ToadAppApp extends StatelessWidget {
  const ToadAppApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllTasks(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.lightBlue),
          useMaterial3: false,
        ),
        routerConfig: AppRouterConfig.goRouter,
      ),
    );
  }
}
