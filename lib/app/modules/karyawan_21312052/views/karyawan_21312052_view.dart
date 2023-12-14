import 'package:bcdx_11312136/app/modules/karyawan_21312052/views/karyawan_21312052_update_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/karyawan_21312052_controller.dart';

class Karyawan21312052View extends GetView< Karyawan21312052Controller> {
  void showOption(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.to(
                Karyawan21312052UpdateView(),
                arguments: id,
              );
            },
            title: Text('Update'),
          ),

          ListTile(
            onTap: () {
              Get.back();
              controller.delete(id);
            },
            title: Text('Delete'),
          ),

          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: Get.put(Karyawan21312052Controller()).streamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // mengambil data
          var listAllDocs = snapshot.data?.docs ?? [];
          return listAllDocs.length > 0
              ? ListView.builder(
  itemCount: listAllDocs.length,
  itemBuilder: (context, index) => ListTile(
    leading: CircleAvatar(
      child: Text('${index + 1}'),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
    ),
    title: Text(
      "${(listAllDocs[index].data() as Map<String, dynamic>)["jabatan_karyawan"]}",
    ),
    subtitle: Text(
      "${(listAllDocs[index].data() as Map<String, dynamic>)["nama_karyawan"]} - ${(listAllDocs[index].data() as Map<String, dynamic>)["no_karyawan"]}",
    ),
    trailing: IconButton(
      onPressed: () => showOption(listAllDocs[index].id),
      icon: Icon(Icons.more_vert),
    ),
  ),
)

              : Center(
                  child: Text("Data Kosong"),
                );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

