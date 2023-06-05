import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/cubit/weather_stats.dart';

import '../../data/helper.dart';

class WeatherCubit extends Cubit<WeatherStats>{

  WeatherCubit(): super(WeatherInitState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  String location = '';
  double current = 0;
  double windKph = 0;
  String icon='';
  String condition='';

  void getWeather() {
    emit(WeatherLoadingState());
    DioHelper.getData(url: 'v1/current.json', query: {
      'key': '41685d2dc63447cf803154920230206',
      'q': 'cairo',
      'aqi': 'no'
    }).then((value) {
      location = value.data['location']['name'];
      current = value.data['current']['temp_c'];
      windKph = value.data['current']['wind_kph'];
      icon=value.data['current']['condition']['icon'];
      condition=value.data['current']['condition']['text'];
      emit(WeatherSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(WeatherErrorState(error.toString()));
    });
  }


}