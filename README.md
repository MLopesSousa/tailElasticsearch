Script desenvolvido para recurperar os logs do elasticsearc via shell

Modo de uso:  bash /tmp/lessElastic.sh 1000 '@fields.servidor:jdg-6.6.0 @fields.instance:standalone-instance-jvh35'
O primero parâmetro é referênte ao número de linhas que deve ser recuperada, no máximo 1000
O segundo parâmetro é referente a string de busca usada no kibana. Ex.: Se a string usada no kibana for: 
    @fields.servidor:"jdg-6.6.0" AND @fields.instance:"standalone-instance-jvh35" esta deve ser alterada para
    @fields.servidor:jdg-6.6.0 @fields.instance:standalone-instance-jvh35, as aspas dúplas e o operador AND devem
    ser removidos.
    
Exemplo de uso:
    bash /tmp/lessElastic.sh 1000 '@fields.servidor:jdg-6.6.0 @fields.instance:standalone-instance-jvh35'
    
Obs: Por padrão o script aponta para homologação, caso seja necessário mudar para produção a variável ELASTICSERCH_SERVER 
deve sera alterada para http://172.30.121.216:80 dentro do tailElasticsearch.sh