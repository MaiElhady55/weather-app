import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Weather_Cubit.dart';

class SearchPage extends StatelessWidget {
  @override
  String? cityName;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            onChanged: (value) {
              cityName = value;
              print(cityName);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              border: OutlineInputBorder(),
              labelText: 'search',
              hintText: 'Enter City Name',
              suffixIcon: IconButton(
                  onPressed: () async {
                    try {
                      BlocProvider.of<WeatherCubit>(context)
                          .getWeather(cityName: cityName!);
                      BlocProvider.of<WeatherCubit>(context).cityName =
                          cityName;
                      Navigator.of(context).pop();
                    } catch (e) {
                      return showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                                title: Text(
                                  'invalid City Name',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      e.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Divider(),
                                  ],
                                ),
                                backgroundColor: Colors.red[400],
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.of(ctx).pop(),
                                      child: Text(
                                        'Cancle',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ]);
                          });
                    }
                  },
                  icon: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
