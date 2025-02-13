import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappclone/core/utlis/assets.dart';
import 'package:whatsappclone/core/widget/custom_loading.dart';
import 'package:whatsappclone/feature/search/presenetation/manager/search/search_cubit.dart';
import 'package:whatsappclone/feature/search/presenetation/view/widgets/custom_appar_search.dart';
import 'package:whatsappclone/feature/search/presenetation/view/widgets/user_title_search.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController search;
  @override
  void initState() {
    search = TextEditingController();
    ListinnerToUpdate();
    super.initState();
  }

  void ListinnerToUpdate() {
    // this is used for real time
    search.addListener(() {
      BlocProvider.of<SearchCubit>(context).updateQuery(search.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomApparSearch(
          search: search,
          onPressed: () {},
        ),
        Expanded(
          child: BlocBuilder<SearchCubit, String>(builder: (context, query) {
            if (query.isEmpty) {
              return Container();
            }
            return StreamBuilder(
                stream: BlocProvider.of<SearchCubit>(context)
                    .searchUsers(search.text),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CustomLoading();
                  }
                  final users = snapshot.data!.docs;
                  List<UserTitleSearch> userswidget = [];
                  for (var user in users) {
                    final name = user['fullName'];
                    final email = user['email'];
                    final userId = user['uid'];
                    final userWidget = UserTitleSearch(
                      name: name,
                      email: email,
                      userId: userId,
                    );
                    userswidget.add(userWidget);
                  }
                  return ListView(
                    children: userswidget,
                  );
                });
          }),
        )
      ],
    );
  }
}
