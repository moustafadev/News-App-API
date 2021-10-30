import 'dart:ui';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/componets/compomets.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var list = NewsCubit.get(context).business;

        return articleBuilder(list,context);
    },
    );
  }
}
