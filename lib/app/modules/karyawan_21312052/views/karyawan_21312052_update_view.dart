import 'package:bcdx_11312136/app/modules/karyawan_21312052/controllers/karyawan_21312052_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Karyawan21312052UpdateView extends GetView<Karyawan21312052Controller> {
  const Karyawan21312052UpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Karyawan'),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.docs.first.data() as Map<String, dynamic>;
            controller.cJabatan_Karyawan.text = data['jabatan_karyawan'];
            controller.cNama_Karyawan.text = data['nama_karyawan'];
            controller.cNo_Karyawan.text = data['no_karyawan'];

            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cJabatan_Karyawan,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Jabatan Karyawan"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.cNama_Karyawan,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Nama Karyawan"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.cNo_Karyawan,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Nomor Karyawan"),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Pastikan bahwa Get.arguments sesuai dengan yang diharapkan
                      if (Get.arguments != null && Get.arguments is String) {
                        controller.updateData(
                          controller,
                          controller.cJabatan_Karyawan.text,
                          controller.cNama_Karyawan.text,
                          controller.cNo_Karyawan.text,
                          Get.arguments as String,
                        );
                      } else {
                        // Handle jika Get.arguments tidak sesuai
                        print("Get.arguments tidak sesuai dengan tipe yang diharapkan");
                      }
                    },
                    child: Text("Ubah"),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
