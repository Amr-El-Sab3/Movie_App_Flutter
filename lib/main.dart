import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/screens/home_page.dart';
import 'package:movies_app/blocs/cast_bloc/cast_bloc.dart';
import 'package:movies_app/blocs/details_bloc/details_bloc.dart';
import 'package:movies_app/blocs/login_bloc/login_bloc.dart';
import 'package:movies_app/blocs/movie_bloc/movies_bloc.dart';
import 'package:movies_app/logic/movie_repo.dart';
import 'package:movies_app/logic/api_service.dart';

import 'UI/app_theme/app_theme.dart';



class MyBlocObserver extends BlocObserver {
  // @override
  // void onCreate(Cubit cubit) {
  //   super.onCreate(cubit);
  //   print('onCreate -- cubit: ${cubit.runtimeType}');
  // }
  //
  // @override
  // void onChange(Cubit cubit, Change change) {
  //   super.onChange(cubit, change);
  //   print('onChange -- cubit: ${cubit.runtimeType}, change: $change');
  // }
  //
  // @override
  // void onError(Cubit cubit, Object error, StackTrace stackTrace) {
  //   print('onError -- cubit: ${cubit.runtimeType}, error: $error');
  //   super.onError(cubit, error, stackTrace);
  // }
  //
  // @override
  // void onClose(Cubit cubit) {
  //   super.onClose(cubit);
  //   print('onClose -- cubit: ${cubit.runtimeType}');
  // }
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (context) => MovieBloc(MovieRepository(MovieService())),


        ),
        BlocProvider<DetailsBloc>(
          create: (context) => DetailsBloc(MovieRepository(MovieService())),
        ),
        BlocProvider<CastBloc>
          (create: (context) => CastBloc(MovieRepository(MovieService())),),

        BlocProvider<AuthBloc>
          (create:  (context) => AuthBloc())

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const HomePage(),
      ),
    );
  }
}
