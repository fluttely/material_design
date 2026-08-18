// The deck. 22 slides, ~30 minutes, six blocks.
//
// The examples are deliberately polyglot: every pattern lands as one rule
// written three times — Java/Spring, React Native, Flutter — so nobody has to
// translate the argument into their own stack while listening. The library is
// the laboratory, not the subject.
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
  // BLOCO 1 — A premissa errada (3 min)
  // ═══════════════════════════════════════════════════════════════════════
  Slide(section: 'A premissa', build: _twoPrompts),
  Slide(section: 'A premissa', build: _formula),

  // ═══════════════════════════════════════════════════════════════════════
  // BLOCO 2 — O modelo mental (3 min)
  // ═══════════════════════════════════════════════════════════════════════
  Slide(section: 'Modelo mental', build: _iceberg),
  Slide(section: 'Modelo mental', build: _bmadSddFit),

  // ═══════════════════════════════════════════════════════════════════════
  // BLOCO 3 — Os 7 padrões, cada um em três stacks (10 min)
  // ═══════════════════════════════════════════════════════════════════════
  Slide(section: 'Os 7 padrões', build: _patternsIndex),
  Slide(section: 'Padrão 1', build: _pattern1),
  Slide(section: 'Padrão 2', build: _pattern2),
  Slide(section: 'Padrão 3', build: _pattern3),
  Slide(section: 'Padrão 4', build: _pattern4),
  Slide(section: 'Padrão 5', build: _pattern5),
  Slide(section: 'Padrão 6', build: _pattern6),
  Slide(section: 'Padrão 7', build: _pattern7),
  Slide(section: 'Os 7 padrões', build: _theFile),

  // ═══════════════════════════════════════════════════════════════════════
  // BLOCO 4 — Contexto que se auto-verifica (5 min)
  // ═══════════════════════════════════════════════════════════════════════
  Slide(section: 'Auto-verificação', build: _rotsVsEnforced),
  Slide(section: 'Auto-verificação', build: _whatItFound),
  Slide(section: 'Auto-verificação', build: _twoLevels),

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
// Bloco 0 — Abertura
// ─────────────────────────────────────────────────────────────────────────

Widget _title(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    children: [
      const MorphMark(),
      const M3Gap(M3Spacings.s32),
      const Kicker('Kevin Kobori · Material Design'),
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
  );
}

Widget _theCase(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    children: [
      const Kicker('O laboratório'),
      const M3Gap(M3Spacings.s16),
      const Heading('Uma lib publicada, mantida por uma pessoa'),
      const M3Gap(M3Spacings.s16),
      const Body(
        'Não precisa conhecer Flutter: os exemplos vêm em Java, TypeScript '
        'e Dart.',
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
  );
}

// ─────────────────────────────────────────────────────────────────────────
// Bloco 1 — A premissa errada
// ─────────────────────────────────────────────────────────────────────────

Widget _twoPrompts(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
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
                  'Persona, cadeia de raciocínio, formato de saída, critérios '
                  'de qualidade. 300 palavras.',
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
                  'Adiciona o campo "cpf" no cadastro,\n'
                  'seguindo o padrão do projeto.',
                ),
                M3Gap(M3Spacings.s16),
                Body('Rodado dentro de um repo\ncom contexto construído.'),
              ],
            ),
          ],
        ),
      ),
      const M3Gap(M3Spacings.s32),
      const Body(
        'B ganha, e não é perto. O texto do prompt não foi o que mudou — '
        'foi onde ele é lido.',
        emphasis: true,
      ),
    ],
  );
}

Widget _formula(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    children: [
      const Kicker('O que determina o resultado'),
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
              Body('Redigir melhor o pedido.'),
            ],
          ),
          const M3Gap(M3Spacings.s24),
          Panel(
            title: '~90%',
            accent: scheme.enforced,
            children: const [
              Body(
                'O mundo em que o pedido é lido: invariantes, critérios de '
                'decisão, ferramentas, verificação.',
              ),
            ],
          ),
        ],
      ),
      const M3Gap(M3Spacings.s32),
      const Body(
        'O modelo não erra por causa da frase. Erra por não ter os critérios '
        'de decisão do projeto.',
        emphasis: true,
      ),
    ],
  );
}

// ─────────────────────────────────────────────────────────────────────────
// Bloco 2 — O modelo mental
// ─────────────────────────────────────────────────────────────────────────

Widget _iceberg(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
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
        'Você não reexplica a arquitetura ao colega a cada pedido. Ele já tem '
        'a base; você manda o delta.',
        emphasis: true,
      ),
    ],
  );
}

Widget _bmadSddFit(BuildContext context) {
  return const SlideFrame(
    children: [
      Kicker('Onde entra o que vocês já usam'),
      M3Gap(M3Spacings.s24),
      Heading('BMAD e SDD fabricam a parte de baixo.'),
      M3Gap(M3Spacings.s32),
      Bullet('SDD — a spec é o artefato durável. O código deriva dela.'),
      Bullet('BMAD — PRD e arquitetura viram stories que carregam o próprio '
          'contexto.'),
      Bullet('Não competem entre si. Implementam o mesmo princípio.'),
      M3Gap(M3Spacings.s32),
      Body(
        'Dá para fazer à mão, sem framework nenhum. É o que vem a seguir.',
        emphasis: true,
      ),
    ],
  );
}

// ─────────────────────────────────────────────────────────────────────────
// Bloco 3 — os sete padrões
// ─────────────────────────────────────────────────────────────────────────

Widget _patternsIndex(BuildContext context) {
  return const SlideFrame(
    children: [
      Kicker('O miolo'),
      M3Gap(M3Spacings.s16),
      Heading('7 padrões de contexto durável'),
      M3Gap(M3Spacings.s24),
      Body('Cada um em três stacks: Java/Spring, React Native, Flutter.'),
      M3Gap(M3Spacings.s32),
      Bullet('1 · Critério de decisão, não descrição', marker: ''),
      Bullet('2 · Feche o caminho errado mais provável', marker: ''),
      Bullet('3 · Invariante como forma, não como prosa', marker: ''),
      Bullet('4 · Escreva a cicatriz, não só o fix', marker: ''),
      Bullet('5 · Definição de pronto explícita', marker: ''),
      Bullet('6 · Verificação executável embutida', marker: ''),
      Bullet('7 · Vença os defaults da ferramenta', marker: ''),
    ],
  );
}

/// Every pattern is the same four beats: what people write, what works, the
/// same rule in three stacks, and why it works.
///
/// The stack row is the load-bearing part. A pattern stated once, in the
/// speaker's own stack, is a pattern two thirds of the room files under
/// "not my problem".
class _Pattern extends StatelessWidget {
  const _Pattern({
    required this.number,
    required this.title,
    required this.bad,
    required this.stacks,
    required this.lesson,
    this.good,
    this.goodShape,
    this.goodIsMono = false,
  }) : assert(
          good != null || goodShape != null,
          'a pattern needs a ✓ side: text, a shape, or both',
        );

  final String number;
  final String title;

  /// What people write, and why it decides nothing.
  final String bad;

  /// The same intent, written so it decides.
  final String? good;

  /// The ✓ side when the rule is better drawn than written — pattern 3.
  final Widget? goodShape;

  /// `(stack, rule)` — the same pattern, ready to paste into three different
  /// repositories.
  final List<(String, String)> stacks;

  final String lesson;
  final bool goodIsMono;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SlideFrame(
      children: [
        Kicker('Padrão $number'),
        const M3Gap(M3Spacings.s16),
        Heading(title),
        const M3Gap(M3Spacings.s32),
        VersusLine(marker: '✗', text: bad, color: scheme.rots),
        if (goodShape case final shape?)
          VersusRow(marker: '✓', color: scheme.enforced, child: shape)
        else
          VersusLine(
            marker: '✓',
            text: good!,
            color: scheme.enforced,
            mono: goodIsMono,
          ),
        // A wider gap here than between ✗ and ✓ on purpose: the pair is one
        // thought, the three cards are the next one.
        const M3Gap(M3Spacings.s16),
        StackRow(stacks),
        const M3Gap(M3Spacings.s32),
        Lesson(lesson),
      ],
    );
  }
}

Widget _pattern1(BuildContext context) => const _Pattern(
      number: '1',
      title: 'Critério de decisão, não descrição',
      bad: '"Siga os padrões do projeto."',
      good: 'se <situação>, faça <ação>.  Não achou <situação>? Pare.',
      goodIsMono: true,
      stacks: [
        (
          'Java · Spring',
          'Controller não decide regra. Tem if de negócio nele? Está na camada '
              'errada.'
        ),
        (
          'React Native',
          'Tela não chama fetch. Não existe hook em /api? O endpoint ainda não '
              'existe.'
        ),
        (
          'Flutter',
          'Cor e espaçamento vêm do token. Não achou o token? A tela não está '
              'no design system.'
        ),
      ],
      lesson: 'Descrição o modelo repete de volta. Critério ele aplica no caso '
          'que você não previu.',
    );

Widget _pattern2(BuildContext context) => const _Pattern(
      number: '2',
      title: 'Feche o caminho errado mais provável',
      bad: 'Nada escrito — e você corrige o mesmo erro toda semana.',
      good: 'A regra que você já cansou de repetir, escrita, com o motivo '
          'junto.',
      stacks: [
        (
          'Java · Spring',
          '@Transactional em método privado não funciona: o Spring não '
              'intercepta.'
        ),
        (
          'React Native',
          'key={index} em lista: a linha errada some quando o array muda.'
        ),
        (
          'Flutter',
          'Componente que o framework já tem não se reimplementa: vira dívida '
              'na próxima versão.'
        ),
      ],
      lesson: 'Sem o motivo a regra vira burocracia — e modelo bom contorna '
          'burocracia. Com o motivo, ele julga.',
    );

/// Pattern 3's invariant, drawn rather than typed.
///
/// It was ASCII art, and that was the wrong call: Flutter on the web has no
/// real monospace family, so every box-drawing character lands a few pixels
/// off and the slide arguing that a shape can be checked showed up crooked.
/// Boxes and a painted arrow survive any font.
class _LayerFlow extends StatelessWidget {
  const _LayerFlow();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.enforced;

    // Align first: the ✓ slot hands its child a tight width, and under a tight
    // constraint IntrinsicWidth does nothing — the return arrow would stretch
    // across the whole slide instead of closing under `infrastructure`.
    return Align(
      alignment: Alignment.centerLeft,
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _LayerBox('domain', color: color),
                _FlowArrow(color: color),
                _LayerBox('application', color: color),
                _FlowArrow(color: color),
                _LayerBox('infrastructure', color: color),
              ],
            ),
            CustomPaint(
              painter: _NeverArrow(color),
              child: SizedBox(
                height: M3Spacings.s64,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'nunca',
                    style: M3TypeScale.titleLarge.copyWith(
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LayerBox extends StatelessWidget {
  const _LayerBox(this.label, {required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const M3EdgeInsets.symmetric(
        horizontal: M3Spacings.s20,
        vertical: M3Spacings.s12,
      ),
      decoration: M3BoxDecoration(
        borderRadius: M3BorderRadius.medium,
        border: M3Border.all(outlineColor: color, width: M3BorderWidths.thick),
      ),
      child: Text(
        label,
        style: M3TypeScale.headlineSmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _FlowArrow extends StatelessWidget {
  const _FlowArrow({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return M3Padding(
      padding: const M3EdgeInsets.symmetric(horizontal: M3Spacings.s12),
      child: Text(
        '→',
        style: M3TypeScale.headlineMedium.copyWith(color: color),
      ),
    );
  }
}

/// The return path the layers may never take: down from the last box, back
/// under the row, and up into the first one.
class _NeverArrow extends CustomPainter {
  const _NeverArrow(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const inset = M3Spacings.s40;
    const head = M3Spacings.s12;
    final drop = size.height * 0.45;
    final right = size.width - inset;

    canvas.drawPath(
      Path()
        ..moveTo(right, 0)
        ..lineTo(right, drop)
        ..lineTo(inset, drop)
        ..lineTo(inset, head),
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = M3BorderWidths.thick
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round,
    );

    canvas.drawPath(
      Path()
        ..moveTo(inset, 0)
        ..lineTo(inset - head * 0.6, head)
        ..lineTo(inset + head * 0.6, head)
        ..close(),
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(_NeverArrow oldDelegate) => oldDelegate.color != color;
}

Widget _pattern3(BuildContext context) => const _Pattern(
      number: '3',
      title: 'Invariante como forma, não como prosa',
      bad: '"Mantenha as camadas desacopladas."',
      goodShape: _LayerFlow(),
      stacks: [
        ('Java · Spring', 'ArchUnit: um teste que reprova o import proibido.'),
        ('React Native', 'ESLint import/no-restricted-paths, rodando no CI.'),
        ('Flutter', 'Um grep nos imports dentro do script de verificação.'),
      ],
      lesson: 'Uma forma se confere; um parágrafo se interpreta. E forma vira '
          'teste.',
    );

Widget _pattern4(BuildContext context) => const _Pattern(
      number: '4',
      title: 'Escreva a cicatriz, não só o fix',
      bad: 'O mesmo bug volta a cada seis meses. O commit do fix não diz por '
          'quê.',
      good: '"Nunca case duas listas por índice — foi o bug da v1.6."',
      stacks: [
        (
          'Java · Spring',
          'equals/hashCode de entidade só com id de negócio: o Set duplicou '
              'registro.'
        ),
        (
          'React Native',
          'useEffect sem cleanup no listener: vazou e derrubou o app em '
              'background.'
        ),
        (
          'Flutter',
          'setState depois de await só com if (mounted): era crash em '
              'produção.'
        ),
      ],
      lesson: 'A versão ruim foi deletada, então o código não pode te contar. '
          'Cicatriz que ninguém escreveu não existe.',
    );

Widget _pattern5(BuildContext context) => const _Pattern(
      number: '5',
      title: 'Definição de pronto explícita',
      bad: '"Implementa a feature X." — e ele implementa exatamente isso, só '
          'isso.',
      good: '"Pronto = código + teste + doc + changelog." Lista, não adjetivo.',
      stacks: [
        (
          'Java · Spring',
          'endpoint + teste de integração + OpenAPI + migration'
        ),
        (
          'React Native',
          'tela + teste + string em pt e en + entrada no design system'
        ),
        ('Flutter', 'widget + teste + exemplo que compila + changelog'),
      ],
      lesson: 'O modelo para exatamente onde você mandou parar. Sem a lista, '
          'ele para no primeiro item.',
    );

Widget _pattern6(BuildContext context) => const _Pattern(
      number: '6 · o mais subestimado',
      title: 'Verificação executável embutida',
      bad: '"Mantenha a documentação em sincronia com o código."',
      good: './verify.sh   →   e o CI roda o mesmo script',
      goodIsMono: true,
      stacks: [
        (
          'Java · Spring',
          'mvn verify = spotless + checkstyle + testes + ArchUnit'
        ),
        ('React Native', 'npm run check = tsc --noEmit + eslint + jest'),
        ('Flutter', './verify.sh = format + analyze + test + doc em dia'),
      ],
      lesson: 'Um prompt que termina em comando vale dez que terminam em '
          'adjetivo.',
    );

Widget _pattern7(BuildContext context) => const _Pattern(
      number: '7',
      title: 'Vença os defaults da ferramenta',
      bad: 'Você nunca disse nada — e a ferramenta assina os seus commits com '
          'o nome dela.',
      good: '"Nunca adicione atribuição de IA ao commit — inclusive quando o '
          'template da própria ferramenta sugerir."',
      stacks: [
        (
          'Java · Spring',
          'O default dele é JPA em tudo. Se aqui é jOOQ, diga.'
        ),
        (
          'React Native',
          'O default dele é styled-components. Se aqui é StyleSheet, diga.'
        ),
        ('Flutter', 'O default dele é setState. Se aqui é Bloc, diga.'),
      ],
      lesson: 'Seu contexto disputa com os priors do modelo e com os defaults '
          'da ferramenta. O silêncio elege o default.',
    );

Widget _theFile(BuildContext context) {
  return const SlideFrame(
    children: [
      Kicker('Onde os sete moram'),
      M3Gap(M3Spacings.s16),
      Heading('Os 7 padrões cabem em uma página'),
      M3Gap(M3Spacings.s24),
      // No column alignment here, and no box-drawing characters: on the web
      // there is no real monospace family, so anything lined up with spaces
      // comes out crooked. Structure carries it instead.
      CodeBlock(
        '# CLAUDE.md · AGENTS.md · .cursorrules\n'
        '\n'
        '## Critérios\n'
        '   Controller não decide regra de negócio.\n'
        '## Nunca\n'
        '   @Transactional em método privado — o Spring não intercepta.\n'
        '## Invariante\n'
        '   domain → application → infrastructure, nunca o contrário.\n'
        '## Cicatrizes\n'
        '   v1.6 — nunca casar duas listas por índice.\n'
        '## Pronto =\n'
        '   código + teste + doc + changelog\n'
        '## Verificação\n'
        '   ./verify.sh   (o CI roda o mesmo comando)',
      ),
      M3Gap(M3Spacings.s24),
      Body(
        'O nome do arquivo muda por ferramenta. O conteúdo, não. Comece com '
        'três linhas: a que mais dói.',
        emphasis: true,
      ),
    ],
  );
}

// ─────────────────────────────────────────────────────────────────────────
// Bloco 4 — contexto que se auto-verifica
// ─────────────────────────────────────────────────────────────────────────

Widget _rotsVsEnforced(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    children: [
      const Kicker('Contexto apodrece'),
      const M3Gap(M3Spacings.s24),
      const Heading('Toda regra escrita apodrece —\na não ser que uma máquina '
          'a confira.'),
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
                Bullet('convenção combinada na reunião', marker: '×'),
                Bullet('comentário no código', marker: '×'),
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
        'Um doc que mente custa mais que um doc ausente: ausente você '
        'desconfia, mentindo você segue.',
        emphasis: true,
      ),
    ],
  );
}

Widget _whatItFound(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    children: [
      const Kicker('O que aconteceu comigo'),
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
        'CLAUDE.md virou um script de 350 linhas. Achou os 17 problemas na primeira '
        'execução.',
        emphasis: true,
      ),
    ],
  );
}

Widget _twoLevels(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    children: [
      const Kicker('Dois níveis, uma filosofia'),
      const M3Gap(M3Spacings.s24),
      const Heading('Você já defende isso — no código.'),
      const M3Gap(M3Spacings.s32),
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Panel(
              title: 'Tipo',
              accent: scheme.primary,
              children: const [
                Body('Contrato para quem usa o código.'),
                M3Gap(M3Spacings.s16),
                Body('O compilador recusa o valor errado.'),
              ],
            ),
            const M3Gap(M3Spacings.s24),
            Panel(
              title: 'Contexto + CI',
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
        'Torne o certo estrutural; torne o desvio visível. Vale para a API e '
        'vale para o processo.',
        emphasis: true,
      ),
    ],
  );
}

// ─────────────────────────────────────────────────────────────────────────
// Bloco 5 — BMAD e SDD
// ─────────────────────────────────────────────────────────────────────────

Widget _bmadMap(BuildContext context) {
  return const SlideFrame(
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
          ('Architecture doc em contexto', 'CLAUDE.md apontando para arquivos de regras'),
          ('Stories com contexto embutido', 'itens com critério de aceite'),
          ('Definition of done', 'uma checklist de 9 artefatos'),
          ('QA gate', 'um script + CI'),
          ('Registro de conclusão', 'changelog explicando o porquê'),
        ],
      ),
      M3Gap(M3Spacings.s32),
      Body(
        'Se o framework BMAD cabe, use. Se não cabe, essas seis linhas cabem em '
        'qualquer projeto.',
        emphasis: true,
      ),
    ],
  );
}

Widget _decisionRule(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    children: [
      const Kicker('A pergunta prática'),
      const M3Gap(M3Spacings.s16),
      const Heading('Adotar o framework BMAD ou não?'),
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
                Bullet('time de 1 dev', marker: '×'),
                Bullet('incrementos pequenos e bem definidos', marker: '×'),
              ],
            ),
          ],
        ),
      ),
      const M3Gap(M3Spacings.s32),
      const Body(
        'Sozinho? Leve três peças: o plano vai para um arquivo, cada tarefa '
        'carrega o próprio critério de aceite, quem revisa entra em contexto '
        'novo.',
      ),
      const M3Gap(M3Spacings.s24),
      Body(
        'Janela de 1M de tokens não é qualidade de contexto.',
        color: scheme.onSurface,
        emphasis: true,
      ),
    ],
  );
}

// ─────────────────────────────────────────────────────────────────────────
// Bloco 6 — Fechamento
// ─────────────────────────────────────────────────────────────────────────

Widget _takeaways(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;

  TextStyle line({Color? color, FontWeight? weight}) =>
      M3TypeScale.headlineMedium.copyWith(
        color: color ?? scheme.onSurface,
        fontWeight: weight,
        height: 1.4,
      );

  return SlideFrame(
    children: [
      const Kicker('Três frases para levar'),
      const M3Gap(M3Spacings.s40),
      Text(
        '1.  Não escreva melhor o pedido —\n    construa melhor o mundo em que '
        'ele é lido.',
        style: line(),
      ),
      const M3Gap(M3Spacings.s32),
      Text('2.  Contexto bom não descreve. Decide.', style: line()),
      const M3Gap(M3Spacings.s32),
      Text(
        '3.  Se um humano precisa lembrar da regra,\n    ela vai ser quebrada. '
        'Faça a máquina lembrar.',
        style: line(color: scheme.enforced, weight: FontWeight.w600),
      ),
    ],
  );
}

Widget _end(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return SlideFrame(
    children: [
      const Heading('Obrigado.'),
      const M3Gap(M3Spacings.s32),
      Text(
        'pub.dev/packages/material_design\n',
        style: M3TypeScale.headlineSmall.copyWith(
          fontFamily: 'monospace',
          color: scheme.onSurfaceVariant,
          height: 1.8,
        ),
      ),
      const M3Gap(M3Spacings.s40),
      const Body('Perguntas.', emphasis: true),
    ],
  );
}
