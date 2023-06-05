abstract class WeatherStats {}

class WeatherInitState extends WeatherStats {}

class WeatherLoadingState extends WeatherStats {}

class WeatherSuccessState extends WeatherStats {}

class WeatherErrorState extends WeatherStats {
  final String error;

  WeatherErrorState(this.error);

}
