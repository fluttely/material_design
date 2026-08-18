// The deck. 21 slides, ~30 minutes, six blocks.
//
// The examples are deliberately framework-agnostic: the library is the
// laboratory, not the subject.
//
// The Expressive type scale and shape engine are @experimental upstream, which
// is a decision to opt into rather than a warning to ignore — acknowledged
// once, here.
// ignore_for_file: experimental_member_use
import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

import 'slide_kit.dart';

const deck = <Slide>[
  // ═══════════════════════════════════════════════════════════════════════
  // BLOCO 0 — Abertura (2 min)
  // ═══════════════════════════════════════════════════════════════════════
  Slide(section: 'Abertura', build: _title),
  Slide(section: 'Abertura', build: _theCase),

  // ═══════════════════════════════════════════════════════════════════════
  // BLOCO 1 — A premissa errada (4 min)
  // ═══════════════════════════════════════════════════════════════════════
  Slide(section: 'A premissa', build: _twoPrompts),
  Slide(section: 'A premissa', build: _formula),

  // ═══════════════════════════════════════════════════════════════════════
  // BLOCO 2 — O modelo mental (4 min)
  // ═══════════════════════════════════════════════════════════════════════
  Slide(section: 'Modelo mental', build: _iceberg),
  Slide(section: 'Modelo mental', build: _bmadSddFit),

  // ═══════════════════════════════════════════════════════════════════════
  // BLOCO 3 — Os 7 padrões (10 min)
  // ═══════════════════════════════════════════════════════════════════════
  Slide(section: 'Os 7 padrões', build: _patternsIndex),
  Slide(section: 'Padrão 1', build: _pattern1),
  Slide(section: 'Padrão 2', build: _pattern2),
  Slide(section: 'Padrão 3', build: _pattern3),
  Slide(section: 'Padrão 4', build: _pattern4),
  Slide(section: 'Padrão 5', build: _pattern5),
  Slide(section: 'Padrão 6', build: _pattern6),
  Slide(section: 'Padrão 7', build: _pattern7),

  // ═══════════════════════════════════════════════════════════════════════
  // BLOCO 4 — Contexto que se auto-verifica (6 min)
  // ═══════════════════════════════════════════════════════════════════════
  Slide(section: 'Auto-verificação', build: _rotsVsEnforced),
  Slide(section: 'Auto-verificação', build: _whatItFound),
  Slide(section: 'Auto-verificação', build: _fractal),

  // ═══════════════════════════════════════════════════════════════════════
  // BLOCO 5 — Onde BMAD e SDD entram (4 min)
  // ═══════════════════════════════════════════════════════════════════════
  Slide(section: 'BMAD & SDD', build: _bmadMap),
  Slide(section: 'BMAD & SDD', build: _decisionRule),

  // ═══════════════════════════════════════════════════════════════════════
  // BLOCO 6 — Fechamento (2 min)
  // ═══════════════════════════════════════════════════════════════════════
  Slide(section: 'Fechamento', build: _takeaways),
  Slide(section: 'Fechamento', build: _end),
];

// ─────────────────────────────────────────────────────────────────────────
// Bloco 0
// ─────────────────────────────────────────────────────────────────────────

Widget _title(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const MorphMark(),
        const M3Gap(M3Spacings.s32),
        const Kicker('Fluttely · engenharia com IA'),
        const M3Gap(M3Spacings.s24),
        Text(
          'Como criar bons prompts\npara contextos técnicos complexos',
          style: M3EmphasizedTypeScale.displayLarge.copyWith(
            color: scheme.onSurface,
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
        ),
        const M3Gap(M3Spacings.s32),
        Container(
          padding: const M3EdgeInsets.symmetric(
            horizontal: M3Spacings.s20,
            vertical: M3Spacings.s12,
          ),
          decoration: M3BoxDecoration(
            color: scheme.secondaryContainer,
            borderRadius: M3BorderRadius.full,
          ),
          child: Text(
            'ou: por que o prompt é a menor parte do problema',
            style: M3TypeScale.titleLarge.copyWith(
              color: scheme.onSecondaryContainer,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _theCase(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Kicker('O caso que vamos dissecar'),
        const M3Gap(M3Spacings.s16),
        const Heading('Uma lib publicada, em produção'),
        const M3Gap(M3Spacings.s16),
        const Body(
          'Serve só de laboratório. Nada do que vem a seguir depende de '
          'conhecer Flutter.',
        ),
        const M3Gap(M3Spacings.s40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Stat(value: '60', caption: 'arquivos no último release'),
            const M3Gap(M3Spacings.s24),
            const Stat(value: '304', caption: 'testes\n(pacote + demo)'),
            const M3Gap(M3Spacings.s24),
            const Stat(value: '72', caption: 'versões publicadas'),
            const M3Gap(M3Spacings.s24),
            Stat(value: '1', caption: 'dev', color: scheme.enforced),
          ],
        ),
        const M3Gap(M3Spacings.s40),
        const Body(
          'Construída com IA do primeiro commit ao release de ontem. '
          'A palestra é sobre como.',
          emphasis: true,
        ),
      ],
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────
// Bloco 1
// ─────────────────────────────────────────────────────────────────────────

Widget _twoPrompts(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Kicker('A mesma tarefa, dois prompts'),
        const M3Gap(M3Spacings.s24),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Panel(
                title: 'A · prompt "bem feito"',
                accent: scheme.rots,
                children: const [
                  Body(
                    'Persona, cadeia de raciocínio, formato de saída, '
                    'critérios de qualidade. 300 palavras de instrução.',
                  ),
                  M3Gap(M3Spacings.s16),
                  Body('Rodado numa pasta vazia.'),
                ],
              ),
              const M3Gap(M3Spacings.s24),
              Panel(
                title: 'B · uma linha',
                accent: scheme.enforced,
                children: const [
                  CodeBlock(
                      'Adiciona o campo X\nseguindo o padrão do projeto.'),
                  M3Gap(M3Spacings.s16),
                  Body('Rodado dentro de um repo\ncom contexto construído.'),
                ],
              ),
            ],
          ),
        ),
        const M3Gap(M3Spacings.s32),
        Body(
          'B ganha de lavada — e a qualidade do texto do prompt '
          'não foi o que mudou.',
          color: scheme.onSurface,
          emphasis: true,
        ),
      ],
    ),
  );
}

Widget _formula(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Kicker('O que realmente determina o resultado'),
        const M3Gap(M3Spacings.s32),
        CodeBlock(
          'resposta = f( instrução , contexto durável , ferramentas , '
          'verificação )',
          tint: scheme.onSurface,
        ),
        const M3Gap(M3Spacings.s32),
        Row(
          children: [
            Panel(
              title: '~10%',
              accent: scheme.rots,
              children: const [
                Body('Redigir melhor o pedido. Retorno marginal quase zero '
                    'em contexto técnico complexo.'),
              ],
            ),
            const M3Gap(M3Spacings.s24),
            Panel(
              title: '~90%',
              accent: scheme.enforced,
              children: const [
                Body('O mundo em que o pedido é lido: invariantes, '
                    'critérios de decisão, ferramentas, loop de verificação.'),
              ],
            ),
          ],
        ),
        const M3Gap(M3Spacings.s32),
        const Body(
          'O modelo não erra porque a frase estava ruim. Erra porque não '
          'tinha os critérios de decisão do projeto.',
          emphasis: true,
        ),
      ],
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────
// Bloco 2
// ─────────────────────────────────────────────────────────────────────────

Widget _iceberg(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Kicker('O modelo mental'),
        const M3Gap(M3Spacings.s24),
        const Heading('Prompt = delta.  Contexto = base.'),
        const M3Gap(M3Spacings.s32),
        Container(
          width: double.infinity,
          padding: const M3EdgeInsets.all(M3Spacings.s24),
          decoration: M3BoxDecoration(
            color: scheme.surfaceAtElevation(M3Elevation.level1),
            borderRadius: M3BorderRadius.large,
            border: M3Border.all(outlineColor: scheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'o prompt  ▔▔▔▔',
                style: M3TypeScale.titleLarge.copyWith(
                  fontFamily: 'monospace',
                  color: scheme.primary,
                ),
              ),
              const M3Gap(M3Spacings.s8),
              Divider(color: scheme.outline, thickness: M3BorderWidths.thick),
              const M3Gap(M3Spacings.s8),
              Text(
                'tipos · testes · lint · CI · hooks\n'
                'convenções · decisões registradas · cicatrizes de bugs\n'
                'definição de pronto · escopo fechado · comandos',
                style: M3TypeScale.titleMedium.copyWith(
                  fontFamily: 'monospace',
                  color: scheme.enforced,
                  height: 1.8,
                ),
              ),
            ],
          ),
        ),
        const M3Gap(M3Spacings.s32),
        const Body(
          'Um bom prompt em contexto complexo é um delta pequeno sobre uma '
          'base grande que você construiu antes.',
          emphasis: true,
        ),
      ],
    ),
  );
}

Widget _bmadSddFit(BuildContext context) {
  return const SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Kicker('Onde o que vocês já usam se encaixa'),
        M3Gap(M3Spacings.s24),
        Heading('BMAD e SDD são máquinas\nde fabricar a parte de baixo.'),
        M3Gap(M3Spacings.s32),
        Bullet('SDD — a spec é o artefato durável. O código deriva dela.'),
        Bullet('BMAD — PRD e arquitetura viram stories que carregam o '
            'próprio contexto.'),
        Bullet('Não competem entre si. Implementam o mesmo princípio.'),
        M3Gap(M3Spacings.s32),
        Body(
          'Dá para fazer isso à mão, sem framework nenhum. É o que os '
          'próximos 7 slides mostram.',
          emphasis: true,
        ),
      ],
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────
// Bloco 3 — os sete padrões
// ─────────────────────────────────────────────────────────────────────────

Widget _patternsIndex(BuildContext context) {
  return const SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Kicker('O miolo'),
        M3Gap(M3Spacings.s16),
        Heading('7 padrões de contexto durável'),
        M3Gap(M3Spacings.s24),
        Body('Valem em qualquer linguagem, qualquer framework, qualquer '
            'ferramenta de IA.'),
        M3Gap(M3Spacings.s32),
        Bullet('1 · Critério de decisão, não descrição', marker: ''),
        Bullet('2 · Feche o caminho errado mais provável', marker: ''),
        Bullet('3 · Invariante como forma, não como prosa', marker: ''),
        Bullet('4 · Tecido cicatricial', marker: ''),
        Bullet('5 · Definição de pronto explícita', marker: ''),
        Bullet('6 · Verificação executável embutida', marker: ''),
        Bullet('7 · Vença os defaults da ferramenta', marker: ''),
      ],
    ),
  );
}

/// Every pattern is the same three beats: what people write, what works,
/// and why. The examples are deliberately not about this package — they have
/// to land for someone who has never opened a Flutter project.
Widget _patternSlide({
  required BuildContext context,
  required String number,
  required String name,
  required String bad,
  required String good,
  required String lesson,
  bool goodMono = false,
}) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Kicker('Padrão $number'),
        const M3Gap(M3Spacings.s16),
        Heading(name),
        const M3Gap(M3Spacings.s40),
        VersusLine(marker: '✗', text: bad, color: scheme.rots),
        VersusLine(
          marker: '✓',
          text: good,
          color: scheme.enforced,
          mono: goodMono,
        ),
        const M3Gap(M3Spacings.s16),
        Lesson(lesson),
      ],
    ),
  );
}

Widget _pattern1(BuildContext context) => _patternSlide(
      context: context,
      number: '1',
      name: 'Critério de decisão, não descrição',
      bad: '"Seguimos os padrões de design do projeto."',
      good: '"Toda tela nova declara qual seção do design system ela usa. '
          'Não achou a seção? Não é para construir."',
      lesson: 'Descrição o modelo recita. Critério ele aplica num caso que '
          'você nunca previu.',
    );

Widget _pattern2(BuildContext context) => _patternSlide(
      context: context,
      number: '2',
      name: 'Feche o caminho errado mais provável',
      bad: 'Você não escreveu nada. Toda semana o agente reescreve do zero '
          'um botão que o framework já tem.',
      good: '"Não implementamos componentes. O framework tem. Se ele tem ou '
          'está prestes a ter, entregue o token e pare."',
      lesson: 'O erro que você cansa de corrigir vira regra — com o motivo '
          'junto, senão vira burocracia e o modelo contorna.',
    );

Widget _pattern3(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Kicker('Padrão 3'),
        const M3Gap(M3Spacings.s16),
        const Heading('Invariante como forma, não como prosa'),
        const M3Gap(M3Spacings.s32),
        VersusLine(
          marker: '✗',
          text: '"Mantenha as camadas desacopladas."',
          color: scheme.rots,
        ),
        VersusLine(
          marker: '✓',
          text: 'domain ──> application ──> infrastructure\n'
              '   ▲                              │\n'
              '   └──────────  nunca  ───────────┘',
          color: scheme.enforced,
          mono: true,
        ),
        const M3Gap(M3Spacings.s16),
        const Lesson('Uma forma se confere. Um parágrafo se interpreta.'),
      ],
    ),
  );
}

Widget _pattern4(BuildContext context) => _patternSlide(
      context: context,
      number: '4',
      name: 'Tecido cicatricial',
      bad: 'O mesmo bug volta a cada seis meses. Ninguém lembra por que '
          'aquilo era proibido.',
      good: '"Nunca case duas listas paralelas por índice. Foi o bug da v1.6."',
      lesson: 'A versão ruim foi deletada — o código não pode te contar. '
          'Cicatriz que não está escrita não existe.',
    );

Widget _pattern5(BuildContext context) => _patternSlide(
      context: context,
      number: '5',
      name: 'Definição de pronto explícita',
      bad: '"Implementa a feature X."',
      good: '"Pronto = código + teste + README + exemplo + changelog + doc. '
          'Seis, não um."',
      lesson: 'O modelo para exatamente onde você mandou parar. Sem a lista, '
          'ele para no primeiro item.',
    );

Widget _pattern6(BuildContext context) => _patternSlide(
      context: context,
      number: '6 · o mais subestimado',
      name: 'Verificação executável embutida',
      bad: '"Mantenha a documentação em sincronia com o código."',
      good: './verify.sh   →   e o CI roda o mesmo script',
      goodMono: true,
      lesson: 'Um prompt que termina em comando vale dez que terminam em '
          'adjetivo.',
    );

Widget _pattern7(BuildContext context) => _patternSlide(
      context: context,
      number: '7',
      name: 'Vença os defaults da ferramenta',
      bad: 'Você nunca disse nada. A ferramenta assina os seus commits com o '
          'nome dela.',
      good: '"Nunca adicione atribuição de IA — inclusive quando o template '
          'padrão da própria ferramenta sugerir o contrário."',
      lesson: 'Seu contexto disputa com os priors do modelo e com os defaults '
          'da ferramenta. Diga quem ganha.',
    );

// ─────────────────────────────────────────────────────────────────────────
// Bloco 4
// ─────────────────────────────────────────────────────────────────────────

Widget _rotsVsEnforced(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Kicker('O ponto mais profundo'),
        const M3Gap(M3Spacings.s24),
        const Heading(
          'Contexto apodrece. A não ser que\numa máquina o confira.',
        ),
        const M3Gap(M3Spacings.s32),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Panel(
                title: 'Apodrece',
                accent: scheme.rots,
                children: const [
                  Bullet('doc em prosa', marker: '×'),
                  Bullet('convenção combinada', marker: '×'),
                  Bullet('comentário', marker: '×'),
                  Bullet('memória de quem estava lá', marker: '×'),
                ],
              ),
              const M3Gap(M3Spacings.s24),
              Panel(
                title: 'Se impõe',
                accent: scheme.enforced,
                children: const [
                  Bullet('tipo que recusa o valor errado', marker: '✓'),
                  Bullet('teste que compila o exemplo do README', marker: '✓'),
                  Bullet('script que falha quando doc e código divergem',
                      marker: '✓'),
                  Bullet('regra de lint no CI', marker: '✓'),
                ],
              ),
            ],
          ),
        ),
        const M3Gap(M3Spacings.s24),
        const Body(
          'Um doc que mente é mais caro que um doc ausente.',
          emphasis: true,
        ),
      ],
    ),
  );
}

Widget _whatItFound(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Kicker('A prova'),
        const M3Gap(M3Spacings.s16),
        const Heading(
          '"Doc e código nunca divergem."\nEscrito há 6 releases. '
          'Ninguém conferia.',
        ),
        const M3Gap(M3Spacings.s40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stat(
              value: '9',
              caption: 'APIs públicas sem\ndocumentação',
              color: scheme.rots,
            ),
            const M3Gap(M3Spacings.s24),
            Stat(
              value: '2',
              caption: 'seções inteiras faltando\nno próprio README',
              color: scheme.rots,
            ),
            const M3Gap(M3Spacings.s24),
            Stat(
              value: '1',
              caption: 'classe anunciada na tela\nque nunca existiu',
              color: scheme.rots,
            ),
            const M3Gap(M3Spacings.s24),
            Stat(
              value: '5',
              caption: 'testes quebrando\npor motivo errado',
              color: scheme.rots,
            ),
          ],
        ),
        const M3Gap(M3Spacings.s40),
        const Body(
          'Virou script de 350 linhas. Achou os 17 na primeira execução.',
          emphasis: true,
        ),
      ],
    ),
  );
}

Widget _fractal(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Kicker('E aqui fecha'),
        const M3Gap(M3Spacings.s24),
        const Heading('A mesma filosofia, dois níveis'),
        const M3Gap(M3Spacings.s32),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Panel(
                title: 'Os tipos da sua lib',
                accent: scheme.primary,
                children: const [
                  Body('Contrato para quem usa o código.'),
                  M3Gap(M3Spacings.s16),
                  Body('O compilador recusa o valor errado.'),
                ],
              ),
              const M3Gap(M3Spacings.s24),
              Panel(
                title: 'O contexto do seu agente',
                accent: scheme.enforced,
                children: const [
                  Body('Contrato para quem escreve o código.'),
                  M3Gap(M3Spacings.s16),
                  Body('O CI recusa a divergência.'),
                ],
              ),
            ],
          ),
        ),
        const M3Gap(M3Spacings.s32),
        const Body(
          'Torne o certo estrutural. Torne o desvio visível. '
          'Vale para a API e vale para o processo.',
          emphasis: true,
        ),
      ],
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────
// Bloco 5
// ─────────────────────────────────────────────────────────────────────────

Widget _bmadMap(BuildContext context) {
  return const SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Kicker('BMAD & SDD'),
        M3Gap(M3Spacings.s16),
        Heading('Reimplementei ~80% do BMAD sem saber.'),
        M3Gap(M3Spacings.s32),
        MapTable(
          left: 'O que o BMAD dá',
          right: 'O que virou, à mão',
          rows: [
            ('PRD + épicos', 'um roadmap.md com fases'),
            ('Architecture doc sempre em contexto', 'um arquivo de regras'),
            ('Stories com contexto embutido', 'itens numerados com critério'),
            ('Definition of done', 'uma checklist de 9 artefatos'),
            ('QA gate', 'um script + CI'),
            ('Registro de conclusão', 'changelog explicando o porquê'),
          ],
        ),
        M3Gap(M3Spacings.s32),
        Body(
          'Se o framework cabe, ótimo. Se não cabe, essas seis linhas cabem '
          'em qualquer projeto.',
          emphasis: true,
        ),
      ],
    ),
  );
}

Widget _decisionRule(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Kicker('A pergunta que vocês vão fazer'),
        const M3Gap(M3Spacings.s16),
        const Heading('Então eu adoto o framework ou não?'),
        const M3Gap(M3Spacings.s32),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Panel(
                title: 'Paga quando',
                accent: scheme.enforced,
                children: const [
                  Bullet('ambiguidade de requisito é alta', marker: '✓'),
                  Bullet('muitas sessões, meses de projeto', marker: '✓'),
                  Bullet('existe handoff entre pessoas', marker: '✓'),
                ],
              ),
              const M3Gap(M3Spacings.s24),
              Panel(
                title: 'Custa quando',
                accent: scheme.rots,
                children: const [
                  Bullet('a spec já é externa e precisa', marker: '×'),
                  Bullet('time de um', marker: '×'),
                  Bullet('incrementos pequenos e definidos', marker: '×'),
                ],
              ),
            ],
          ),
        ),
        const M3Gap(M3Spacings.s32),
        const Body(
          'Solo? Roube três peças e pule o resto: o plano vai para um '
          'arquivo, cada tarefa carrega o próprio critério de aceite, e quem '
          'revisa entra em contexto novo.',
        ),
        const M3Gap(M3Spacings.s24),
        Body(
          'Janela de 1M de tokens não é qualidade de contexto.',
          color: scheme.onSurface,
          emphasis: true,
        ),
      ],
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────
// Bloco 6
// ─────────────────────────────────────────────────────────────────────────

Widget _takeaways(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Kicker('Três frases para levar'),
        const M3Gap(M3Spacings.s40),
        Text(
          '1.  Não escreva melhor o pedido —\n    construa melhor o mundo em '
          'que ele é lido.',
          style: M3TypeScale.headlineMedium.copyWith(
            color: scheme.onSurface,
            height: 1.4,
          ),
        ),
        const M3Gap(M3Spacings.s32),
        Text(
          '2.  Contexto bom não descreve. Decide.',
          style: M3TypeScale.headlineMedium.copyWith(
            color: scheme.onSurface,
            height: 1.4,
          ),
        ),
        const M3Gap(M3Spacings.s32),
        Text(
          '3.  Se um humano precisa lembrar da regra,\n    ela vai ser '
          'quebrada. Faça o compilador lembrar.',
          style: M3TypeScale.headlineMedium.copyWith(
            color: scheme.enforced,
            height: 1.4,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

Widget _end(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Heading('Obrigado.'),
        const M3Gap(M3Spacings.s32),
        Text(
          'pub.dev/packages/material_design\n'
          'github.com/fluttely/material_design\n'
          'fluttely.github.io/material_design',
          style: M3TypeScale.headlineSmall.copyWith(
            fontFamily: 'monospace',
            color: scheme.onSurfaceVariant,
            height: 1.8,
          ),
        ),
        const M3Gap(M3Spacings.s40),
        const Body('Perguntas.', emphasis: true),
      ],
    ),
  );
}
