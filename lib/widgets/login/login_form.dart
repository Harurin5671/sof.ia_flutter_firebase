import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/controllers/input_controller.dart';
import 'package:flutter_firebase_crud/services/firebase_services.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });

  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    InputsController inputsController = Get.put(InputsController());

    loginIngreso() async {
      final pass = await searchUser(
          inputsController.username.value, inputsController.password.value);
      if (pass) {
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Por favor regístrese',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }

    loginRegistro() async {
      await addUser(
          inputsController.username.value, inputsController.password.value);
      Get.offAllNamed('/home');
    }

    return Container(
      width: 350,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
          child: Obx(
            () => Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) => inputsController.username.value = value,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      hintText: 'Usuario', labelText: 'Usuario'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) => inputsController.password.value = value,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Contraseña',
                    labelText: 'Contraseña',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: inputsController.crear.value
                      ? loginRegistro
                      : loginIngreso,
                  child: inputsController.crear.value
                      ? const Text('Registrarte')
                      : const Text('Ingresar'),
                ),
                const SizedBox(height: 20),
                if (!inputsController.crear.value)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('¡No tiene cuenta? '),
                      GestureDetector(
                          onTap: () => inputsController.crear.value = true,
                          child: const Text(
                            'Regístrese',
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  )
              ],
            ),
          )),
    );
  }
}
