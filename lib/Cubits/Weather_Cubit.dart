import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Weather_States.dart';
import 'package:weather_app/models/Weather_Model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
   try{
     WeatherModel weatherModel = await weatherService.getWeaher(cityName: cityName);
     emit(WeatherSuccess(weatherModel: weatherModel));
   }catch(e){
    emit(WeatherFailure());}
  }
}
