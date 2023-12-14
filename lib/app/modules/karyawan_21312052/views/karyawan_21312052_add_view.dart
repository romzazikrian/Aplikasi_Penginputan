import 'package:bcdx_11312136/app/modules/karyawan_21312052/controllers/karyawan_21312052_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Karyawan21312052AddView extends GetView<Karyawan21312052Controller> {
  const Karyawan21312052AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Karyawan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cJabatan_Karyawan,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Jabatan Karyawan"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNama_Karyawan,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nama Karyawan"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNo_Karyawan,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Nomor Karyawan"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cJabatan_Karyawan.text,
                controller.cNama_Karyawan.text,
                controller.cNo_Karyawan.text,
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}

