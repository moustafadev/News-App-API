import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/modules/search/search_screen.dart';
import 'package:news/shared/componets/compomets.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context,states){},
      builder: (context, states)
      {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('News App',),
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    navigationTo(context, SearchScreen());
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30.0,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).changeThemMode();
                    },
                    icon: const Icon(
                      Icons.bedtime_rounded,
                      size: 30.0,
                    )),
              )
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeNavBarItem(index);
            },
          ),
        );
      },
    );
  }
}
