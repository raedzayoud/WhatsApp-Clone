import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SearchRepo {
  Stream<QuerySnapshot> searchUsers(String query);
}
