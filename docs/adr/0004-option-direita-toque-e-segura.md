# Option direita, toque e segura

Status: accepted

A tomada começa e termina na Option direita. A mesma tecla aceita toque e segura. Toque é um aperto para começar e outro para terminar. Segura é manter a tecla apertada enquanto fala e soltar para encerrar. A pessoa pode trocar a tecla. Os dois modos vão com ela.

## Opções consideradas

- Só toque, com fn + Espaço. É o padrão do Wispr Flow no Mac. Quem tem os dois instalados teria conflito, e a Option direita não briga com esse acorde.
- Só segura. Uma tomada em que a pessoa precisa das duas mãos, ou fala e mexe no teclado ao mesmo tempo, ficaria pior.
- Um ajuste que escolhe um modo só. A mesma tecla já distingue os dois gestos. Um seletor a mais não ajuda a começar a ditar.

## Consequências

- Distinguir a Option direita da esquerda pede monitoramento de entrada. Sem essa permissão, o atalho padrão não funciona. Isso é inferência sobre a API do macOS, ainda sem teste neste repositório.
- A Option esquerda continua sendo Option do sistema. Acentos e menus que usam essa tecla não mudam.
- O controle do notch só faz toque. Não há como segurar aquele controle.
