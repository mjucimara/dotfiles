# safe

## Descrição
Executa comandos com timeout de segurança.

## Uso
safe <comando>

## Exemplos
safe make test
safe ./script-lento.sh

## Comportamento
- Timeout padrão de 10 segundos
- Aborta o processo se exceder

## Observações
Útil para evitar travamentos acidentais.
