abstract class NewsStates{}

class InitialStats extends NewsStates{}


class ChangeNavBarItem extends NewsStates{}

class NewsGetBusinessSuccessStates extends NewsStates{}

class NewsGetBusinessLoadingStates extends NewsStates{}

class NewsGetBusinessErrorStates extends NewsStates
{
  final String error;

  NewsGetBusinessErrorStates(this.error);
}

class NewsGetSportSuccessStates extends NewsStates{}

class NewsGetSportLoadingStates extends NewsStates{}

class NewsGetSportErrorStates extends NewsStates
{
  final String error;

  NewsGetSportErrorStates(this.error);

}

class NewsGetScienceSuccessStates extends NewsStates{}

class NewsGetScienceLoadingStates extends NewsStates{}

class NewsGetScienceErrorStates extends NewsStates
{
  final String error;

  NewsGetScienceErrorStates(this.error);
}

class NewsChangeModeStates extends NewsStates {}

class NewsGetSearchSuccessStates extends NewsStates{}

class NewsGetSearchLoadingStates extends NewsStates{}

class NewsGetSearchErrorStates extends NewsStates
{
  final String error;

  NewsGetSearchErrorStates(this.error);
}