

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/modules/business/business_screen.dart';
import 'package:news/modules/setting/settings_screen.dart';
import 'package:news/modules/sience/science_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';
import 'package:news/shared/network/local/cache_helper.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialStats());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      label: 'Science',
      icon: Icon(Icons.science),
    ),
    const BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(Icons.settings),
    ),
  ];

  List<Widget> screen = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingScreen()
  ];

  void changeNavBarItem(int index) {
    currentIndex = index;
    if (index == 1)
      getSports();
    else if (index == 2) getScience();
    emit(ChangeNavBarItem());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingStates());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '449e4533841b458ba5ed334ae9382515'
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessStates());
    }).catchError((error) {
      emit(NewsGetBusinessErrorStates(error.toString()));
      print(error);
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    if (sports.length == 0) {
      emit(NewsGetSportLoadingStates());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sport',
        'apiKey': '449e4533841b458ba5ed334ae9382515'
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportSuccessStates());
      }).catchError((error) {
        emit(NewsGetSportErrorStates(error.toString()));
        print(error);
      });
    } else {
      emit(NewsGetSportSuccessStates());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    if (science.length == 0) {
      emit(NewsGetScienceLoadingStates());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '449e4533841b458ba5ed334ae9382515'
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessStates());
      }).catchError((error) {
        emit(NewsGetScienceErrorStates(error.toString()));
        print(error);
      });
    } else {
      emit(NewsGetScienceSuccessStates());
    }
  }

  bool isMode = true;

  void changeThemMode({bool? formShared}) {
    if (formShared != null) {
      isMode = formShared;
      emit(NewsChangeModeStates());
    } else {
      isMode = !isMode;
      CacheHelper.putBoolean(kye: 'isDark', value: isMode).then((value) {
        emit(NewsChangeModeStates());
      });
    }
  }

  List<dynamic> search = [];

  void getSearch(query) {
    emit(NewsGetSearchLoadingStates());
    DioHelper.getData(url: 'v2/everything', query:
    {
      'q': '$query',
      'apiKey': '449e4533841b458ba5ed334ae9382515'
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessStates());
    }).catchError((error) {
      emit(NewsGetSearchErrorStates(error.toString()));
      print(error);
    });
  }

}
