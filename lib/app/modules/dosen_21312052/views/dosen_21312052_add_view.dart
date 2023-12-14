import 'package:bcdx_11312136/app/modules/dosen_21312052/controllers/dosen_21312052_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Dosen21312052AddView extends GetView<Dosen21312052Controller> {
  const Dosen21312052AddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Dosen'),
        centerTitle: true,
      ),
      body: Padding(
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
              controller: controller.cStatus, // Tambahkan controller untuk status
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Status"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNidn.text,
                controller.cNama.text,
                controller.cStatus.text, // Ambil nilai status dari controller
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}

