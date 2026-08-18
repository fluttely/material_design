// Speaker notes — the second screen, the one the room never sees.
//
// One entry per slide, in deck order. Each carries the clock, the exact
// opening line, the beats to hit, the jargon spelled out, and the bridge to
// the next slide. The FAQ at the end is for the Q&A, when the deck is over.
//
// Written to be *skimmed under pressure*: if you lose your place, the opening
// line alone is enough to restart the slide.

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
    opening: 'Boa tarde. Trinta minutos sobre uma coisa que quase todo mundo '
        'aqui já faz — e quase ninguém faz de propósito.',
    beats: [
      'Avise o que NÃO é: não é palestra de "10 dicas de prompt". Se for isso '
          'que esperam, é melhor ajustar a expectativa agora.',
      'A tese está no subtítulo: o prompt é a menor parte do problema.',
      'Vou provar com um projeto real, publicado, e no fim vocês levam 7 '
          'padrões que funcionam em qualquer stack.',
    ],
    glossary: [
      ('Prompt', 'o texto que você manda para a IA numa mensagem.'),
      (
        'Contexto',
        'tudo o que a IA consegue ler além da sua mensagem: arquivos do '
            'projeto, regras, código, resultado de comandos.'
      ),
    ],
    bridge: 'Antes dos padrões, deixa eu mostrar o laboratório.',
  ),

  // 2 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '01:00',
    title: 'Uma lib publicada, em produção',
    opening: 'Isto é uma biblioteca que eu publico no pub.dev. A 1.8.0 saiu '
        'agora.',
    beats: [
      'Diga logo: não precisa conhecer Flutter. Troque por qualquer lib de '
          'qualquer linguagem e o argumento não muda.',
      'Passe pelos números: 60 arquivos no último release, 304 testes, 72 '
          'versões publicadas.',
      'Pare no "1 dev". O ponto não é escala de time — é que dá para manter '
          'isso sozinho porque o contexto faz o trabalho pesado.',
      'Fechamento: construída com IA do primeiro commit ao release de ontem.',
    ],
    glossary: [
      (
        'pub.dev',
        'o repositório de pacotes do Dart/Flutter — o equivalente ao npm ou '
            'ao PyPI.'
      ),
    ],
    bridge: 'Agora a pergunta que motiva a palestra inteira.',
  ),

  // 3 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '02:00',
    title: 'A mesma tarefa, dois prompts',
    opening: 'Mesma tarefa, dois prompts. Qual ganha?',
    beats: [
      'Pergunte de verdade e espere: "quem aposta no A?" Cinco segundos de '
          'silêncio valem mais que qualquer slide.',
      'A: tudo que ensinam em curso de prompt — persona, raciocínio passo a '
          'passo, formato de saída, critérios de qualidade. 300 palavras.',
      'B: uma linha. "Adiciona o campo X seguindo o padrão do projeto."',
      'B ganha de lavada. E não é perto.',
      'A frase que fecha o slide: a qualidade do texto do prompt não foi o '
          'que mudou. O que mudou foi ONDE ele foi lido.',
    ],
    glossary: [
      (
        'Persona',
        'instrução do tipo "você é um engenheiro sênior" — tenta ajustar a '
            'postura do modelo.'
      ),
      (
        'Chain-of-thought',
        'pedir para o modelo "pensar passo a passo" antes de responder.'
      ),
    ],
    warning: 'Não rode nada ao vivo aqui. O slide já conta a história.',
    bridge: 'Se não foi o texto, foi o quê?',
  ),

  // 4 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '04:00',
    title: 'O que realmente determina o resultado',
    opening: 'Quatro coisas determinam a resposta. Só uma delas é o prompt.',
    beats: [
      'Leia a fórmula devagar, nomeando cada termo: instrução é a sua '
          'mensagem; contexto durável é o que já estava lá; ferramentas é o '
          'que a IA pode executar; verificação é o que reprova o trabalho.',
      'Em tarefa simples a instrução é quase tudo. Em contexto técnico '
          'complexo ela cai para uns 10%.',
      'Cuidado com o mal-entendido: não é que escrever bem não importe. É que '
          'o retorno marginal despenca. Melhorar 20% o texto não move nada; '
          'adicionar o invariante certo move tudo.',
      'Fecha: o modelo não erra por frase ruim. Erra por não ter os critérios '
          'de decisão do projeto.',
    ],
    glossary: [
      (
        'Contexto durável',
        'contexto que já está no repositório antes de você abrir a boca — '
            'arquivo de regras, testes, tipos, CI. "Durável" porque sobrevive '
            'ao fim da conversa.'
      ),
      (
        'Retorno marginal',
        'quanto você ganha a mais por cada unidade extra de esforço.'
      ),
      (
        'Invariante',
        'propriedade que tem que ser verdade sempre, em qualquer estado do '
            'sistema.'
      ),
    ],
    bridge: 'Tem um jeito de guardar isso na cabeça.',
  ),

  // 5 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '06:00',
    title: 'Prompt = delta.  Contexto = base.',
    opening: 'Se vocês levarem uma frase só desta palestra, que seja esta. E '
        'deixa eu traduzir, porque "delta" não é óbvio.',
    beats: [
      'DELTA = a diferença, o incremento, o pedacinho que muda. Vem da '
          'matemática: variação entre dois estados.',
      'Traduzindo a frase: o prompt é só a parte nova que você acrescenta por '
          'cima de uma base que já existe. A base é o contexto do projeto.',
      'Analogia que sempre funciona: você não explica a arquitetura inteira '
          'para um colega toda vez que pede um ajuste. Ele já tem a base. '
          'Você só passa o delta. Com a IA é igual — a diferença é que a base '
          'dela é o que está escrito no repositório.',
      'Consequência prática: prompt ruim sobre base boa ganha de prompt ótimo '
          'sobre base zero. Sempre.',
      'Percorra o que está embaixo da linha: tipos, testes, lint, CI, hooks, '
          'convenções, decisões registradas, cicatrizes de bugs, definição de '
          'pronto, escopo fechado, comandos.',
    ],
    glossary: [
      (
        'Delta',
        'a diferença / o incremento. Aqui: só a parte nova que você precisa '
            'dizer, porque o resto já está escrito no projeto.'
      ),
      ('Base', 'o contexto acumulado que a IA lê sozinha, sem você pedir.'),
      (
        'Lint',
        'ferramenta que reprova código fora do padrão, automaticamente.'
      ),
      (
        'CI',
        'Continuous Integration — o robô que roda os testes a cada push e '
            'barra o merge se algo falhar.'
      ),
      (
        'Hook',
        'gatilho automático: roda um comando quando algo acontece, por '
            'exemplo ao salvar um arquivo.'
      ),
    ],
    bridge: 'E aqui entra exatamente o que vocês já usam no dia a dia.',
  ),

  // 6 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '08:00',
    title: 'BMAD e SDD são máquinas de fabricar a parte de baixo',
    opening: 'Vocês já fazem isso. Só não com esse nome.',
    beats: [
      'SDD: a especificação é o artefato durável, e o código deriva dela.',
      'BMAD: agentes-persona geram PRD e arquitetura, e depois fatiam isso em '
          'stories que já carregam o contexto necessário para serem '
          'executadas por um agente que não estava na conversa.',
      'O ponto que quero cravar: não são metodologias concorrentes de prompt. '
          'São duas máquinas de fabricar a parte de baixo do iceberg.',
      'Consequência: o time para de discutir "qual framework" e passa a '
          'discutir "que contexto durável está faltando".',
      'E dá para fazer à mão, sem framework. Os próximos 7 slides são isso.',
    ],
    glossary: [
      (
        'SDD',
        'Spec-Driven Development — a especificação é a fonte da verdade e o '
            'código é derivado dela.'
      ),
      (
        'BMAD',
        'Breakthrough Method for Agile AI-Driven Development — framework com '
            'agentes-persona (analista, PM, arquiteto, dev) que produzem PRD e '
            'arquitetura e depois fatiam em stories.'
      ),
      (
        'PRD',
        'Product Requirements Document — o documento que descreve o que o '
            'produto tem que fazer.'
      ),
      (
        'Story',
        'unidade pequena e fechada de trabalho, com critério de aceite '
            'próprio.'
      ),
    ],
    bridge: 'Sete padrões. Cada um em um slide, cada um com o errado e o certo '
        'lado a lado.',
  ),

  // 7 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '10:00',
    title: '7 padrões de contexto durável',
    opening: 'Sete padrões, dez minutos. Cada slide tem a mesma forma: o que '
        'as pessoas escrevem, o que funciona, e por quê.',
    beats: [
      'Avise que nada aqui é Flutter, Claude ou Cursor. Vale em qualquer '
          'linguagem, framework e ferramenta.',
      'Não leia os sete nomes em voz alta — eles estão na tela. Só dê o '
          'formato e siga.',
    ],
    warning: 'Marco de ritmo: você tem que sair deste slide aos 11:00. Se '
        'estiver atrasado, pule os padrões 3 e 7 depois — o argumento fica de '
        'pé sem eles.',
    bridge: 'Padrão um.',
  ),

  // 8 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '11:00',
    title: 'Padrão 1 — Critério de decisão, não descrição',
    opening: 'O erro mais comum de todos: escrever descrição achando que é '
        'regra.',
    beats: [
      '✗ "Seguimos os padrões de design do projeto." Verdadeiro e inútil. O '
          'modelo lê, concorda, e faz exatamente o que ia fazer.',
      '✓ "Toda tela nova declara qual seção do design system ela usa. Não '
          'achou a seção? Não é para construir." Isso decide um caso que você '
          'nunca enumerou.',
      'Dê o teste prático: leia a sua linha e pergunte "com só isso, o modelo '
          'resolve um caso novo?". Se não resolve, é descrição.',
      'Fecha: descrição o modelo recita de volta. Critério ele aplica.',
    ],
    glossary: [
      (
        'Critério de decisão',
        'regra que permite decidir um caso que você não listou antes.'
      ),
      (
        'Design system',
        'o conjunto de regras visuais e componentes que padroniza a interface '
            'de um produto.'
      ),
    ],
  ),

  // 9 ─────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '12:15',
    title: 'Padrão 2 — Feche o caminho errado mais provável',
    opening: 'Pergunta para vocês: qual erro a IA comete no seu projeto toda '
        'semana? Escreve esse.',
    beats: [
      '✗ Silêncio. Ninguém escreveu nada, então toda semana o agente '
          'reimplementa do zero um botão que o framework já tem.',
      '✓ A regra COM o motivo junto: "Não implementamos componentes. O '
          'framework tem. Se ele tem ou está prestes a ter, entregue o token '
          'e pare."',
      'Insista no motivo: regra sem motivo vira burocracia, e modelo bom '
          'contorna burocracia quando o caso parece diferente. Com o motivo, '
          'ele consegue julgar se a regra se aplica.',
      'Prática que cabe na segunda-feira: toda vez que você corrigir a mesma '
          'coisa pela terceira vez, aquilo vira linha de contexto.',
    ],
    glossary: [
      (
        'Token (design)',
        'valor nomeado do design system — "espaçamento médio" em vez do '
            'número 16 solto no código.'
      ),
    ],
  ),

  // 10 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '13:30',
    title: 'Padrão 3 — Invariante como forma, não como prosa',
    opening: 'Tem invariante que é impossível escrever em prosa sem virar '
        'interpretação.',
    beats: [
      '✗ "Mantenha as camadas desacopladas." Todo mundo concorda, e ninguém '
          'sabe dizer o que exatamente está proibido.',
      '✓ O desenho: domain → application → infrastructure, e a seta de volta '
          'marcada como "nunca".',
      'Uma forma se confere: você bate o olho num import e sabe. Um parágrafo '
          'se interpreta.',
      'Bônus que vale mencionar: forma é o que você consegue transformar em '
          'teste depois. Prosa não.',
    ],
    glossary: [
      (
        'Camadas',
        'domain = regra de negócio; application = casos de uso; '
            'infrastructure = banco, HTTP, framework. A regra de negócio não '
            'pode depender do banco.'
      ),
      (
        'Import',
        'a linha que declara que um arquivo depende de outro. É onde a '
            'violação de camada aparece.'
      ),
    ],
  ),

  // 11 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '14:45',
    title: 'Padrão 4 — Tecido cicatricial',
    opening: 'Este é o mais subestimado da lista, e é o que praticamente '
        'ninguém faz.',
    beats: [
      '✗ O mesmo bug volta a cada seis meses. Ninguém lembra por que aquilo '
          'era proibido.',
      '✓ "Nunca case duas listas paralelas por índice. Foi o bug da v1.6."',
      'A chave, e diga isso devagar: a versão ruim foi DELETADA. O código não '
          'pode te contar. Nem a IA nem o dev novo têm como saber — a '
          'informação não existe mais em lugar nenhum, a não ser que alguém a '
          'escreva.',
      'Por isso chamo de tecido cicatricial: é o registro da ferida, não a '
          'ferida.',
      'Prática: no post-mortem, a saída não é só o fix. É a linha no arquivo '
          'de contexto.',
    ],
    glossary: [
      (
        'Tecido cicatricial',
        'termo meu: regra escrita a partir de uma falha real, que preserva um '
            'aprendizado que o código já não mostra.'
      ),
      (
        'Post-mortem',
        'a análise feita depois de um incidente, para achar a causa e evitar '
            'a repetição.'
      ),
      (
        'Listas paralelas por índice',
        'duas listas mantidas na mão em que o item 3 de uma tem que '
            'corresponder ao item 3 da outra. Quebra silenciosamente quando '
            'alguém insere no meio.'
      ),
    ],
  ),

  // 12 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '16:00',
    title: 'Padrão 5 — Definição de pronto explícita',
    opening: 'O modelo para exatamente onde você mandou parar. Nem um passo '
        'além.',
    beats: [
      '✗ "Implementa a feature X." E ele implementa a feature X. Só isso. Sem '
          'teste, sem doc, sem changelog.',
      '✓ "Pronto = código + teste + README + exemplo + changelog + doc."',
      'Desarme a leitura errada: não é o modelo sendo preguiçoso. É você não '
          'ter dito onde fica a linha de chegada.',
      'No projeto real são 9 artefatos. Parece exagero — é a diferença entre '
          '"funciona" e "entregue".',
    ],
    glossary: [
      (
        'Definition of done',
        'a lista do que precisa existir para a tarefa contar como concluída.'
      ),
      (
        'Changelog',
        'o arquivo que registra o que mudou em cada versão publicada.'
      ),
    ],
  ),

  // 13 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '17:15',
    title: 'Padrão 6 — Verificação executável embutida',
    opening: 'Se vocês levarem um padrão só desta lista, levem este.',
    beats: [
      '✗ "Mantenha a documentação em sincronia com o código." É adjetivo. Não '
          'reprova nada, nunca.',
      '✓ Um comando que falha. E o CI roda exatamente o mesmo comando.',
      'Por que importa tanto: contexto em prosa apodrece em silêncio. Comando '
          'não apodrece — ou passa, ou falha.',
      'A frase: um prompt que termina em comando vale dez que terminam em '
          'adjetivo.',
      'Detalhe que vale ouro: local e CI rodando o MESMO script é o que '
          'impede as duas listas de checagem de divergirem entre si.',
    ],
    glossary: [
      (
        'Gate',
        'portão: o conjunto de checagens que o código precisa passar antes de '
            'entrar no projeto.'
      ),
    ],
  ),

  // 14 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '18:30',
    title: 'Padrão 7 — Vença os defaults da ferramenta',
    opening: 'Último. E é o mais fácil de esquecer, porque não é sobre o '
        'código — é sobre a ferramenta.',
    beats: [
      '✗ Você nunca disse nada. Aí a ferramenta assina os seus commits com o '
          'nome dela, porque o template padrão dela manda assinar.',
      '✓ Diga explicitamente quem ganha — inclusive contra o template da '
          'própria ferramenta.',
      'O seu contexto disputa espaço com duas forças: os priors do modelo e '
          'os defaults da ferramenta.',
      'Se você não declarar o vencedor, o default vence. Todas as vezes.',
    ],
    glossary: [
      (
        'Priors',
        'as tendências que o modelo já traz do treinamento — o que ele faria '
            'por padrão se você não mandasse nada.'
      ),
      (
        'Default / template da ferramenta',
        'comportamento que o Cursor, o Copilot ou o Claude Code aplicam '
            'sozinhos quando você não sobrescreve.'
      ),
      ('Commit', 'o registro de uma mudança no histórico do Git.'),
    ],
    bridge: 'Fim dos sete. Agora o ponto mais profundo.',
  ),

  // 15 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '20:00',
    title: 'Contexto apodrece. A não ser que uma máquina o confira.',
    opening: 'Agora o ponto mais profundo da palestra. Todo contexto '
        'apodrece.',
    beats: [
      'Coluna da esquerda: doc em prosa, convenção combinada na reunião, '
          'comentário no código, memória de quem estava lá. Tudo isso passa a '
          'mentir com o tempo, e ninguém percebe.',
      'Coluna da direita: tipo que recusa o valor errado, teste que compila o '
          'exemplo do README, script que falha quando doc e código divergem, '
          'regra de lint no CI.',
      'A diferença entre as colunas não é qualidade da escrita. É se existe '
          'uma máquina conferindo.',
      'A frase: um doc que mente é mais caro que um doc ausente. Ausente você '
          'desconfia e vai ler o código. Mentindo, você segue.',
    ],
    glossary: [
      (
        'Drift',
        'a divergência lenta entre o que está documentado e o que o código '
            'realmente faz.'
      ),
    ],
    bridge: 'E eu não estou falando isso por teoria.',
  ),

  // 16 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '21:45',
    title: '"Doc e código nunca divergem." Escrito há 6 releases.',
    opening: 'Isto não é teoria. É o que aconteceu no meu projeto, no mês '
        'passado.',
    beats: [
      'A regra "doc e código nunca divergem" estava escrita no meu arquivo de '
          'contexto desde a 1.0.',
      'Seis releases. Ninguém conferia. E eu achava que estava cumprindo.',
      'Transformei a regra em script. Primeira execução: 9 APIs públicas sem '
          'documentação, 2 seções inteiras faltando no meu próprio README, 1 '
          'classe anunciada na tela que nunca existiu em versão nenhuma, e 5 '
          'testes quebrando pelo motivo errado.',
      'Dezessete problemas. Nenhum compilador via nenhum deles.',
    ],
    warning: 'PAUSE AQUI. Três segundos de silêncio depois do "dezessete". É o '
        'momento mais forte da apresentação — não atropele.',
    glossary: [
      (
        'API pública',
        'a parte da biblioteca que quem instala consegue usar de fora.'
      ),
      (
        'README',
        'o arquivo de apresentação do projeto, a primeira coisa que alguém lê.'
      ),
    ],
    bridge: 'E aqui a coisa fecha de um jeito que eu não tinha planejado.',
  ),

  // 17 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '23:30',
    title: 'A mesma filosofia, dois níveis',
    opening: 'Repare no que aconteceu sem eu ter projetado.',
    beats: [
      'Esquerda: os tipos da lib são contrato para quem USA o código. O '
          'compilador recusa o valor errado.',
      'Direita: o arquivo de contexto mais o script são contrato para quem '
          'ESCREVE o código. O CI recusa a divergência.',
      'É a mesma filosofia em dois níveis: torne o certo estrutural, torne o '
          'desvio visível.',
      'O gancho para a plateia: se vocês já defendem tipagem forte, vocês já '
          'concordam comigo. Só nunca aplicaram esse raciocínio ao próprio '
          'processo de trabalho.',
    ],
    glossary: [
      (
        'Estrutural',
        'imposto pela estrutura, não pela disciplina de quem usa. Você não '
            'precisa lembrar — não dá para fazer errado.'
      ),
      (
        'Tipagem forte',
        'o compilador recusa valores do tipo errado antes do programa rodar.'
      ),
    ],
  ),

  // 18 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '25:00',
    title: 'Reimplementei ~80% do BMAD sem saber',
    opening: 'Voltando ao BMAD, agora com o que a gente construiu no meio.',
    beats: [
      'Eu não usei BMAD neste projeto. E ainda assim reimplementei a maior '
          'parte dele, sem saber que estava fazendo isso.',
      'Percorra a tabela linha a linha — é rápido e o paralelo se vende '
          'sozinho: PRD virou roadmap com fases; documento de arquitetura '
          'virou arquivo de regras; stories viraram itens numerados com '
          'critério; definition of done virou checklist de 9 artefatos; QA '
          'gate virou script mais CI; registro de conclusão virou changelog '
          'explicando o porquê.',
      'Conclusão honesta, e diga com essas palavras: se o framework cabe no '
          'seu time, ótimo, use. Se não cabe, essas seis linhas cabem em '
          'qualquer projeto.',
    ],
    glossary: [
      (
        'Handoff',
        'passagem de bastão — quando outra pessoa, ou outro agente, continua '
            'um trabalho que não começou.'
      ),
      (
        'Roadmap',
        'o plano do que será feito, em fases, com o estado de cada item.'
      ),
    ],
  ),

  // 19 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '26:30',
    title: 'Então eu adoto o framework ou não?',
    opening: 'A pergunta que sempre vem: então eu adoto o framework ou não?',
    beats: [
      'Paga quando três coisas são verdade: ambiguidade de requisito alta, '
          'muitas sessões ao longo de meses, e existe handoff entre pessoas.',
      'Custa quando: a spec já é externa e precisa, o time é de um, e os '
          'incrementos são pequenos e bem definidos.',
      'O modo de falha de TODO framework é artefato desatualizado: você gera '
          'PRD e arquitetura, o código anda, e agora você tem contexto '
          'confiantemente errado — que é pior que contexto nenhum.',
      'Para quem trabalha sozinho: roube três peças e pule o resto. O plano '
          'vai para um arquivo em vez de morrer no chat; cada tarefa carrega '
          'o próprio critério de aceite; e quem revisa entra em contexto novo, '
          'porque quem escreveu o plano defende o plano.',
      'Sobre janela de contexto: 1 milhão de tokens não é qualidade de '
          'contexto. Sessão longa degrada atenção do mesmo jeito.',
    ],
    glossary: [
      (
        'Janela de contexto',
        'quanto texto o modelo consegue considerar de uma vez.'
      ),
      (
        'Token',
        'pedaço de texto de mais ou menos 4 caracteres. É a unidade em que a '
            'janela é medida.'
      ),
      (
        'Cerimônia',
        'o ritual do processo — reuniões, papéis formais, documentos '
            'obrigatórios.'
      ),
    ],
    bridge: 'Três frases para levar.',
  ),

  // 20 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '28:00',
    title: 'Três frases para levar',
    opening: 'Três frases, e eu termino.',
    beats: [
      'Leia devagar, com pausa entre elas. Não comente as duas primeiras — '
          'elas se explicam.',
      'A terceira está em verde de propósito: é a cor de "se impõe" do slide '
          'de apodrece versus se impõe. Se alguém reparar, é um bom detalhe '
          'para comentar.',
    ],
  ),

  // 21 ────────────────────────────────────────────────────────────────────
  SlideNotes(
    clock: '29:00',
    title: 'Obrigado',
    opening: 'Obrigado. Os links estão aí, a lib é aberta.',
    beats: [
      'Convite concreto: quem quiser ver o arquivo de contexto real, é o '
          'CLAUDE.md na raiz do repositório. Está versionado.',
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
        'ninguém confere apodrece — foi exatamente o que aconteceu comigo por '
        'seis releases.',
  ),
  Faq(
    'Quanto tempo você gastou montando esse contexto?',
    'O arquivo de regras cresceu junto com o projeto, nunca de uma vez — hoje '
        'tem umas 300 linhas, acumuladas ao longo de meses. Os scripts de '
        'verificação foram meio dia de trabalho. O retorno apareceu na '
        'primeira execução: 17 problemas reais.',
  ),
  Faq(
    'Isso não engessa a IA? Ela fica pior em tarefa criativa?',
    'Restringe onde você já decidiu e libera no resto. O que engessa de '
        'verdade é regra sem motivo — por isso todo padrão aqui inclui o '
        'porquê. Com o motivo escrito, quando o caso é genuinamente novo o '
        'modelo tem base para reconhecer que a regra não se aplica e dizer '
        'isso, em vez de obedecer cegamente.',
  ),
  Faq(
    'Funciona no Cursor, Copilot, Windsurf? Depende do Claude?',
    'É agnóstico. Todo assistente sério lê um arquivo de convenções do '
        'repositório — muda o nome (CLAUDE.md, .cursorrules, '
        'copilot-instructions.md), não a ideia. E o padrão 6, verificação '
        'executável, funciona mesmo sem IA nenhuma: é só CI.',
  ),
  Faq(
    'E se o contexto crescer demais e estourar a janela?',
    'Dois pontos. Primeiro, é menos problema hoje — as janelas são de '
        'centenas de milhares de tokens. Segundo, e mais importante: se o seu '
        'arquivo está gigante, provavelmente ele está descrevendo em vez de '
        'decidir. Critério é curto. Descrição é infinita.',
  ),
  Faq(
    'Como você convence o time a manter isso atualizado?',
    'Não convence — automatiza. É o padrão 6. Regra que depende de alguém '
        'lembrar vai ser quebrada, e o problema não é má vontade, é '
        'estatística. Coloque no CI e a manutenção deixa de ser negociação.',
  ),
  Faq(
    'Vale a pena adotar BMAD no nosso caso?',
    'Depende de três coisas: ambiguidade de requisito, número de sessões e se '
        'existe handoff entre pessoas. Se os três forem altos, sim. Se a spec '
        'é externa e precisa, o time é pequeno e os incrementos são bem '
        'definidos, o custo de cerimônia supera o ganho — e aí vale roubar as '
        'três peças do slide 19.',
  ),
  Faq(
    'Você confia na IA para publicar uma release sozinha?',
    'Não é questão de confiança, é de portão. A IA propõe, o gate decide. '
        'Rodo um script que confere formatação, análise estática, testes, '
        'sincronia entre doc e código, e o changelog contra o que está '
        'publicado. O que passa, passa — independente de quem escreveu.',
  ),
  Faq(
    'Quanto disso depende de você estar sozinho no projeto?',
    'A vantagem de estar sozinho é não precisar negociar. A desvantagem é não '
        'ter ninguém para me corrigir — e foi justamente por isso que eu '
        'precisei tanto de verificação automatizada. Em time, a mesma '
        'estrutura serve de contrato entre pessoas, não só com a IA. Muda a '
        'motivação, não a receita.',
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
        'padrão 2, custa cinco minutos, e dá para medir o efeito já na semana '
        'seguinte.',
  ),
];
