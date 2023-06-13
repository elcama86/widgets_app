import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text("Hola Mundo"),
      action: SnackBarAction(
        label: "Cerrar",
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("¿Está seguro?"),
        content: const Text(
            "Incididunt nisi tempor sunt proident voluptate deserunt sit eu sit. Commodo nulla officia nisi proident occaecat elit magna culpa. Fugiat in est mollit nulla enim fugiat pariatur deserunt exercitation ullamco. Commodo ut dolore ea veniam anim sit proident enim. Reprehenderit id exercitation laborum velit veniam laborum ipsum non cillum. Lorem pariatur ipsum deserunt eiusmod."),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text("Cancelar"),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars y Diálogos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () => showAboutDialog(
                context: context,
                children: [
                  const Text(
                      "Amet culpa nisi cupidatat nisi cupidatat sint Lorem in adipisicing aliquip id commodo amet minim. Do elit fugiat exercitation nulla velit culpa veniam aliqua. Ea nisi ad ipsum consectetur commodo laborum enim ex sit occaecat do Lorem. Adipisicing consequat proident reprehenderit dolore pariatur. Occaecat esse voluptate sunt minim duis sit proident ea adipisicing ea non deserunt velit. Lorem nulla et magna do id nisi commodo. Commodo nisi laboris do laboris duis labore dolore eu labore voluptate labore dolor nisi enim."),
                ],
              ),
              child: const Text("Licencias usadas"),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text("Mostrar diálogo"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
