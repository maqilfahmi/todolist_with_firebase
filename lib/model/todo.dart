import 'package:flutter/src/widgets/framework.dart';

class Todo {
  final String nama;
  final String deskripsi;

  Todo({
    required this.nama,
    required this.deskripsi,
  });

  get uid => null;

  get isComplete => null;

  String get description => null;

  String get title => null;

  static Widget fromMap(id, Map<String, dynamic> data) {}
}

List<Todo> listdata = [
  Todo(
    nama: 'Studi Kasus 1',
    deskripsi: 'Membuat Program Dasar Java',
  ),
  Todo(
    nama: 'Studi Kasus 2',
    deskripsi: 'Membuat Studi Kasus List Makanan',
  ),
  Todo(
    nama: 'Studi Kasus 3',
    deskripsi: 'Membuat Aplikasi To Do List',
  ),
];
