import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/models/models.dart';
import 'package:flutter_firebase_crud/services/firebase_services.dart';
import 'package:get/get.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({Key? key}) : super(key: key);

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController bodyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    List arguments = Get.arguments;
    PeopleResponse user = arguments[0];
    int index = arguments[1];
    List<Note> notas = user.notes;
    nameController.text = notas[index].name;
    bodyController.text = notas[index].body;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edita la nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Modifica el nombre',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 5,
              controller: bodyController,
              decoration: const InputDecoration(hintText: 'Introduce la nota'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  await updateNote(
                    user,
                    nameController.text,
                    bodyController.text,
                    index,
                  );
                  Get.offAllNamed('/home');
                },
                child: const Text('Modificar')),
          ],
        ),
      ),
    );
  }
}
