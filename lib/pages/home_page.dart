import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/controllers/input_controller.dart';
import 'package:flutter_firebase_crud/models/models.dart';
import 'package:flutter_firebase_crud/services/firebase_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    PeopleResponse user = box.read('user');
    List<Note> notas = user.notes;
    InputsController inputsController = Get.put(InputsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes de ${user.username}'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
                onTap: () {
                  Get.offAllNamed('/login');
                },
                child: const Icon(Icons.logout)),
          )
        ],
      ),
      body: Obx(
        () {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: inputsController.notesLength.value == 0
                ? user.notes.length
                : user.notes.length,
            itemBuilder: (context, index) {
              Note data = notas[index];
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  onLongPress: () {
                    Get.defaultDialog(
                      title: '¿Deseas eliminar la nota seleccionada?',
                      middleText: '',
                      confirm: TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.green[400]),
                        onPressed: () async {
                          await deleteNote(index);
                          inputsController.notesLength.value =
                              user.notes.length;
                          Get.back();
                        },
                        child: const Text('Confirmar'),
                      ),
                      cancel: TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.red[400]),
                        onPressed: () => Get.back(),
                        child: const Text('Cancelar'),
                      ),
                    );
                  },
                  onTap: () {
                    Get.toNamed('/edit', arguments: [user, index]);
                  },
                  title: Text(
                    data.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.body,
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
