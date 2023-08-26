import 'package:wordle/app/shared/utils/string_extension.dart';

List<String> wordlist = [
  "sagaz",
  "negro",
  "êxito",
  "termo",
  "mexer",
  "nobre",
  "senso",
  "afeto",
  "algoz",
  "ética",
  "plena",
  "mútua",
  "fazer",
  "assim",
  "sutil",
  "vigor",
  "aquém",
  "porém",
  "seção",
  "sanar",
  "audaz",
  "fosse",
  "ideia",
  "cerne",
  "poder",
  "inato",
  "moral",
  "desde",
  "sobre",
  "justo",
  "muito",
  "honra",
  "torpe",
  "sonho",
  "fútil",
  "razão",
  "etnia",
  "ícone",
  "anexo",
  "amigo",
  "lapso",
  "expor",
  "haver",
  "mútuo",
  "dengo",
  "casal",
  "tempo",
  "hábil",
  "então",
  "seara",
  "boçal",
  "ávido",
  "pesar",
  "ardil",
  "genro",
  "causa",
  "saber",
  "posse",
  "dizer",
  "graça",
  "coser",
  "óbice",
  "dever",
  "prole",
  "tenaz",
  "corja",
  "brado",
  "crivo",
  "detém",
  "comum",
  "sendo",
  "ânimo",
  "ápice",
  "temor",
  "ânsia",
  "ceder",
  "digno",
  "ainda",
  "pauta",
  "culto",
  "assaz",
  "atroz",
  "estar",
  "mundo",
  "censo",
  "fugaz",
  "gleba",
  "forte",
  "vício",
  "vulgo",
  "valha",
  "xibiu",
  "cozer",
  "denso",
  "neném",
  "revés",
  "pudor",
  "regra",
  "dogma",
  "louco",
  "criar",
  "saúde",
  "jeito",
  "atrás",
  "banal",
  "ordem",
  "impor",
  "mesmo",
  "clava",
  "mercê",
  "pedir",
  "homem",
  "feliz",
  "apraz",
  "tenro",
  "desse",
  "pífio",
  "usura",
  "coisa",
  "sábio",
  "servo",
  "juízo",
  "prosa",
  "limbo",
  "presa",
  "forma",
  "reaça",
  "viril",
  "todos",
  "ontem",
  "falar",
  "cunho",
  "manso",
  "devir",
  "meiga",
  "posso",
  "vendo",
  "fluir",
  "ébrio",
  "afago",
  "mágoa",
  "certo",
  "sério",
  "herói",
  "platô",
  "puder",
  "guisa",
  "valor",
  "visar",
  "acaso",
  "lugar",
  "temer",
  "ímpio",
  "falso",
  "afins",
  "abrir",
  "pleno",
  "cisma",
  "bruma",
  "óbvio",
  "fácil",
  "obter",
  "gerar",
  "êxodo",
  "crise",
  "legal",
  "matiz",
  "praxe",
  "garbo",
  "senil",
  "fluxo",
  "vênia",
  "burro",
  "havia",
  "união",
  "tédio",
  "enfim",
  "ritmo",
  "tomar",
  "visão",
  "álibi",
  "linda",
  "parvo",
  "olhar",
  "morte",
  "gênio",
  "bravo",
  "pulha",
  "levar",
  "favor",
  "vital",
  "reter",
  "prumo",
  "valia",
  "casta",
  "brega",
  "grato",
  "parco",
  "reles",
  "vivaz",
  "laico",
  "ajuda",
  "possa",
  "tecer",
  "falta",
  "ameno",
  "sábia",
  "noção",
  "ranço",
  "cabal",
  "óbito",
  "prime",
  "ouvir",
  "viver",
  "carma",
  "noite",
  "nicho",
  "achar",
  "selar",
  "força",
  "fator",
  "façam",
  "calma",
  "rogar",
  "outro",
  "anelo",
  "farsa",
  "coeso",
  "passo",
  "fardo",
  "citar",
  "épico",
  "ativo",
  "pobre",
  "cisão",
  "sinto",
  "único",
  "adiar",
  "tendo",
  "dúbio",
  "rever",
  "sonso",
  "leigo",
  "ciúme",
  "gente",
  "haste",
  "sesta",
  "terra",
  "humor",
  "cesta",
  "sulco",
  "deter",
  "tende",
  "exato",
  "revel",
  "amplo",
  "velho",
  "vemos",
  "claro",
  "lavra",
  "labor",
  "atuar",
  "árduo",
  "imune",
  "feixe",
  "ponto",
  "igual",
  "gesto",
  "ideal",
  "ótica",
  "débil",
  "hiato",
  "marco",
  "terno",
  "fonte",
  "líder",
  "ambos",
  "toada",
  "sonsa",
  "vácuo",
  "varão",
  "remir",
  "cauda",
  "senão",
  "capaz",
  "jovem",
  "ficar",
  "papel",
  "vazio",
  "inata",
  "fusão",
  "velar",
  "coçar",
  "tenra",
  "caçar",
  "xeque",
  "leito",
  "relva",
  "horda",
  "tanto",
  "farão",
  "advém",
  "algum",
  "série",
  "probo",
  "apoio",
  "doido",
  "raiva",
  "pouco",
  "entre",
  "coesa",
  "sente",
  "frase",
  "nossa",
  "vimos",
  "torço",
  "anuir",
  "verso",
  "minha",
  "feito",
  "botar",
  "rigor",
  "massa",
  "cruel",
  "dorso",
  "signo",
  "brisa",
  "chuva",
  "blasé",
  "ímpar",
  "ciclo",
  "moção",
  "chata",
  "prece",
  "fauna",
  "credo",
  "covil",
  "lazer",
  "preso",
  "trama",
  "casto",
  "morar",
  "maior",
  "peste",
  "ambas",
  "furor",
  "carro",
  "pegar",
  "dócil",
  "flora",
  "faina",
  "vírus",
  "adeus",
  "sorte",
  "vetor",
  "houve",
  "árido",
  "seita",
  "livro",
  "setor",
  "meses",
  "liame",
  "senda",
  "manha",
  "pecha",
  "beata",
  "peixe",
  "aceso",
  "comer",
  "banzo",
  "ardor",
  "plano",
  "vulto",
  "visse",
  "nunca",
  "salvo",
  "breve",
  "vasto",
  "ocaso",
  "antro",
  "saiba",
  "aliás",
  "morro",
  "birra",
  "pajem",
  "prado",
  "reger",
  "rezar",
  "séria",
  "saída",
  "segue",
  "átomo",
  "avaro",
  "mudar",
  "junto",
  "ótimo",
  "motim",
  "áureo",
  "sinal",
  "chulo",
  "serão",
  "parte",
  "praia",
  "grupo",
  "campo",
  "lenda",
  "acima",
  "andar",
  "fugir",
  "opção",
  "nação",
  "brava",
  "treta",
  "parar",
  "fitar",
  "fruir",
  "risco",
  "leite",
  "anais",
  "jazia",
  "rapaz",
  "ídolo",
  "prazo",
  "tenso",
  "agora",
  "gerir",
  "anciã",
  "puxar",
  "alude",
  "bando",
  "norma",
  "tosco",
  "vilão",
  "antes",
  "época",
  "áurea",
  "psico",
  "tirar",
  "malta",
  "exame",
  "índio",
  "reino",
  "sinhá",
  "texto",
  "arcar",
  "avião",
  "conta",
  "verbo",
  "praga",
  "corpo",
  "aonde",
  "venal",
  "filho",
  "preto",
  "cheio",
  "quota",
  "quase",
  "prova",
  "voraz",
  "traga",
  "logro",
  "certa",
  "estão",
  "soldo",
  "fatal",
  "sumir",
  "turba",
  "fixar",
  "oxalá",
  "apego",
  "acesa",
  "cópia",
  "festa",
  "manhã",
  "átrio",
  "pompa",
  "oásis",
  "ligar",
  "fatos",
  "caixa",
  "coito",
  "nódoa",
  "alado",
  "virão",
  "nível",
  "mente",
  "solto",
  "messe",
  "perda",
  "tocar",
  "lindo",
  "verve",
  "fraco",
  "turva",
  "exijo",
  "magia",
  "afora",
  "livre",
  "apelo",
  "parca",
  "grave",
  "dessa",
  "jirau",
  "sarça",
  "tinha",
  "lidar",
  "opaco",
  "doído",
  "parva",
  "pardo",
  "firme",
  "trupe",
  "fenda",
  "sabia",
  "longe",
  "glosa",
  "elite",
  "faixa",
  "astro",
  "navio",
  "grata",
  "bater",
  "alçar",
  "viria",
  "salve",
  "vezes",
  "nosso",
  "autor",
  "ficha",
  "supra",
  "ético",
  "sexta",
  "pique",
  "cioso",
  "reses",
  "retém",
  "porta",
  "irmão",
  "atual",
  "deixa",
  "junco",
  "calda",
  "verba",
  "macio",
  "bicho",
  "douto",
  "cânon",
  "cousa",
  "pagão",
  "besta",
  "privê",
  "posto",
  "abriu",
  "curso",
  "abuso",
  "judeu",
  "molho",
  "supor",
  "torso",
  "bônus",
  "locus",
  "drops",
  "caber",
  "light",
  "extra",
  "vídeo",
  "rádio",
  "bioma",
  "desta",
  "asilo",
  "culpa",
  "vosso",
  "menos",
  "combo",
  "zelar",
  "ígneo",
  "júlia",
  "órfão",
  "vinha",
  "turvo",
  "baixo",
  "calão",
  "ruína",
  "pisar",
  "gosto",
  "agudo",
  "rouca",
  "advir",
  "ereto",
  "suave",
  "super",
  "sítio",
  "traço",
  "facho",
  "estio",
  "paira",
  "chato",
  "finda",
  "aluno",
  "turma",
  "facto",
  "meigo",
  "surja",
  "ações",
  "pilar",
  "amena",
  "pódio",
  "lápis",
  "cútis",
  "feudo",
  "louça",
  "chama",
  "mosto",
  "tento",
  "urgia",
  "peito",
  "autos",
  "rumor",
  "piada",
  "tetra",
  "museu",
  "brabo",
  "pífia",
  "cocho",
  "acolá",
  "local",
  "refém",
  "clean",
  "páreo",
  "geral",
  "boato",
  "lasso",
  "hobby",
  "optar",
  "mesma",
  "drama",
  "ávida",
  "poema",
  "medir",
  "folga",
  "passa",
  "coral",
  "metiê",
  "clima",
  "teste",
  "rubro",
  "pacto",
  "crime",
  "ateia",
  "ponha",
  "poeta",
  "golpe",
  "forem",
  "móvel",
  "feroz",
  "penta",
  "cacho",
  "lição",
  "letal",
  "vigia",
  "aroma",
  "cetro",
  "tacha",
  "busca",
  "daqui",
  "açude",
  "verde",
  "monte",
  "hoste",
  "pasmo",
  "riste",
  "aviso",
  "idoso",
  "calmo",
  "carta",
  "swing",
  "vetar",
  "ecoar",
  "amiga",
  "rival",
  "troça",
  "fazia",
  "plumo",
  "fórum",
  "cover",
  "tribo",
  "monge",
  "lesse",
  "ébano",
  "briga",
  "falha",
  "conto",
  "plebe",
  "finjo",
  "roupa",
  "artur",
  "pedra",
  "súcia",
  "corso",
  "tarde",
  "axila",
  "escol",
  "venha",
  "manga",
  "chefe",
  "única",
  "fruto",
  "macro",
  "plaga",
  "grama",
  "cargo",
  "sarau",
  "civil",
  "sósia",
  "vento",
  "casar",
  "átimo",
  "bença",
  "saldo",
  "perco",
  "mangá",
  "itens",
  "farta",
  "berro",
  "úteis",
  "virar",
  "viram",
  "légua",
  "ornar",
  "nuvem",
  "arado",
  "bruta",
  "catre",
  "troca",
  "beijo",
  "fosso",
  "tiver",
  "seixo",
  "magna",
  "gíria",
  "pinho",
  "jejum",
  "traje",
  "vazão",
  "deste",
  "estro",
  "amada",
  "assar",
  "surto",
  "órgão",
  "renda",
  "tição",
  "areia",
  "perto",
  "trato",
  "tutor",
  "porte",
  "inter",
  "bruto",
  "canso",
  "amado",
  "mídia",
  "ímpia",
  "recém",
  "stand",
  "gabar",
  "feita",
  "silvo",
  "bazar",
  "rural",
  "vedar",
  "guria",
  "arfar",
  "depor",
  "natal",
  "âmbar",
  "volta",
  "grota",
  "irado",
  "nesse",
  "tchau",
  "cifra",
  "bucho",
  "jogar",
  "laudo",
  "pavor",
  "vadio",
  "régio",
  "deram",
  "fossa",
  "odiar",
  "pomar",
  "close",
  "clero",
  "rocha",
  "segar",
  "mamãe",
  "vagar",
  "minar",
  "meche",
  "xucro",
  "bolsa",
  "canto",
  "aviar",
  "negar",
  "pasma",
  "molde",
  "lesão",
  "visto",
  "cenho",
  "densa",
  "cinto",
  "proto",
  "chula",
  "marca",
  "troco",
  "sótão",
  "invés",
  "logos",
  "nesta",
  "vista",
  "horto",
  "todas",
  "largo",
  "etapa",
  "santo",
  "paiol",
  "morfo",
  "tenha",
  "ruído",
  "ferpa",
  "nessa",
  "velha",
  "lesto",
  "cheia",
  "urdir",
  "varoa",
  "penso",
  "dúbia",
  "podar",
  "pugna",
  "cerca",
  "vasta",
  "úbere",
  "ágape",
  "ileso",
  "ufano",
  "mocho",
  "símio",
  "coroa",
  "salmo",
  "burra",
  "frota",
  "esgar",
  "fundo",
  "verão",
  "letra",
  "cível",
  "final",
  "bulir",
  "linha",
  "úmido",
  "narco",
  "piche",
  "ceita",
  "trago",
  "apear",
  "pólis",
  "resto",
  "calor",
  "jazer",
  "culta",
  "preço",
  "ardis",
  "manto",
  "misto",
  "peita",
  "folha",
  "troço",
  "matar",
  "álamo",
  "folia",
  "monta",
  "redor",
  "dança",
  "cosmo",
  "seiva",
  "lábia",
  "neste",
  "banto",
  "chaga",
  "áudio",
  "bolso",
  "mover",
  "álbum",
  "queda",
  "barro",
  "barão",
  "campa",
  "gemer",
  "limpo",
  "demão",
  "findo",
  "retro",
  "canil",
  "porca",
  "venho",
  "calvo",
  "axial",
  "macho",
  "punha",
  "louro",
  "fazes",
  "sabor",
  "logia",
  "arroz",
  "farol",
  "lutar",
  "justa",
  "mimar",
  "rente",
  "salva",
  "calça",
  "lousa",
  "enjoo",
  "firma",
  "veloz",
  "sofia",
  "chave",
  "baixa",
  "bedel",
  "nácar",
  "torna",
  "zumbi",
  "coevo",
  "sigla",
  "longo",
  "vazia",
  "míope",
  "solta",
  "fugiu",
  "ousar",
  "forro",
  "reler",
  "gueto",
  "tumba",
  "falsa",
  "sexto",
  "farto",
  "corar",
  "lucro",
  "pedro",
  "fátuo",
  "outra",
  "subir",
  "urgir",
  "vário",
  "dados",
  "valer",
  "penca",
  "nariz",
  "louca",
  "mania",
  "repor",
  "custo",
  "cacto",
  "sugar",
  "obtém",
  "harém",
  "cardo",
  "ultra",
  "passe",
  "sadio",
  "versa",
  "corte",
  "puído",
  "modal",
  "sinta",
  "quite",
  "disso",
  "lento",
  "diabo",
  "staff",
  "hífen",
  "sabiá",
  "mimos",
  "choça",
  "xampu",
  "toque",
  "usual",
  "bruxa",
  "filme"
].map((e) => e.removeAccents().toUpperCase()).toList();
