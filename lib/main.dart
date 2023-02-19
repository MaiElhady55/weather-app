import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screens/home_page.dart';
import 'package:weather_app/services/weather_service.dart';

import 'Cubits/Weather_Cubit.dart';

void main() {
  runApp(
      BlocProvider(create: (_) => WeatherCubit(WeatherService()), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel== null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
