import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:skycast/data/mydata.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        print('Latitude: ${event.position.latitude}, Longitude: ${event.position.longitude}');
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
          // WeatherFactory.CURRENT_WEATHER
      event.position.latitude, event.position.longitude
           );
        print(weather);
        emit(WeatherBlocSuccess(weather));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
//135da4f8722b429bbb31fe9c977c253a