import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/Network/MyBlocObserver.dart';
import 'core/Network/shared.dart';
import 'features/Main/presentation/views/main_view.dart';
import 'features/Splash/presentation/views/splash_view.dart';

Widget defaultHome=const MainView();

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();

  await CacheHelper.init();
  var token=CacheHelper.getData(key: "token");

  if(token==null){
    defaultHome=const SplashView();
  }else {
    defaultHome;
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child)=>
      GetMaterialApp(
        title: 'Smart Edu Services',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: defaultHome,
      ),
    );
  }
}

