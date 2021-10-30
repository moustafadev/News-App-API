import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/layout/news/news_layout.dart';
import 'package:news/shared/network/local/cache_helper.dart';
import 'package:news/shared/network/remote/dio_helper.dart';
import 'package:news/shared/styles/blok_observe.dart';

void main(kye) async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(kye: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {

  final isDark;

  const MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()
          ..getBusiness()
          ..changeThemMode(formShared: isDark),
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, states) {},
          builder: (context, states) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  textTheme: const TextTheme(
                      bodyText1: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600)),
                  primarySwatch: Colors.red,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.black),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                  ),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      selectedItemColor: Colors.red,
                      type: BottomNavigationBarType.fixed,
                      elevation: 20.0)),
              darkTheme: ThemeData(
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600)),
                primarySwatch: Colors.red,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                  titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light),
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  elevation: 20.0,
                  backgroundColor: HexColor('333739'),
                ),
              ),
              themeMode: NewsCubit.get(context).isMode
                  ? ThemeMode.light
                  : ThemeMode.dark,
              home: const NewsLayout(),
            );
          },
        ));
  }
}
