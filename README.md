# Draggable BrainTetris ↔️

Aplicativo mobile desenvolvido em Flutter como projeto teste da modalidade **#08 – Desenvolvimento de Aplicativos Móveis** (WorldSkills — Seletiva Estadual do Paraná), Módulo A1.

## 📱 Sobre o projeto

O BrainTetris é uma adaptação do clássico jogo Tetris, com cadastro de nome do jogador, ranking local de pontuações e uma mecânica de jogo baseada em movimentação de peças em um grid 6x10.

Esta é uma **versão alternativa**, feita no mesmo estilo visual e estrutural da especificação original da prova, mas substituindo o controle por inclinação por um controle por **arrastar (drag)** na tela — além de um diferencial extra: **rotacionar a peça ao tocar (tap) na tela**.

## 🎮 Controles

| Ação | Comando |
|---|---|
| Mover peça para a esquerda | Arrastar (drag) para a esquerda |
| Mover peça para a direita | Arrastar (drag) para a direita |
| Acelerar a queda da peça | Arrastar (drag) para baixo |
| Rotacionar a peça | Tocar (tap) na tela |

- A cada gesto de arrastar detectado, a peça se move uma posição (grid) no sentido correspondente.
- A peça desce uma posição a cada 0.5s (tick padrão), podendo ser acelerada via drag para baixo.
- A rotação por toque é uma funcionalidade extra, já que a especificação original da prova dispensa a lógica de rotação.

## 🖥️ Telas

- **Splash** — logo centralizada, barra/indicador de carregamento, 3s de exibição, navegação automática
- **Inicial** — campo para nome do jogador, botões "Iniciar" e "Ranking", validação de campo obrigatório
- **Ranking** — lista de pontuações ordenada de forma decrescente, armazenamento local, rolagem vertical
- **Jogo** — contagem regressiva de 3s, grid 6x10, queda automática de peças, controle por drag e rotação por tap, pontuação em tempo real, botão "Encerrar"

## 🎨 Paleta de cores

| Cor | Hex |
|---|---|
| Fundo claro | `#F7F7F7` |
| Fundo secundário | `#EDEDED` |
| Azul claro | `#AED6F1` |
| Verde água | `#A2DED0` |
| Texto/escuro | `#333333` |

## ⚙️ Tecnologias

- Flutter
- Gestos de toque (drag e tap)
- Armazenamento local (ranking persistido no dispositivo)

## 📦 Requisitos técnicos atendidos

- Orientação fixa em modo retrato (Portrait)
- Telas em tela cheia (fullscreen), sem ícones padrão do sistema
- Funcionamento 100% offline
- Sem rolagem horizontal em nenhuma tela
- Build final gerado em formato APK

## ▶️ Como executar

```bash
flutter pub get
flutter run
```

## 📝 Entrega

Desenvolvimento versionado via Git, com commits organizados por funcionalidade/tela conforme boas práticas de versionamento.
