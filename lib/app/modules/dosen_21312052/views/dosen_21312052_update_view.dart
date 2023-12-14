import 'package:bcdx_11312136/app/modules/dosen_21312052/controllers/dosen_21312052_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dosen21312052UpdateView extends GetView<Dosen21312052Controller> {
  const Dosen21312052UpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Dosen'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNama.text = data['nama'];
            controller.cNidn.text = data['nidn'];
            controller.cStatus.text = data['status'];

            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cNama,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Nama"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cNidn,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "NIDN"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cStatus,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Status"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => controller.updateData(
                      controller.cNama.text,
                      controller.cNidn.text,
                      controller.cStatus.text,
                      Get.arguments,
                    ),
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
