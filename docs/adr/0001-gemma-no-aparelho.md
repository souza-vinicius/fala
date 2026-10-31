# Gemma no aparelho

Status: accepted

O Fala transforma fala em texto com um modelo Gemma 4 que aceita áudio, rodando no Mac. A [documentação de áudio do Gemma](https://ai.google.dev/gemma/docs/capabilities/audio) descreve reconhecimento de fala nos modelos E2B, E4B e 12B, e limita cada áudio a 30 segundos. Não há outro caminho de fala nesta versão.

## Opções consideradas

- Serviço de ditado na nuvem. Fica de fora porque o Fala existe para o áudio não sair da máquina.
- Um modelo só de fala, mais um Gemma para reescrever o texto. Fica de fora nesta versão porque o pedido é usar Gemma para a fala virar texto, e porque dois modelos disputam a mesma memória. A opção volta se uma tomada curta não ficar pronta a tempo, ou se a limpeza em português falhar de um jeito que um segundo passo resolveria.

## Consequências

- A primeira versão é Apple Silicon. Mac Intel fica de fora.
- Aos 30 segundos a tomada precisa acabar. Juntar vários trechos num texto só ainda não tem medida.
- Sem o modelo no disco, não há tomada. A pessoa baixa o arquivo uma vez. O Gemma 4 sai sob a [licença Apache 2.0](https://opensource.googleblog.com/2026/03/gemma-4-expanding-the-gemmaverse-with-apache-20.html). Uma [leitura independente da licença](https://vorplabs.com/models/gemma-license) diz que o repositório oficial não exige aceite de termos, então o download não deve pedir conta. O build confirma.
- O arquivo exato segue em aberto. Fichas públicas de E2B, E4B e 12B não substituem uma medida de memória e de tempo num Mac de 16 GB.
- O guia oficial mostra o modelo em Python. Um caminho dentro de um app nativo no Mac não foi provado nesta base. A taxa de acerto em português do Brasil também não foi medida.
