# Fala

Ditado no Mac, com o modelo no aparelho. A pessoa fala e o texto entra no campo ativo. O mesmo texto fica um tempo na bandeja, no notch e no Dock.

Ainda não há alvo de aplicativo neste repositório. Ninguém provou ainda que o Gemma 4 com áudio roda dentro de um app nativo no Mac, nem que acerta português do Brasil. Esse teste vem antes do projeto de app, porque a resposta escolhe a stack. A base abaixo trava o vocabulário, o que a primeira versão faz, e as decisões que custam desfazer.

## Onde ler

- [Glossário](GLOSSARY.md) fixa as palavras. Recorte, bandeja e tomada não são a área de transferência.
- [PRD](docs/prd.md) diz o que a primeira versão faz, o que fica de fora, e o que ainda está em aberto.
- [Diretrizes](docs/diretrizes.md) desempatam quando o PRD não cobre o caso.
- [ADRs](docs/adr/) registram o Gemma no aparelho, a bandeja separada da área de transferência, o código aberto fora da loja, e a Option direita com toque e segura.
- [AGENTS.md](AGENTS.md) é a leitura de quem for implementar.
- [Decisões](docs/decisions.tsv) é o registro desta base.

## Conferir

Rode `scripts/check-foundation.sh`. Código 0 significa que os arquivos, os termos e as seções estão no lugar. O comando não prova que uma tomada funciona.
