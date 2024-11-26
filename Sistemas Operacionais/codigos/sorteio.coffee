require '../stdlib'

contas = load_yaml 'dados/contas.yaml'

if contas != null
    qtd_contas = len(contas)
else
    qtd_contas = 0


if qtd_contas != 0
    num_sorteado = random 1, qtd_contas-1
    conta_sorteada = contas[num_sorteado]

    print conta_sorteada.usuario
    print "Você acabou de ganhar 1 MILHÃO DE REAIS!!! Só precisa passar o número do seu cartão, a senha e o cvv 😉!"
    
else
    print "Não há contas para ganhar o prêmio, então eu vou ficar! ^^\n"
    




