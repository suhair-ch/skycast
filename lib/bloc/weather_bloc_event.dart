part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherBlocEvent {
  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherBlocEvent {
  final Position position;

  FetchWeather(this.position);
  @override
  List<Object> get props => [position];
}
