import 'package:flutter/material.dart';
import 'package:modulo_a1_emerson/global/variaveis.dart';
import 'package:modulo_a1_emerson/global/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nomeController = TextEditingController();
  bool _mostrarAviso = false;

  Future<void> iniciarGame() async {
    nomeJogador = nomeController.text.toString().trim();
    Navigator.pushReplacementNamed(context, '/game');
  }

  Widget _alertaNome(String aviso) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: corPreto, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: corCinza,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.warning_amber_rounded, size: 30),
          Text(
            aviso,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          IconButton(
            onPressed: () {
              setState(() => _mostrarAviso = false);
            },
            icon: Icon(Icons.close, size: 30),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedBackground()),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 10,
                horizontal: 60,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'INFORME SEU NOME',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() => _mostrarAviso = false);
                    },
                    controller: nomeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: corPreto,
                          width: 1,
                        ),
                      ),
                      hintText: 'ex: JOGADOR1',
                    ),
                  ),
                  SizedBox(height: 50),
                  ButtonCustom(
                    onPressed: () {
                      if (nomeController.text.isEmpty) {
                        setState(() => _mostrarAviso = true);
                      }
                    },
                    titulo: 'INICIAR',
                  ),
                  SizedBox(height: 30),
                  ButtonCustom(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/ranking',
                      );
                    },
                    titulo: 'RANKING',
                  ),
                  SizedBox(height: 30),
                  _mostrarAviso
                      ? _alertaNome('''O NOME DEVE
SER PREENCHIDO''')
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
