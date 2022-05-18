import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

late AnimationController controller;

class _InicioState extends State<Inicio> with SingleTickerProviderStateMixin {
  //late AnimationController controller;

  void initState() {
    super.initState();

    controller = AnimationController(
      //duration: Duration(seconds: 5),
      vsync: this,
    );

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie Animations'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Lottie.asset(
              'assets/99558-delivery-food-splash.json',
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                ),
                icon: const Icon(
                  Icons.delivery_dining,
                  size: 42,
                ),
                label: const Text('Ordenar'),
                onPressed: () {
                  _mostrarAlerta(context);
                })
          ],
        ),
      ),
    );

    /*void showDoneDialog() => showDoneDialog(
    //barrierDismissible: false,
    context: context,
    builder: (context) => Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/50465-done.json', repeat: false),
              Text(
                'Pedido realizado',
                style: TextStyle(fontSize: 24, fontWeight: 20),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ));*/
  }
}

Future<void> _mostrarAlerta(BuildContext context) async {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/50465-done.json',
                    repeat: false,
                    controller: controller, onLoaded: (composition) {
                  controller.duration = composition.duration;
                  controller.forward();
                }),
                Text(
                  'Pedido realizado',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ));
}

/*Widget _builAlertDialog(BuildContext context) {
  return AlertDialog(
    title: Text("¿Como estoy?"),
    content: Text("Muy bien con flutter"),
    actions: <Widget>[
      FlatButton(
          child: Text("Aceptar"),
          textColor: Colors.blueAccent,
          onPressed: () {
            Navigator.of(context).pop();
          }),
      FlatButton(
          child: Text("Cancelar"),
          textColor: Colors.redAccent,
          onPressed: () {
            Navigator.of(context).pop();
            print("Presionó cancelar");
          }),
      TextButton(
        onPressed: () {
          print("OK");
          Navigator.of(context)
              .pop(); //se le coloca para cerrar el cuadro de dialogo
        },
        child: Text("OK"),
      )
    ],
  );
}*/
