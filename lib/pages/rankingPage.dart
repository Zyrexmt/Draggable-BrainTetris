import 'package:flutter/material.dart';
import 'package:modulo_a1_emerson/global/variaveis.dart';
import 'package:modulo_a1_emerson/global/widgets.dart';
import 'package:modulo_a1_emerson/services/rankEntry.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final List<RankingEntry> _rankingList = [];
  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadRanking() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 30,
            vertical: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '''RANKING DE
PONTUAÇÕES''',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              _buildTabelHeader(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: corPreto, width: 2),
                    borderRadius: BorderRadius.horizontal(),
                  ),
                  child: _rankingList.isEmpty
                      ? const Center(
                          child: Text('NENHUMA PONTUAÇÃO AINDA'),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            final entry = _rankingList[index];
                            return _buildTableData(
                              index + 1,
                              entry.playerName,
                              entry.score,
                            );
                          },
                          separatorBuilder: (_, __) => const Divider(
                            height: 1,
                            color: Color(0xff333333),
                          ),
                          itemCount: _rankingList.length,
                        ),
                ),
              ),
              const SizedBox(height: 30),
              ButtonCustom(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                titulo: 'VOLTAR À TELA INICIAL',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabelHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: corPreto, width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'POSIÇÃO',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'JOGADOR',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'PONTUAÇÃO',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableData(int pos, String player, int pontos) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('$posº ', textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 1,
            child: Text(player, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 1,
            child: Text('$pontos pts', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
