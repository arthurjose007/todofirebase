import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseModel {
  Future adddEmployDetail(Map<String, dynamic> employinfomap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Employe")
        .doc(id)
        .set(employinfomap);
  }

  Future<Stream<QuerySnapshot>> getemployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Employe").snapshots();
  }

  Future updataeEmployeeDetails(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Employe")
        .doc(id)
        .update(updateInfo);
  }

  Future DeleteEmployeeDetails(
    String id,
  ) async {
    return await FirebaseFirestore.instance
        .collection("Employe")
        .doc(id)
        .delete();
  }
}
