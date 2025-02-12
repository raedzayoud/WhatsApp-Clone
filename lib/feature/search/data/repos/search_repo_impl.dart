import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsappclone/feature/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Stream<QuerySnapshot> searchUsers(String query) {
    return _firebaseFirestore
        .collection("users")
        .where('email', isGreaterThanOrEqualTo: query)
        .where('email', isLessThanOrEqualTo: query + '\uf8ff')
        .snapshots();
  }
}
