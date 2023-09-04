import "package:flutter/material.dart";

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contador')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$contador',
                style: const TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w200,
                    color: Color.fromARGB(255, 124, 69, 160))),
            Text('clic${contador == 1 ? '' : 's'}',
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w200,
                    color: Color.fromARGB(255, 224, 147, 238))),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
              icono: Icons.plus_one_rounded,
              onPressed: () {
                setState(() {
                  contador++;
                });
              }),
          FloatingActionButton(
            shape: StadiumBorder(),
            onPressed: () {
              setState(() {
                if (contador == 0) return;
                contador--;
              });
            },
            child: const Icon(Icons.exposure_minus_1_rounded),
          ),
          FloatingActionButton(
            shape: StadiumBorder(),
            onPressed: () {
              setState(() {
                contador = 0;
              });
            },
            child: const Icon(Icons.restart_alt_rounded),
          )
        ],
      ),
    );
  }
} //fin clase _CounterScreenState

class CustomButton extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.icono, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icono),
    );
  }
}//clase CustomButton
