# Bandeja e área de transferência

Status: accepted

A pessoa precisa colar de novo um texto que já falou, e precisa da área de transferência para o resto do Mac. A bandeja guarda os recortes. A área de transferência pertence à pessoa. O Fala só pode pegá-la emprestada para fazer o texto entrar no campo, e devolve o que estava lá. Se a pessoa copiar outra coisa nesse intervalo, o Fala deixa essa cópia quieta.

## Opções consideradas

- Usar a área de transferência como único histórico. Qualquer cópia nova apagaria o trecho, e o Fala não poderia devolver o que a pessoa tinha copiado antes.
- Deixar o texto na área de transferência quando a tomada termina guardada, como faz o Wispr Flow. A pessoa colaria com Cmd+V, mas perderia o que tinha copiado sem pedir. No Fala o recorte já está na bandeja, então a cópia anterior fica.
- Guardar os textos para sempre. O pedido é armazenamento temporário, e um arquivo permanente vira outro produto.

## Consequências

- Escrever no campo sem passar pela área de transferência é o caminho preferido. O empréstimo é o plano B. O mecanismo de cada um fica para a engenharia.
- A escrita direta só conta quando o Fala confirma, lendo o campo, que o texto entrou. Se não dá para confirmar, o Fala usa só o empréstimo, para não escrever o texto duas vezes. Texto que entrou pelo empréstimo também termina a tomada como entregue.
- O alvo da cola é sempre um campo de outro aplicativo. Uma janela do Fala nunca é alvo.
- O empréstimo só acontece quando dá para devolver o conteúdo anterior por inteiro, seja texto, arquivo ou imagem. Se não der, a tomada termina guardada.
- Outro aplicativo que observa a área de transferência pode ver o texto durante o empréstimo.
- Copiar pela janela da bandeja não é empréstimo. A pessoa pediu a cópia, então ela substitui o conteúdo como qualquer outra.
- Prazo e teto estão nos requisitos do PRD. Mudar os números não muda esta decisão.
