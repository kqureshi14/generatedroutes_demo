import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generatedroutes_test/cubits/first_cubit.dart';
import 'package:generatedroutes_test/cubits/second_cubit.dart';
import 'package:generatedroutes_test/cubits/third_cubit.dart';
import 'package:generatedroutes_test/screens/page1.dart';
import 'package:generatedroutes_test/screens/page2.dart';
import 'package:generatedroutes_test/screens/page3.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/first":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => FirstCubit(),
                  child: const Page1(
                    title: 'Page 1',
                  ),
                ));

      case "/second":
        Map<String,dynamic> arguments = settings.arguments as Map<String,dynamic>;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SecondCubit(),
                  child: Page2(title:  arguments["title"]),
                ));

      case "/third":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ThirdCubit(),
                  child: Page3(),
                ));

      default: return null;
    }
  }
}
