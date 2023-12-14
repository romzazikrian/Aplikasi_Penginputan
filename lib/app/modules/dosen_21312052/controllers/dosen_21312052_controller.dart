import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Dosen21312052Controller extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNidn;
  late TextEditingController cStatus;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("dosen_21312052").doc(id);
    return docRef.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference dosen = firestore.collection('dosen_21312052');
    return dosen.snapshots();
  }

  void add(String nama, String nidn, String status) async {
    CollectionReference dosenCollection = firestore.collection("dosen_21312052");

    try {
      await dosenCollection.add({
        "nama": nama,
        "nidn": nidn,
        "status": status,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data dosen",
        onConfirm: () {
          cNama.clear();
          cNidn.clear();
          cStatus.clear(); // Clear controller untuk status
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Dosen.",
      );
    }
  }

  void updateData(String nama, String nidn, String status, String id) async {
    DocumentReference dosenById = firestore.collection("dosen_21312052").doc(id);

    try {
      await dosenById.update({
        "nama": nama,
        "nidn": nidn,
        "status": status,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Dosen.",
        onConfirm: () {
          cNama.clear();
          cNidn.clear();
          cStatus.clear(); // Clear controller untuk status
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Mengubah Data Dosen.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("dosen_21312052").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }


  @override
  void onInit() {
    // TODO: implementasi onInit
    cNama = TextEditingController();
    cNidn = TextEditingController();
    cStatus = TextEditingController(); // Menambahkan inisialisasi cStatus
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implementasi onClose
    cNidn.dispose();
    cNama.dispose();
    cStatus.dispose(); // Menghapus cStatus pada onClose
    super.onClose();
  }
}
