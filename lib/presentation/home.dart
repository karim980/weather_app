import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/cubit/weather_cubit.dart';
import 'package:weather_app/presentation/cubit/weather_stats.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..getWeather(),
      child: BlocConsumer<WeatherCubit, WeatherStats>(
        listener: (context, state) {
          if (state is! WeatherLoadingState) {
            WeatherCubit.get(context).getWeather();
          }
        },
        builder: (context, state) {
          var cubit = WeatherCubit.get(context);
          String name = cubit.location;
          int temp = cubit.current.toInt();
          int windKph = cubit.current.toInt();
          String icon = cubit.icon;
          String condition = cubit.condition;

          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    ConditionalBuilder(
                      builder: (BuildContext context) {
                        return Image(
                          image: NetworkImage('http:$icon'),
                        );
                      },
                      condition: icon != null,
                      fallback: (BuildContext context) {
                        return Container();
                      },
                    ),
                    Text(
                      '$tempº',
                      style: TextStyle(fontSize: 45, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Precioitations',
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                    Text(
                      'Max: 31 Min: 25',
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.cloud,color: Colors.white,),
                            SizedBox(width: 7,),
                            Text('20',style: TextStyle(color: Colors.white),),
                            Spacer(),
                            Icon(Icons.ac_unit_sharp,color: Colors.white,),
                            SizedBox(width: 7,),
                            Text('67%',style: TextStyle(color: Colors.white),),
                            Spacer(),
                            Icon(CupertinoIcons.wind,color: Colors.white,),
                            SizedBox(width: 7,),
                            Text('$windKph km/h',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
