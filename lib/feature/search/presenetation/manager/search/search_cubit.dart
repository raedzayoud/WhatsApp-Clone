import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:whatsappclone/feature/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<String> {
  SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super('');

  void updateQuery(String query) {
    emit(query);
  }

  Stream<QuerySnapshot> searchUsers(String query) {
    return searchRepo.searchUsers(query);
  }
}
