import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:whatsappclone/feature/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitial());

  void updateQuery(String query) {
    emit(query as SearchState);
  }

  Stream<QuerySnapshot> searchUsers(String query) {
    return searchRepo.searchUsers(query);
  }
}
