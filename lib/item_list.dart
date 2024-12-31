import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/todo.dart';

class ItemList extends StatelessWidget {
  final Todo todo;
  final String transaksiDocId;

  const ItemList({
    super.key,
    required this.todo,
    required this.transaksiDocId,
  });

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return GestureDetector(
      onTap: () {
        // Implementasi aksi ketika item ditekan
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    todo.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                todo.isComplete
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: todo.isComplete ? Colors.blue : Colors.grey,
              ),
              onPressed: () async {
                await _firestore
                    .collection('Todos')
                    .doc(transaksiDocId)
                    .update({'isComplete': !todo.isComplete});
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await _firestore
                    .collection('Todos')
                    .doc(transaksiDocId)
                    .delete();
              },
            ),
          ],
        ),
      ),
    );
  }
}
