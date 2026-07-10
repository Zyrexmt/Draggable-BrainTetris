import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String palavraSecreta = 'claro';
  List<String> palavraDigitada = ['c', 'a', 'l', 'r', 'o'];
  List<String> palavraSecretaList = [];
  List<String> cores = [];

  int tentativas = 1;

  String resultadoCor = '';

  Future<void> procurar() async {
    for (int i = 0; i < palavraSecretaList.length; i++) {
      if (palavraSecreta.contains(palavraDigitada[i])) {
        if (palavraSecretaList[i] == palavraDigitada[i]) {
          resultadoCor = "verde";
          cores.add(resultadoCor);
        } else {
          resultadoCor = "amarelo";
          cores.add(resultadoCor);
        }
      } else {
        resultadoCor = "preto";
        cores.add(resultadoCor);
      }
    }
  }

  TextEditingController _termoController1 = TextEditingController();
  TextEditingController _termoController2 = TextEditingController();
  TextEditingController _termoController3 = TextEditingController();
  TextEditingController _termoController4 = TextEditingController();
  TextEditingController _termoController5 = TextEditingController();
  TextEditingController _termoController11 = TextEditingController();
  TextEditingController _termoController12 = TextEditingController();
  TextEditingController _termoController13 = TextEditingController();
  TextEditingController _termoController14 = TextEditingController();
  TextEditingController _termoController15 = TextEditingController();
  TextEditingController _termoController21 = TextEditingController();
  TextEditingController _termoController22 = TextEditingController();
  TextEditingController _termoController23 = TextEditingController();
  TextEditingController _termoController24 = TextEditingController();
  TextEditingController _termoController25 = TextEditingController();
  TextEditingController _termoController31 = TextEditingController();
  TextEditingController _termoController32 = TextEditingController();
  TextEditingController _termoController33 = TextEditingController();
  TextEditingController _termoController34 = TextEditingController();
  TextEditingController _termoController35 = TextEditingController();
  TextEditingController _termoController41 = TextEditingController();
  TextEditingController _termoController42 = TextEditingController();
  TextEditingController _termoController43 = TextEditingController();
  TextEditingController _termoController44 = TextEditingController();
  TextEditingController _termoController45 = TextEditingController();
  TextEditingController _termoController51 = TextEditingController();
  TextEditingController _termoController52 = TextEditingController();
  TextEditingController _termoController53 = TextEditingController();
  TextEditingController _termoController54 = TextEditingController();
  TextEditingController _termoController55 = TextEditingController();

  Widget _buildLine(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff333333), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller,
        maxLength: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     _buildLine(_termoController1),
            //     _buildLine(_termoController2),
            //     _buildLine(_termoController3),
            //     _buildLine(_termoController4),
            //     _buildLine(_termoController5),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     _buildLine(_termoController11),
            //     _buildLine(_termoController12),
            //     _buildLine(_termoController13),
            //     _buildLine(_termoController14),
            //     _buildLine(_termoController15),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     _buildLine(_termoController21),
            //     _buildLine(_termoController22),
            //     _buildLine(_termoController23),
            //     _buildLine(_termoController24),
            //     _buildLine(_termoController25),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     _buildLine(_termoController31),
            //     _buildLine(_termoController32),
            //     _buildLine(_termoController33),
            //     _buildLine(_termoController34),
            //     _buildLine(_termoController35),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     _buildLine(_termoController41),
            //     _buildLine(_termoController42),
            //     _buildLine(_termoController43),
            //     _buildLine(_termoController44),
            //     _buildLine(_termoController45),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     _buildLine(_termoController51),
            //     _buildLine(_termoController52),
            //     _buildLine(_termoController53),
            //     _buildLine(_termoController54),
            //     _buildLine(_termoController55),
            //   ],
            // ),
            // SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                procurar();
                print(cores);
                cores.clear();
                tentativas++;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffededed),
                foregroundColor: Color(0xff333333),
                side: BorderSide(color: Color(0xff333333), width: 2),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 40,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                elevation: 4,
              ),
              child: Text(
                'Enviar',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
