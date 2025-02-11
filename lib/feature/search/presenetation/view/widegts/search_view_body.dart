import 'package:flutter/material.dart';
import 'package:whatsappclone/feature/search/presenetation/view/widegts/custom_appar_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Column(
      children: [CustomApparSearch(search: search)],
    );
  }
}
