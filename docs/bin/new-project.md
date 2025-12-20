# new-project

## Descrição
Cria um novo projeto a partir de templates pré-definidos.

## Uso
new-project {api|automation|dashboard} [nome]

## Exemplos
new-project api cliente_x
new-project automation

## Comportamento
- Copia o template correspondente
- Remove histórico Git do template
- Gera nome automático se não informado

## Observações
- Templates vivem em ~/Projects/templates
- Projetos são criados em ~/Projects
