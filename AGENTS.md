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

## Pronto quando

`scripts/check-foundation.sh` termina com código 0 e a última linha diz o que foi conferido. O requisito ou o termo novo está no arquivo que a ordem de leitura indica. Uma tomada funcionando é outra prova, e ela espera um build.
