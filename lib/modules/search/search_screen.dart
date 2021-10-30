import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/componets/compomets.dart';



class SearchScreen extends StatelessWidget {


  var searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var lists = NewsCubit.get(context).search;
        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      defulteButton(
                          type: TextInputType.text,
                          label: 'Search',
                          prefix: Icons.search,
                          controller: searchController,
                          onChanged: (query)
                          {
                            NewsCubit.get(context).getSearch(query);
                          },
                          validate: (String? value)
                          {
                            if(value!.isEmpty) {
                              return 'Search Error Try Again';
                            }
                            return null;
                          }
                      ),
                    ],
                  ),
                ),
                Expanded(child: articleBuilder(lists, context))
              ],
            ),
        );
      },
    );
  }
}
