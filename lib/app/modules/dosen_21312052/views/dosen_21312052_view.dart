import 'package:bcdx_11312136/app/modules/dosen_21312052/views/dosen_21312052_update_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dosen_21312052_controller.dart';

class Dosen21312052View extends GetView< Dosen21312052Controller> {
  void showOption(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.to(
                Dosen21312052UpdateView(),
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
      stream: Get.put(Dosen21312052Controller()).streamData(),
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
  "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}",
),
subtitle: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "NIDN: ${(listAllDocs[index].data() as Map<String, dynamic>)["nidn"]}",
    ),
    Text(
      "Status: ${(listAllDocs[index].data() as Map<String, dynamic>)["status"]}",
      style: TextStyle(
        fontStyle: FontStyle.italic,
        color: Colors.grey,
      ),
    ),
  ],
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

