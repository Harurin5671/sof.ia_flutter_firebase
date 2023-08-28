import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_crud/models/models.dart';
import 'package:get_storage/get_storage.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> getNotes() async {
  final box = GetStorage();
  PeopleResponse ele = box.read('user');
  final array = db.collection('people');
  final prueba = await array.where('username', isEqualTo: ele.username).get();
  PeopleResponse data = PeopleResponse.fromJson(prueba.docs[0].data());
  box.write('user', data);
}

Future<bool> searchUser(String username, String password) async {
  final ref = db.collection('people');
  final query = await ref
      .where('username', isEqualTo: username)
      .where('password', isEqualTo: password)
      .get();

  if (query.docs.isNotEmpty) {
    final box = GetStorage();
    final data = query.docs[0].data();
    data['uuid'] = query.docs[0].id;
    box.write('user', PeopleResponse.fromJson(data));
    return true;
  }

  return false;
}

// guardar name en db
Future<void> addNote(String name, String body) async {
  final box = GetStorage();
  PeopleResponse user = box.read('user');
  user.notes.add(Note.fromJson({'name': name, "body": body}));
  final strUser = json.encode(user);
  final mapUser = json.decode(strUser);
  await db.collection('people').doc(user.uuid).set(mapUser);
  // await getPeople();
}

// actualizar name en bd
Future<void> updateNote(
    PeopleResponse user, String newName, String newBody, int index) async {
  user.notes[index].name = newName;
  user.notes[index].body = newBody;
  final strUser = json.encode(user);
  final mapUser = json.decode(strUser);
  await db.collection('people').doc(user.uuid).set(mapUser);
  // await getPeople();
}

Future<void> deleteNote(int index) async {
  final box = GetStorage();
  PeopleResponse user = box.read('user');
  user.notes.remove(user.notes[index]);
  final strUser = json.encode(user);
  final mapUser = json.decode(strUser);
  await db.collection('people').doc(user.uuid).set(mapUser);
}

Future<void> addUser(String username, String password) async {
  final data = {"username": username, "password": password, "notes": []};
  await db.collection('people').doc().set(data);
  await searchUser(username, password);
}
