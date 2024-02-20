import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/features/Country/data/repos/country_repo_impl.dart';
import 'package:smart/features/Country/presentation/manger/country%20cubit/Country_cubit.dart';
import 'package:smart/features/Country/presentation/view/widgets/country_view_body.dart';

class CountryView extends StatelessWidget {
  const CountryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CountryCubit(CountryRepoImpl())..getCountry(),
        child: const CountryViewBody());
  }
}
