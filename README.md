Script desenvolvido para recurperar os logs do elasticsearc via shell

Modo de uso:  bash /tmp/lessElastic.sh 1000 '@fields.servidor:jdg-6.6.0 @fields.instance:standalone-instance-jvh35'
O primero parâmetro é referênte ao número de linhas que deve ser recuperada, no máximo 1000
O segundo parâmetro é referente a string de busca usada no kibana. Ex.: Se a string usada no kibana for: 
    @fields.servidor:"jdg-6.6.0" AND @fields.instance:"standalone-instance-jvh35" esta deve ser alterada para
    @fields.servidor:jdg-6.6.0 @fields.instance:standalone-instance-jvh35, as aspas duplas e o operador AND devem
    ser removidos.
    
Exemplo de uso:
    bash /tmp/lessElastic.sh 1000 '@fields.servidor:jdg-6.6.0 @fields.instance:standalone-instance-jvh35'
    
Para alterar-mos o IP do elastisearch, altere o valor da variável ELASTICSERCH_SERVER no tailElasticsearch.sh
