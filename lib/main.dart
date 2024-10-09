import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/Bloc/followers/followers_bloc.dart';
import 'package:untitled8/Bloc/following/following_bloc.dart';
import 'package:untitled8/Bloc/highlites/highlite_bloc.dart';
import 'package:untitled8/Bloc/posts/post_bloc.dart';
import 'package:untitled8/Bloc/tags/tag_bloc.dart';
import 'package:untitled8/Ui/Profile.dart';

import 'Bloc/profiles/profile_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MultiBlocProvider(providers: [
            BlocProvider(create: (context) => ProfileBloc()),
            BlocProvider(create: (context) => HighliteBloc()),
            BlocProvider(create: (context) => PostBloc()),
            BlocProvider(create: (context) => TagBloc()),
            BlocProvider(create: (context) => FollowersBloc()),
            BlocProvider(create: (context) => FollowingBloc()),
          ],
            child: MaterialApp(
              title: 'Instagram',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // This is the theme of your application.
                //
                // TRY THIS: Try running your application with "flutter run". You'll see
                // the application has a purple toolbar. Then, without quitting the app,
                // try changing the seedColor in the colorScheme below to Colors.green
                // and then invoke "hot reload" (save your changes or press the "hot
                // reload" button in a Flutter-supported IDE, or press "r" if you used
                // the command line to start the app).
                //
                // Notice that the counter didn't reset back to zero; the application
                // state is not lost during the reload. To reset the state, use hot
                // restart instead.
                //
                // This works for code too, not just values: Most code changes can be
                // tested with just a hot reload.
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const Profile(),
            ),
          );
        }
    );
  }
}