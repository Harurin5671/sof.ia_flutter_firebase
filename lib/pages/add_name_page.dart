import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/services/firebase_services.dart';
import 'package:get/get.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({Key? key}) : super(key: key);

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController bodyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Encabezado',
                labelText: 'Encabezado',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: bodyController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Introduce la nota',
                labelText: 'Introduce la nota',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await addNote(nameController.text, bodyController.text);

                Get.toNamed('/home');
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
