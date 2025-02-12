import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsappclone/core/utlis/assets.dart';
import 'package:whatsappclone/core/widget/custom_loading.dart';
import 'package:whatsappclone/feature/search/presenetation/manager/search/search_cubit.dart';
import 'package:whatsappclone/feature/search/presenetation/view/widgets/custom_appar_search.dart';
import 'package:whatsappclone/feature/search/presenetation/view/widgets/user_title_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Column(
      children: [
        CustomApparSearch(
          search: search,
          onPressed: () {
          },
        ),

        Expanded(
              child: StreamBuilder(
                  stream: BlocProvider.of<SearchCubit>(context)
                      .searchUsers(search.text),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CustomLoading();
                    }
                    final users = snapshot.data!.docs;
                    List<UserTitleSearch> userswidget = [];
                    for (var user in users) {
                      final name = user['fullname'];
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
                  }),
            )
        
        

        // Expanded(
        //   child: ListView.builder(
        //     padding: EdgeInsets.zero,
        //     itemCount: 10,
        //     itemBuilder: (context, index) {
        //       return null;
        //     },
        //   ),
        // ),
      ],
    );
  }
}
