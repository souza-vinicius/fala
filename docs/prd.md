# Fala

## Resumo

O Fala é um ditado para macOS que roda no próprio Mac. A pessoa fala e o texto entra no campo em que ela já está. O mesmo texto vira um recorte na bandeja, visível no notch e no Dock, para colar de novo. O modelo é Gemma 4 e o áudio não sai da máquina.

## Contexto

O Wispr Flow já faz o gesto de falar e ter texto no campo ativo, em qualquer aplicativo. A [página de recursos do Wispr Flow](https://wisprflow.ai/features) descreve pontuação, retirada de vícios de fala e atalhos de voz que colam um texto salvo antes. O [artigo sobre começar a ditar](https://docs.wisprflow.ai/articles/6409258247-starting-your-first-dictation) descreve o uso breve da área de transferência no Mac para inserir o texto, com tentativa de devolver a cópia anterior.

O Fala cobre esse gesto do dia a dia, com duas diferenças pedidas. O modelo fica no aparelho. Os trechos falados ficam numa bandeja temporária, e continuam lá quando a área de transferência volta ao que era.

## Problema e quem usa

A pessoa escreve o dia inteiro no Mac e não quer mandar a voz para um servidor. O uso é mensagem, e-mail curto, busca e comentário. A dor é trocar o teclado pela voz sem entregar o áudio, e sem perder o trecho quando o campo ativo não aceita a cola.

A primeira versão é para uma pessoa, no próprio Mac. Sem equipe e sem conta. O código é público. A pessoa instala por um download ou compilando o código. Não há instalação pela Mac App Store.

## Objetivos

- Uma tomada de 20 segundos em português do Brasil vira texto no campo ativo sem a pessoa tocar no mouse.
- Esse texto pode ser colado de novo pelo notch enquanto o recorte existir.
- Depois de uma tomada, a área de transferência tem o que a pessoa deixou nela.
- Com o modelo já no disco, a tomada funciona sem rede.

O tempo de Escrevendo ainda não foi medido. A primeira versão precisa mostrar esse estado. O número de segundos entra quando houver um build para cronometrar, do fim da fala até o texto no campo.

## O que o Fala faz

A pessoa coloca o cursor num campo. Começa a tomada pelo atalho ou pelo controle do notch. Fala. Encerra a tomada. O notch mostra Ouvindo e depois Escrevendo. O texto entra no campo, a tomada termina entregue, e o recorte sobe ao topo da bandeja.

O destino é o campo que estava ativo quando a tomada começou. Se o foco mudar antes do texto chegar, o texto não entra em lugar nenhum. A tomada termina guardada. O mesmo vale quando não há campo ativo, ou quando o texto não consegue entrar no campo. O recorte fica no topo da bandeja. O notch diz que o texto não entrou no campo e oferece a cola.

Esc cancela a tomada enquanto ela está Ouvindo ou Escrevendo. Nada é escrito e nenhum recorte nasce. A tomada termina descartada. Áudio vazio e falha do modelo também terminam descartada, e o notch diz qual dos casos aconteceu.

Existe uma tomada por vez. Enquanto uma tomada está Escrevendo, o atalho não começa outra e o notch não cola recorte.

Em campo de senha o atalho não começa a tomada. O notch diz que o Fala não dita ali. A regra vale para o campo que o macOS reconhece como senha. Um campo de senha de página web que não se declara assim fica fora dessa garantia.

O atalho padrão é a Option direita. A mesma tecla aceita toque e segura. No toque, um aperto começa e o próximo termina. Na segura, a pessoa mantém a tecla apertada enquanto fala e solta para encerrar. Soltar cedo deixa a tomada Ouvindo. A pessoa pode trocar a tecla. Os dois modos vão com ela.

O controle do notch só faz toque. Não há como segurar aquele controle.

A partir de 25 segundos em Ouvindo, o notch mostra quanto falta. Aos 30 segundos a tomada encerra sozinha, porque esse é o limite de áudio do modelo. O texto desses 30 segundos segue o mesmo caminho de uma tomada encerrada pela pessoa.

No Mac sem notch, os mesmos controles ficam na barra de menus.

O notch mostra os três recortes mais recentes. Escolher um deles cola o recorte no campo ativo, sem tirar o foco desse campo.

O ícone no Dock abre a janela da bandeja, com todos os recortes. Como essa janela toma o foco, ali a pessoa copia um recorte para a área de transferência ou apaga um recorte. Copiar é um pedido da pessoa e substitui o que estava copiado, como qualquer cópia. A mesma janela troca o atalho e mostra o que está perto de expirar.

## Experiência

Tomada.

1. O cursor está no campo.
2. A pessoa aperta a Option direita, ou o controle do notch.
3. Um som curto marca Ouvindo.
4. A pessoa fala. No toque, aperta de novo para encerrar. Na segura, solta a tecla.
5. O texto aparece no campo. O recorte aparece no notch.

Colar de novo.

1. O cursor está no campo.
2. A pessoa abre os recortes recentes no notch.
3. Escolhe um recorte e o texto entra no campo.

Achar um recorte mais antigo.

1. A pessoa clica no ícone do Fala no Dock.
2. Escolhe um recorte na janela da bandeja e copia.
3. Volta ao campo e cola com Cmd+V.

Antes da primeira tomada, o Fala explica cada permissão com as próprias palavras e leva a pessoa até ela. O microfone é um pedido do sistema. A acessibilidade e o monitoramento de entrada são interruptores nos Ajustes do Sistema, e a tela do Fala abre o painel certo. Sem microfone, sem acessibilidade ou sem monitoramento de entrada, o atalho padrão não começa a tomada. O controle do notch ainda pede microfone e acessibilidade.

Sem o modelo no disco, a primeira tela é o download. Se o download parar, a tela diz que falhou e oferece tentar de novo. Sem o arquivo completo, não há tomada.

## Requisitos

- A tomada começa e termina pela Option direita, ou pelo controle do notch. Sem notch, o controle fica na barra de menus. A tecla aceita toque e segura. O controle do notch só faz toque. A pessoa pode trocar a tecla, e os dois modos vão com ela. Esc cancela durante Ouvindo e Escrevendo. A partir de 25 segundos em Ouvindo o notch mostra o tempo restante, e aos 30 segundos a tomada termina sozinha. Os estados visíveis são Ouvindo e Escrevendo. Existe uma tomada por vez.
- Toda tomada termina entregue, guardada ou descartada. Entregue põe o texto no campo que estava ativo no começo e cria o recorte. Guardada cria o recorte sem escrever em campo nenhum, e o aviso diz que o texto não entrou no campo. Descartada não cria recorte e não escreve nada. Em campo que o macOS reconhece como senha não há tomada.
- O texto que entra no campo e no recorte é a fala inteira da tomada, sem marcas de controle do modelo e sem corte no meio.
- Depois de uma tomada, ou de uma cola pelo notch, a área de transferência tem o mesmo conteúdo de antes, seja texto, arquivo ou imagem. Se a pessoa copiar outra coisa nesse intervalo, a cópia nova permanece. Só o botão de copiar da janela da bandeja substitui o conteúdo.
- O notch mostra os três recortes mais recentes e cola qualquer um deles no campo ativo. A janela da bandeja, aberta pelo Dock, lista todos os recortes, copia e apaga. Um recorte some 24 horas depois de nascer, mesmo com o Fala fechado, ou quando a bandeja passa de 30 recortes. Sai o mais antigo. Colar de novo não muda o prazo nem a ordem. A pessoa pode apagar um antes. Um recorte que some sai também do disco.
- O áudio fica só na memória e é descartado quando a tomada termina, em qualquer dos três finais. Os recortes ficam no disco local deste usuário, fora do iCloud e do backup do Time Machine. Durante um empréstimo da área de transferência, outro aplicativo que observa a área pode ver o texto.
- O modelo é um Gemma 4 com áudio, no aparelho. O alvo mínimo é um Mac Apple Silicon com 16 GB de memória unificada. A interface está em português do Brasil.
- A única conexão de rede do Fala é o download do modelo, quando a pessoa pede. Sem telemetria, sem relatório de falha enviado e sem busca de atualização. O código é público. A instalação é por download ou pelo código. Não há pacote na Mac App Store. O atalho padrão pede microfone, acessibilidade e monitoramento de entrada.

## Fora de escopo

- iPhone, Windows e Android.
- Conta, login, sincronização e recortes compartilhados.
- Tom de voz diferente por aplicativo.
- Atalho de voz que expande um texto salvo antes.
- Editor de texto dentro do Fala, texto com negrito ou link, e dicionário de nomes.
- Modelo na nuvem, Mac Intel, e arquivo permanente do que foi falado.
- Atualização automática do aplicativo.
- Instalação pela Mac App Store.

## Perguntas abertas

- Como juntar uma fala maior que 30 segundos num único texto, e se esse texto presta para um e-mail. A documentação de áudio do Gemma 4 limita cada trecho a 30 segundos. No Fala isso não foi medido.
- Quão bem o Gemma 4 acerta português do Brasil, com termos em inglês no meio, se pontua o texto, e se tira vícios de fala sem apagar uma palavra que a pessoa quis dizer. Nada disso foi medido. A amostra de transcrição da página de áudio do Gemma sai sem pontuação. O guia oficial do modelo mostra Python, e um caminho dentro do app nativo não foi provado.
- Qual arquivo de modelo Gemma 4 cabe num Mac de 16 GB e ainda termina uma tomada curta enquanto a pessoa espera. A família está decidida. O arquivo, não.
- Se o modelo fica carregado enquanto o Fala está aberto, ou só depois da primeira tomada, e quando sai da memória. Um projeto de terceiros relata cerca de 12 segundos para carregar o E4B. Esse número não foi medido aqui.
- O macOS não oferece uma API pública para desenhar dentro do notch. Se esse desenho for frágil, a barra de menus cumpre o mesmo papel. O requisito é o controle no alto da tela, mais a janela no Dock.
- Quanto tempo um aperto precisa durar para ser segura, e não toque. O PRD descreve o gesto. O limiar em milissegundos fica para o build.

## Premissas

- Confiança alta. A primeira versão é uma pessoa, em português do Brasil, num Mac Apple Silicon.
- Confiança alta. Trecho falado temporário quer dizer recorte na bandeja. Não quer dizer atalho de voz com texto salvo antes.
- Confiança alta. A cola no campo ativo faz parte do produto, como no Wispr Flow. A bandeja se soma a isso.
- Confiança alta. Campo de senha não recebe ditado.
- Confiança alta. Na dúvida sobre o destino, guardar é melhor que escrever no campo errado.
- Confiança média. 24 horas e 30 recortes são prazo e teto adequados. Dá para mudar os números sem redesenhar a bandeja.
- Confiança média. Três recortes no notch bastam para colar de novo sem abrir a janela.
- Confiança média. O recorte fica no disco local para durar as 24 horas entre um reinício e outro.
- Confiança alta. O código é público e a instalação não passa pela Mac App Store.
- Confiança alta. A Option direita é o atalho padrão, e a mesma tecla aceita toque e segura.
- Confiança baixa. Dá para tratar a transcrição e a limpeza de vícios de fala como resolvidas. Hoje as duas são meta, não medida.
