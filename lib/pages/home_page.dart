import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

import 'body_states/defult_body.dart';
import 'body_states/failure_body.dart';
import 'body_states/success_body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: Icon(Icons.search),
            ),
          ],
          title: Text('Weather App'),
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherSuccess) {
              var weatherData =
                  BlocProvider.of<WeatherCubit>(context).weatherData;
              return SuccessBody(weatherData: weatherData);
            } else if (state is WeatherFailure) {
              return FailureBody();
            } else {
              return defult_body();
            }
          },
        ));
  }
}
