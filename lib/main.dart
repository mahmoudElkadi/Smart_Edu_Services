import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smart/features/Client/presentation/manger/client%20cubit/client_cubit.dart';
import 'package:smart/features/Currency/data/repos/currency_repo_impl.dart';
import 'package:smart/features/Currency/presentation/manger/Task%20cubit/currency_cubit.dart';
import 'package:smart/features/Specialities/data/repos/specialty_repo_impl.dart';
import 'package:smart/features/Specialities/presentation/manger/Task%20cubit/Specialty_cubit.dart';
import 'package:smart/features/Statuses/data/repos/status_repo_impl.dart';
import 'package:smart/features/Statuses/presentation/manger/Status%20cubit/Status_cubit.dart';

import 'core/Network/MyBlocObserver.dart';
import 'core/Network/shared.dart';
import 'core/utils/constant.dart';
import 'core/widgets/toast.dart';
import 'features/Client/data/repo/client_repo_impl.dart';
import 'features/Country/data/repos/country_repo_impl.dart';
import 'features/Country/presentation/manger/country cubit/Country_cubit.dart';
import 'features/Main/presentation/views/main_view.dart';
import 'features/Splash/presentation/views/splash_view.dart';
import 'features/Users/data/repos/user_repo_impl.dart';
import 'features/Users/presentation/manger/user cubit/user_cubit.dart';
import 'features/freelancer/data/repos/freelancer_repo_impl.dart';
import 'features/freelancer/presentation/manger/Freelancer cubit/Freelancer_cubit.dart';

Widget defaultHome = const MainView();
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print('on background message');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDiFvFWvicIrbdvFK4PUTFA5x-GWjC2hks",
      appId: "1:271035081904:android:e886729302846a95f70775",
      messagingSenderId: "271035081904",
      projectId: "task-base-cd324",
    ),
  );

  var deviceToken = await FirebaseMessaging.instance.getToken();

  print("dev $deviceToken");

  FirebaseMessaging.onMessage.listen((event) {
    print(event.data.toString());

    showToast(msg: 'on message', state: ToastStatus.SUCCESS);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data.toString());
    showToast(msg: 'on message Opened app', state: ToastStatus.SUCCESS);
  });

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await CacheHelper.init();
  token = CacheHelper.getData(key: "token");
  userRole = CacheHelper.getData(key: "userRole");
  userId = CacheHelper.getData(key: "userId");
  print(token);
  print(userRole);
  print(userId);

  if (token == null) {
    defaultHome = const SplashView();
  } else {
    defaultHome;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                SpecialityCubit(SpecialityRepoImpl())..getSpeciality()),
        BlocProvider(
            create: (context) => CountryCubit(CountryRepoImpl())..getCountry()),
        BlocProvider(
            create: (context) =>
                CurrenciesCubit(CurrenciesRepoImpl())..getCurrencies()),
        BlocProvider(
            create: (context) =>
                FreelancerCubit(FreelancerRepoImpl())..getFreelancer()),
        BlocProvider(
            create: (context) => ClientCubit(ClientRepoImpl())..getClient()),
        BlocProvider(
            create: (context) => StatusCubit(StatusRepoImpl())..getStatus()),
        BlocProvider(create: (context) => UserCubit(UserRepoImpl())..getUser()),
      ],
      child: ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          title: 'Smart Edu Services',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            useMaterial3: true,
          ),
          home: defaultHome,
        ),
      ),
    );
  }
}
