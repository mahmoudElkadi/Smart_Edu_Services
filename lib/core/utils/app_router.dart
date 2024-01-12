// import 'package:book_app/Features/home/data/repos/home_repo_impl.dart';
// import 'package:book_app/Features/home/presentation/manger/similar%20book/similar_book_cubit.dart';
// import 'package:book_app/Features/home/presentation/views/book_details_view.dart';
// import 'package:book_app/Features/home/presentation/views/main_view.dart';
// import 'package:book_app/core/utils/service_lactor.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import '../../Features/Splash/presentation/views/splash_view.dart';
// import '../../Features/home/data/models/book_model.dart';
// import '../../Features/search/presentation/views/search_view.dart';
//
// abstract class AppRouter{
//
//  static final router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) => const SplashView(),
//       ),
//
//       GoRoute(
//         path: '/HomeView',
//         builder: (context, state) => const HomeView(),
//       ),
//
//       GoRoute(
//         path: '/BookDetailsView',
//         builder: (context, state) => BlocProvider(
//             create: (context)=>SimilarBookCubit(getIt.get<HomeRepoImpl>()),
//             child:  BookDetailsView(bookModel:state.extra as BookModel,)),
//       ),
//
//       GoRoute(
//         path: '/SearchView',
//         builder: (context, state) => const SearchView(),
//       ),
//     ],
//   );
//
// }