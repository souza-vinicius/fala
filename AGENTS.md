# Fala

Leia isto antes de mudar comportamento, cópia de interface ou documento de produto.

## Ordem de leitura

1. `GLOSSARY.md`, quando o texto for nomear algo que a pessoa vê ou guarda.
2. `docs/prd.md`, quando for decidir se a primeira versão inclui um comportamento.
3. `docs/diretrizes.md`, quando o PRD não desempatar.
4. `docs/adr/`, quando a mudança mexer em onde a fala vira texto, em como a bandeja se relaciona com a área de transferência, na distribuição, ou no atalho da tomada.

## Forma dos dados

Os nomes em código seguem o glossário.

- `Take` é uma tomada. Os estados são `listening`, `writing`, `delivered`, `held` e `discarded`.
- `Clip` é um recorte. Nasce de uma tomada `delivered` ou `held` e guarda o texto.
- `Tray` é a bandeja. Uma lista de recortes, do mais novo ao mais antigo.
- O pasteboard do sistema é o plano B da cola. A escrita direta no campo vem primeiro. O pasteboard não guarda recorte.
- Campo de senha não gera `Take`.
- A tomada começa por toque ou por segura. O padrão é a tecla Option direita.

Um `Take` passa de `listening` para `writing`. Termina em `delivered` quando o texto entra no campo que estava ativo no começo. Termina em `held` quando o recorte fica só na bandeja. Termina em `discarded` quando não há texto: cancelamento durante `listening` ou `writing`, áudio vazio ou falha do modelo. Existe um `Take` por vez. O áudio de um `Take` nunca vai para o disco.

O prazo e o teto da bandeja têm uma fonte só, os requisitos do PRD.

## O que fazer

Use as palavras do glossário na interface e nos documentos. Mantenha áudio e texto no Mac. A única rede é o download do modelo que a pessoa inicia. Escreva no campo primeiro. Use o pasteboard só quando essa escrita falhar. A bandeja é o lugar do recorte.

Ao mudar uma regra que a pessoa percebe, atualize o requisito no PRD na mesma mudança. Ao criar uma palavra nova do produto, acrescente o termo no glossário na mesma mudança.

## Memória entre sessões

O Mem0 guarda o que uma sessão nova não descobre lendo o repositório. O escopo é sempre `user_id: "fala"`. Quando o Mem0 e o repositório discordam, vale o repositório. Corrija a memória com `update_memory`.

Ao começar uma tarefa, rode `search_memories` com `user_id: "fala"` e os termos da tarefa. Use o que voltar antes de decidir.

Ao terminar uma tarefa, grave com `add_memory` cada item novo de um destes tipos.

- `[decisao]` é uma escolha do dono, ou uma alternativa rejeitada, com o motivo.
- `[armadilha]` é algo que já quebrou ou vai quebrar quem fizer o caminho óbvio.
- `[ambiente]` é um fato de máquina, ferramenta ou conta que nenhum arquivo do repositório mostra.

Cada memória é uma frase em português que começa pelo tipo e termina com `Fonte:`, apontando para o arquivo, o commit, o PR ou a página. Use `infer: false` e `metadata` com `categoria`, `fontes` e `verificado_em`. Antes de gravar, busque um item parecido. Se ele existir, atualize esse item.

O Mem0 fica fora da máquina. Ele nunca recebe texto ditado, recorte, áudio, segredo ou dado de quem usa o Fala. Prazo, teto e outros números do PRD também ficam fora, porque o PRD é a fonte deles. A memória aponta para o arquivo.

Se o Mem0 não responder, siga a tarefa e diga no relatório final o que não foi gravado.

## Autor dos commits

Os commits deste repositório usam o autor Vinicius Pereira de Souza e o e-mail vinnyx14@gmail.com. Passe esses valores no próprio comando de commit. Não altere o git config.

## Pronto quando

`scripts/check-foundation.sh` termina com código 0 e a última linha diz o que foi conferido. O requisito ou o termo novo está no arquivo que a ordem de leitura indica. A decisão, a armadilha ou o fato de ambiente novo está no Mem0. Uma tomada funcionando é outra prova, e ela espera um build.
