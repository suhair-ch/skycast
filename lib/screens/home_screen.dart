import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skycast/bloc/weather_bloc_bloc.dart';
import 'package:skycast/model/icon.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  weathericons icon = weathericons();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
            builder: (context, state) {
          if (state is WeatherBlocSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(3, -0.3),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 222, 224, 224)),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.57, -0.1),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, -1.2),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 156, 229, 241)),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                    child: Container(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${state.weather.areaName}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${state.weather.cloudiness}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 25),
                        ),
                        icon.getweathericon(
                            state.weather.weatherConditionCode!),
                        Center(
                          child: Text(
                            '${state.weather.temperature!.celsius!.round()}\u00B0',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 54,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Center(
                          child: Text(
                            '${state.weather.weatherMain!.toUpperCase()}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Center(
                          child: Text(
                            DateFormat('EE dd .')
                                .add_jm()
                                .format(state.weather.date!),
                            // 'Friday 16  . 9.45 am',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/re.png',
                                  scale: 50,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  children: [
                                    Text(
                                      'sunrise',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                        DateFormat('EE dd')
                                            .add_jm()
                                            .format(state.weather.sunrise!),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700))
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/t.png.png',
                                  scale: 50,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  children: [
                                    Text(
                                      'sunset',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                        DateFormat('EE dd .')
                                            .add_jm()
                                            .format(state.weather.sunset!),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.5),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/re.png',
                                  scale: 50,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  children: [
                                    Text(
                                      'temp min ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(width: 3),
                                    Text(('${state.weather.tempMin!}\u00B0'),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700))
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/t.png.png',
                                  scale: 60,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  children: [
                                    Text(
                                      'temp max ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(width: 3),
                                    Text(('${state.weather.tempMax!}\u00B0'),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            print("oop");
            return Container();
          }
        }),
      ),
    );
  }
}
