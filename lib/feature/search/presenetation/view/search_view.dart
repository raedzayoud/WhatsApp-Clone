import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappclone/feature/search/data/repos/search_repo_impl.dart';
import 'package:whatsappclone/feature/search/presenetation/manager/search/search_cubit.dart';
import 'package:whatsappclone/feature/search/presenetation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepoImpl()),
      child: Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
