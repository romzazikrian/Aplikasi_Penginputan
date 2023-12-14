import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Karyawan21312052Controller extends GetxController {
  late TextEditingController cJabatan_Karyawan;
  late TextEditingController cNama_Karyawan;
  late TextEditingController cNo_Karyawan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData(arguments) async {
    CollectionReference karyawanCollection = firestore.collection('karyawan_21312052');
    return karyawanCollection.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference karyawanCollection = firestore.collection('karyawan_21312052');
    return karyawanCollection.snapshots();
  }

  void add(String jabatan_karyawan, String nama_karyawan, String no_karyawan) async {
    CollectionReference karyawanCollection = firestore.collection("karyawan_21312052");

    try {
      await karyawanCollection.add({
        "jabatan_karyawan": jabatan_karyawan,
        "nama_karyawan": nama_karyawan,
        "no_karyawan": no_karyawan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data karyawan",
        onConfirm: () {
          // Membersihkan nilai setelah berhasil
          cJabatan_Karyawan.clear();
          cNama_Karyawan.clear();
          cNo_Karyawan.clear();
          Get.back(); // Kembali satu kali
          Get.back(); // Kembali lagi
        },
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Karyawan.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getDataById(String id) async {
    DocumentReference docRef = firestore.collection("karyawan_21312052").doc(id);

    return docRef.get();
  }

  void updateData(Karyawan21312052Controller controller, String jabatan_karyawan, String nama_karyawan, String no_karyawan, String id) async {
  DocumentReference karyawanById = firestore.collection("karyawan_21312052").doc(id);

  try {
    await karyawanById.update({
      "jabatan_karyawan": jabatan_karyawan,
      "nama_karyawan": nama_karyawan,
      "no_karyawan": no_karyawan,
    });

    Get.defaultDialog(
      title: "Berhasil",
      middleText: "Berhasil mengubah data Karyawan.",
      onConfirm: () {
        controller.cJabatan_Karyawan.clear();
        controller.cNama_Karyawan.clear();
        controller.cNo_Karyawan.clear();
        Get.back();
        Get.back();
      },
      textConfirm: "OK",
    );
  } catch (e) {
    print(e);
    Get.defaultDialog(
      title: "Terjadi Kesalahan",
      middleText: "Gagal mengubah data Karyawan.",
    );
  }
}
void delete(String id) {
  DocumentReference docRef = firestore.collection("karyawan_21312052").doc(id);

  try {
    Get.defaultDialog(
      title: "Info",
      middleText: "Apakah anda yakin menghapus data ini ?",
      onConfirm: () async {
        await docRef.delete();
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
    cJabatan_Karyawan = TextEditingController();
    cNama_Karyawan = TextEditingController();
    cNo_Karyawan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cJabatan_Karyawan.dispose();
    cNama_Karyawan.dispose();
    cNo_Karyawan.dispose();
    super.onClose();
  }

}
