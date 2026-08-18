// Speaker notes — the second screen, the one the room never sees.
//
// One entry per slide, in deck order: the clock, the opening line close to
// verbatim, the beats, and the bridge out. Written to be *skimmed under
// pressure* — if you lose your place, the opening line alone restarts the
// slide.
//
// The glossary is only for terms this room may genuinely not have: BMAD, SDD,
// priors. Explaining "commit" to a room of developers is how you lose them.

/// Notes for a single slide.
class SlideNotes {
  const SlideNotes({
    required this.clock,
    required this.title,
    required this.opening,
    required this.beats,
    this.glossary = const [],
    this.bridge,
    this.warning,
  });

  /// Where you should be on the clock when this slide comes up.
  final String clock;

  /// The slide's own headline, so you can match paper to projector.
  final String title;

  /// Say this, close to verbatim. It restarts the slide if you lose the thread.
  final String opening;

  /// What to cover, in order.
  final List<String> beats;

  /// Jargon on the slide, in plain words. Term → meaning.
  final List<(String, String)> glossary;

  /// The sentence that hands off to the next slide.
  final String? bridge;

  /// Something to remember about delivery, not content.
  final String? warning;
}

/// A question you are likely to get, and the answer you want to give.
class Faq {
  const Faq(this.question, this.answer);

  final String question;
  final String answer;
}

/// One entry per slide, same order and length as `deck`.
const speakerNotes = <SlideNotes>[
  // 1 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '00:00',
    title: 'Como criar bons prompts para contextos técnicos complexos',
    opening: 'Trinta minutos sobre uma coisa que quase todo mundo aqui já faz '
        '— e quase ninguém faz de propósito.',
    beats: [
      'Diga o que não é: não é "10 dicas de prompt". Ajuste a expectativa '
          'agora, não no minuto 20.',
      'A tese está no subtítulo: o prompt é a menor parte do problema.',
      'O que levam: 7 padrões, cada um escrito em três stacks.',
    ],
    bridge: 'Antes dos padrões, o laboratório.',
  ),

  // 2 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '01:00',
    title: 'Uma lib publicada, mantida por uma pessoa',
    opening: 'Isto é uma biblioteca publicada no pub.dev, versão 1.8.0.',
    beats: [
      'Tire o Flutter da frente logo: os exemplos vêm em Java, TypeScript e '
          'Dart. Ninguém precisa da minha stack para aplicar nada.',
      'Números rápidos: 60 arquivos, 304 testes, 72 versões.',
      'Pare no "1 dev": o ponto não é escala de time, é que o contexto faz o '
          'trabalho pesado.',
    ],
    bridge: 'Agora a pergunta que motiva a palestra inteira.',
  ),

  // 3 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '02:00',
    title: 'A mesma tarefa, dois prompts',
    opening: 'Mesma tarefa, dois prompts. Qual ganha?',
    beats: [
      'Pergunte de verdade e espere: "quem aposta no A?". Cinco segundos de '
          'silêncio valem mais que o slide.',
      'A: tudo que ensinam em curso de prompt, 300 palavras, numa pasta vazia.',
      'B: uma linha, dentro de um repo com contexto construído.',
      'Fecha: o que mudou não foi o texto. Foi onde ele é lido.',
    ],
    warning: 'Não rode nada ao vivo aqui. O slide já conta a história.',
    bridge: 'Se não foi o texto, foi o quê?',
  ),

  // 4 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '03:30',
    title: 'O que determina o resultado',
    opening: 'Quatro coisas determinam a resposta. Só uma delas é o prompt.',
    beats: [
      'Nomeie cada termo: instrução é a sua mensagem; contexto durável é o que '
          'já estava lá; ferramentas é o que a IA executa; verificação é o que '
          'reprova o trabalho.',
      'Desarme o mal-entendido: não é que escrever bem não importe — é que o '
          'retorno cai. Melhorar 20% o texto não move nada; adicionar o '
          'invariante certo move tudo.',
    ],
    glossary: [
      (
        'Contexto durável',
        'o que já está no repositório antes de você abrir a boca: regras, '
            'tipos, testes, CI. "Durável" porque sobrevive ao fim da conversa.'
      ),
    ],
    bridge: 'Tem um jeito de guardar isso na cabeça.',
  ),

  // 5 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '05:00',
    title: 'Prompt = delta.  Contexto = base.',
    opening: 'Se levarem uma frase só desta palestra, que seja esta.',
    beats: [
      'Delta = a diferença, o incremento, a parte nova. A base é o contexto '
          'que já existe.',
      'A analogia que sempre funciona: você não reexplica a arquitetura ao '
          'colega toda vez que pede um ajuste. Ele tem a base; você manda o '
          'delta. Com a IA é igual — a base dela é o que está escrito no repo.',
      'Consequência: prompt ruim sobre base boa ganha de prompt ótimo sobre '
          'base zero. Sempre.',
    ],
    bridge: 'E aqui entra o que vocês já usam.',
  ),

  // 6 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '06:30',
    title: 'BMAD e SDD fabricam a parte de baixo',
    opening: 'Vocês já fazem isso. Só não com esse nome.',
    beats: [
      'SDD: a spec é o artefato durável, o código deriva dela.',
      'BMAD: agentes-persona geram PRD e arquitetura, e fatiam em stories que '
          'já carregam o contexto para serem executadas por quem não estava na '
          'conversa.',
      'O ponto: não são metodologias concorrentes de prompt. São duas máquinas '
          'de fabricar a parte de baixo.',
      'E dá para fazer à mão, sem framework. É o bloco inteiro que vem a '
          'seguir.',
    ],
    glossary: [
      (
        'SDD',
        'Spec-Driven Development — a especificação é a fonte da verdade e o '
            'código é derivado dela.'
      ),
      (
        'BMAD',
        'Breakthrough Method for Agile AI-Driven Development — agentes-persona '
            '(analista, PM, arquiteto, dev) produzem PRD e arquitetura e '
            'fatiam em stories.'
      ),
    ],
    bridge: 'Sete padrões, cada um com o errado e o certo lado a lado.',
  ),

  // 7 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '08:00',
    title: '7 padrões de contexto durável',
    opening: 'Sete padrões, dez minutos. Todo slide tem a mesma forma: o que '
        'as pessoas escrevem, o que funciona, a mesma regra em três stacks, e '
        'por quê.',
    beats: [
      'Avise: os três cartões de baixo são Java/Spring, React Native e '
          'Flutter. Todo mundo leva a versão do seu repo.',
      'Não leia os sete nomes — eles estão na tela.',
    ],
    warning: 'Marco de ritmo: saia deste slide aos 08:30. Se atrasar, corte os '
        'padrões 3 e 7 — o argumento fica de pé sem eles.',
    bridge: 'Padrão um.',
  ),

  // 8 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '08:30',
    title: 'Padrão 1 — Critério de decisão, não descrição',
    opening: 'O erro mais comum de todos: escrever descrição achando que é '
        'regra.',
    beats: [
      '✗ "Siga os padrões do projeto." Verdadeiro e inútil: o modelo lê, '
          'concorda, e faz o que ia fazer.',
      '✓ A forma que decide: se tal situação, faça tal coisa; não achou a '
          'situação, pare.',
      'Percorra os três cartões — controller sem regra, tela sem fetch, cor '
          'sem literal. É a mesma frase três vezes.',
      'O teste prático: leia a sua linha e pergunte "com só isso, o modelo '
          'resolve um caso novo?". Se não resolve, é descrição.',
    ],
  ),

  // 9 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '09:45',
    title: 'Padrão 2 — Feche o caminho errado mais provável',
    opening: 'Pergunta para vocês: qual erro a IA comete no seu projeto toda '
        'semana? É esse que você escreve.',
    beats: [
      'Os três cartões são armadilhas que a sala reconhece: @Transactional '
          'privado, key por índice, componente reimplementado. Espere o '
          '"ahhh".',
      'Insista no motivo junto da regra: sem motivo vira burocracia, e modelo '
          'bom contorna burocracia quando o caso parece diferente.',
      'Prática que cabe na segunda-feira: corrigiu a mesma coisa pela terceira '
          'vez? Vira linha de contexto.',
    ],
  ),

  // 10 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '11:00',
    title: 'Padrão 3 — Invariante como forma, não como prosa',
    opening: 'Tem invariante que não sobrevive à prosa.',
    beats: [
      '✗ "Mantenha as camadas desacopladas." Todo mundo concorda e ninguém '
          'sabe o que está proibido.',
      '✓ O desenho, com a seta de volta marcada como "nunca".',
      'Os cartões são o pulo do gato: ArchUnit, ESLint import/'
          'no-restricted-paths, grep no script. Forma vira teste — prosa não.',
    ],
    glossary: [
      (
        'ArchUnit',
        'lib Java que escreve regra de arquitetura como teste: "nada em domain '
            'importa infrastructure" reprova no build.'
      ),
    ],
  ),

  // 11 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '12:15',
    title: 'Padrão 4 — Escreva a cicatriz, não só o fix',
    opening: 'Este é o que praticamente ninguém faz.',
    beats: [
      'A chave, devagar: a versão ruim foi DELETADA. O código não pode contar. '
          'Nem a IA nem o dev novo têm como saber — a informação não existe '
          'mais, a não ser que alguém escreva.',
      'Os cartões são cicatrizes reais: equals/hashCode de entidade, '
          'useEffect sem cleanup, setState sem mounted. Cada sala tem as suas.',
      'Prática: no post-mortem, a saída não é só o fix. É a linha no arquivo '
          'de contexto, com a versão em que doeu.',
    ],
  ),

  // 12 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '13:30',
    title: 'Padrão 5 — Definição de pronto explícita',
    opening: 'O modelo para exatamente onde você mandou parar. Nem um passo '
        'além.',
    beats: [
      '✗ "Implementa a feature X." E ele faz a feature X. Sem teste, sem doc, '
          'sem changelog.',
      '✓ A lista. Os cartões mostram a mesma lista em três mundos.',
      'Desarme a leitura errada: não é o modelo sendo preguiçoso, é você não '
          'ter dito onde fica a linha de chegada.',
      'No projeto real são 9 artefatos. Parece exagero — é a diferença entre '
          '"funciona" e "entregue".',
    ],
  ),

  // 13 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '14:45',
    title: 'Padrão 6 — Verificação executável embutida',
    opening: 'Se levarem um padrão só desta lista, levem este.',
    beats: [
      '✗ "Mantenha a documentação em sincronia com o código." É adjetivo: não '
          'reprova nada, nunca.',
      '✓ Um comando que falha — e o CI roda exatamente o mesmo comando. É por '
          'isso que os cartões mostram mvn verify, npm run check, ./verify.sh: '
          'todo mundo já tem o portão, só não colocou a regra dentro dele.',
      'A frase: um prompt que termina em comando vale dez que terminam em '
          'adjetivo.',
    ],
  ),

  // 14 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '16:00',
    title: 'Padrão 7 — Vença os defaults da ferramenta',
    opening: 'O último não é sobre o seu código. É sobre a ferramenta.',
    beats: [
      '✗ Você nunca disse nada, e a ferramenta assina o seu commit com o nome '
          'dela, porque o template padrão manda assinar.',
      'Seu contexto disputa com duas forças: os priors do modelo (os cartões) '
          'e os defaults da ferramenta (a linha de cima).',
      'Se você não declarar o vencedor, o default vence. Todas as vezes.',
    ],
    glossary: [
      (
        'Priors',
        'as tendências que o modelo traz do treinamento — o que ele faria por '
            'padrão se você não dissesse nada. Ele escreve o mais comum da '
            'internet, não o mais comum do seu repo.'
      ),
    ],
    bridge: 'Fim dos sete. E os sete cabem em uma página.',
  ),

  // 15 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '17:15',
    title: 'Os 7 padrões cabem em uma página',
    opening: 'É isto que vocês levam daqui. Uma página, seis seções.',
    beats: [
      'Aponte a correspondência: Critérios é o padrão 1, Nunca é o 2, '
          'Invariante é o 3, Cicatrizes é o 4, Pronto é o 5, Verificação é o '
          '6. O 7 é o que você escreve quando a ferramenta te contraria.',
      'O nome do arquivo muda por ferramenta — CLAUDE.md, AGENTS.md, '
          '.cursorrules, copilot-instructions.md. O conteúdo, não.',
      'O conselho honesto: não escreva a página inteira hoje. Escreva três '
          'linhas — a regra que mais dói — e deixe crescer por erro corrigido.',
    ],
    bridge: 'Agora o ponto mais profundo, e é o que sustenta tudo isso.',
  ),

  // 16 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '18:30',
    title: 'Contexto apodrece, a não ser que uma máquina o confira',
    opening: 'Tudo o que eu mostrei até agora apodrece.',
    beats: [
      'Esquerda: doc em prosa, convenção de reunião, comentário, memória. Tudo '
          'passa a mentir com o tempo e ninguém percebe.',
      'Direita: tipo que recusa o valor errado, teste que compila o exemplo do '
          'README, script que falha quando doc e código divergem, lint no CI.',
      'A diferença entre as colunas não é qualidade de escrita. É se existe uma '
          'máquina conferindo.',
      'A frase: um doc que mente custa mais que um doc ausente. Ausente você '
          'desconfia e vai ler o código; mentindo, você segue.',
    ],
    bridge: 'E eu não estou falando por teoria.',
  ),

  // 17 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '20:15',
    title: '"Doc e código nunca divergem." Escrito há 6 releases.',
    opening: 'Isto aconteceu no meu projeto, no mês passado.',
    beats: [
      'A regra estava escrita no meu arquivo de contexto desde a 1.0. Seis '
          'releases. Ninguém conferia, e eu achava que estava cumprindo.',
      'Transformei a regra em script. Primeira execução: 9 APIs sem doc, 2 '
          'seções faltando no meu próprio README, 1 classe anunciada na tela '
          'que nunca existiu, 5 testes quebrando pelo motivo errado.',
      'Dezessete problemas. Nenhum compilador via nenhum deles.',
    ],
    warning: 'PAUSE. Três segundos de silêncio depois do "dezessete" — é o '
        'momento mais forte da apresentação.',
    bridge: 'E aqui fecha de um jeito que eu não tinha planejado.',
  ),

  // 18 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '22:00',
    title: 'Você já defende isso — no código',
    opening: 'Repare no que aconteceu sem eu ter projetado.',
    beats: [
      'Esquerda: o tipo é contrato para quem USA o código. O compilador recusa '
          'o valor errado.',
      'Direita: o arquivo de contexto mais o script são contrato para quem '
          'ESCREVE o código. O CI recusa a divergência.',
      'O gancho: quem aqui defende tipagem forte já concorda comigo. Só nunca '
          'aplicou o mesmo raciocínio ao próprio processo de trabalho.',
    ],
  ),

  // 19 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '23:30',
    title: 'Reimplementei ~80% do BMAD sem saber',
    opening: 'Voltando ao BMAD, agora com o que a gente construiu no meio.',
    beats: [
      'Eu não usei BMAD neste projeto, e ainda assim reimplementei a maior '
          'parte dele sem saber.',
      'Percorra a tabela rápido — o paralelo se vende sozinho.',
      'Conclusão honesta: se o framework cabe no seu time, use. Se não cabe, '
          'essas seis linhas cabem em qualquer projeto.',
    ],
  ),

  // 20 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '25:00',
    title: 'Adotar o framework BMAD ou não?',
    opening: 'A pergunta que sempre vem: então eu adoto o framework ou não?',
    beats: [
      'Paga quando três coisas são verdade: ambiguidade alta, muitas sessões '
          'ao longo de meses, handoff entre pessoas.',
      'Custa quando: a spec já é externa e precisa, o time é de um, os '
          'incrementos são pequenos e definidos.',
      'O modo de falha de TODO framework é artefato desatualizado: você gera '
          'PRD e arquitetura, o código anda, e agora você tem contexto '
          'confiantemente errado — pior que contexto nenhum.',
      'Sozinho: leve as três peças e pule o resto.',
    ],
    glossary: [
      (
        'Handoff',
        'passagem de bastão: outra pessoa, ou outro agente, continua um '
            'trabalho que não começou.'
      ),
    ],
    bridge: 'Três frases para levar.',
  ),

  // 21 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '27:30',
    title: 'Três frases para levar',
    opening: 'Três frases, e eu termino.',
    beats: [
      'Leia devagar, com pausa. Não comente as duas primeiras — elas se '
          'explicam.',
      'A terceira está em verde de propósito: é a cor de "se impõe".',
    ],
  ),

  // 22 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '29:00',
    title: 'Obrigado',
    opening: 'Obrigado. Os links estão aí, a lib é aberta.',
    beats: [
      'Convite concreto: o arquivo de contexto real é o CLAUDE.md na raiz do '
          'repositório, versionado. Podem ler inteiro.',
      'Abra para perguntas — as prováveis estão nos cartões seguintes.',
    ],
    warning: 'Aperte → para chegar nas perguntas frequentes.',
  ),
];

/// Q&A cards, shown after the last slide in presenter mode.
const faq = <Faq>[
  Faq(
    'Isso não é só documentação bem feita?',
    'Em parte, com uma diferença que muda tudo: documentação é lida por '
        'humanos quando eles lembram; contexto durável é lido pela IA em toda '
        'tarefa, e a parte que importa é conferida por máquina. Doc que '
        'ninguém confere apodrece — foi o que aconteceu comigo por seis '
        'releases.',
  ),
  Faq(
    'Quanto tempo você gastou montando esse contexto?',
    'O arquivo cresceu junto com o projeto, nunca de uma vez: hoje tem umas '
        '300 linhas acumuladas ao longo de meses. Os scripts de verificação '
        'foram meio dia. O retorno apareceu na primeira execução: 17 problemas '
        'reais.',
  ),
  Faq(
    'Isso não engessa a IA? Ela fica pior em tarefa criativa?',
    'Restringe onde você já decidiu e libera no resto. O que engessa de '
        'verdade é regra sem motivo — por isso todo padrão aqui inclui o '
        'porquê. Com o motivo escrito, quando o caso é genuinamente novo o '
        'modelo tem base para dizer que a regra não se aplica, em vez de '
        'obedecer cegamente.',
  ),
  Faq(
    'Funciona no Cursor, Copilot, Windsurf? Depende do Claude?',
    'É agnóstico. Todo assistente sério lê um arquivo de convenções do '
        'repositório — muda o nome (CLAUDE.md, AGENTS.md, .cursorrules, '
        'copilot-instructions.md), não a ideia. E o padrão 6, verificação '
        'executável, funciona mesmo sem IA nenhuma: é só CI.',
  ),
  Faq(
    'E se o contexto crescer demais e estourar a janela?',
    'Dois pontos. É menos problema hoje, com janelas de centenas de milhares '
        'de tokens. E, mais importante: se o seu arquivo está gigante, ele '
        'provavelmente está descrevendo em vez de decidir. Critério é curto; '
        'descrição é infinita.',
  ),
  Faq(
    'Como você convence o time a manter isso atualizado?',
    'Não convence: automatiza. É o padrão 6. Regra que depende de alguém '
        'lembrar vai ser quebrada, e o problema não é má vontade, é '
        'estatística. No CI, a manutenção deixa de ser negociação.',
  ),
  Faq(
    'Vale a pena adotar BMAD no nosso caso?',
    'Depende de três coisas: ambiguidade de requisito, número de sessões e se '
        'existe handoff entre pessoas. Se os três forem altos, sim. Se a spec '
        'é externa e precisa, o time é pequeno e os incrementos são bem '
        'definidos, o custo de cerimônia supera o ganho — e aí vale roubar as '
        'três peças.',
  ),
  Faq(
    'Você confia na IA para publicar uma release sozinha?',
    'Não é questão de confiança, é de portão. A IA propõe, o gate decide. Rodo '
        'um script que confere formatação, análise estática, testes, sincronia '
        'entre doc e código, e o changelog contra o que está publicado. O que '
        'passa, passa — independente de quem escreveu.',
  ),
  Faq(
    'Quanto disso depende de você estar sozinho no projeto?',
    'A vantagem de estar sozinho é não precisar negociar; a desvantagem é não '
        'ter ninguém para me corrigir — e foi por isso que eu precisei tanto '
        'de verificação automatizada. Em time, a mesma estrutura vira contrato '
        'entre pessoas, não só com a IA. Muda a motivação, não a receita.',
  ),
  Faq(
    'E se a IA ignorar a regra mesmo estando escrita?',
    'Acontece, e o diagnóstico costuma ser um de três: a regra é descrição e '
        'não critério (padrão 1); está sem motivo e o modelo julgou que não se '
        'aplicava (padrão 2); ou compete com um default da ferramenta e você '
        'não declarou o vencedor (padrão 7). Se ainda assim escapar, promova '
        'para verificação executável — aí não depende de obediência.',
  ),
  Faq(
    'Vocês mediram ganho de produtividade?',
    'Não tenho número controlado, e desconfio de quem tem. O que eu tenho é '
        'concreto: 17 defeitos reais achados na primeira execução de uma regra '
        'que estava escrita havia seis releases. O ganho não é digitar mais '
        'rápido — é não publicar errado.',
  ),
  Faq(
    'Qual o primeiro passo para quem sai daqui querendo aplicar?',
    'Um só: pegue o erro que você mais corrigiu no último mês e escreva a '
        'regra — com o motivo — no arquivo de convenções do repositório. É o '
        'padrão 2, custa cinco minutos, e dá para medir o efeito na semana '
        'seguinte.',
  ),
];
