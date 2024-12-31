import 'package:flutter/material.dart';
import 'package:base_todolist/item_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/todo.dart';

class TodoPage extends StatelessWidget {
  final List<Todo> dataList;

  const TodoPage({super.key, required this.dataList});

  @override
  Widget build(BuildContext context, dynamic FirebaseFirestore) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();

    var firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return ItemList(
                  todo: dataList[index],
                  transaksiDocId: dataList[index].uid,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Tambah Data'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Kegiatan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Deskripsi Kegiatan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Batal'),
                ),
                TextButton(
                  onPressed: () async {
                    // Simpan data ke Firestore
                    if (_nameController.text.isNotEmpty &&
                        _descriptionController.text.isNotEmpty) {
                      await firestore.collection('Todos').add({
                        'title': _nameController.text,
                        'description': _descriptionController.text,
                        'isComplete': false,
                      });

                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
