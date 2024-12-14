require '../stdlib'

contas = load_yaml 'dados/credenciamento/contas.yaml'

if contas
    qtd_contas = len(contas)
else
    qtd_contas = 0


if qtd_contas != 0
    num_sorteado = random 1, qtd_contas-1
    conta_sorteada = contas[num_sorteado]

    print "#{color('c', conta_sorteada.usuario)}, você acabou de ganhar #{color('c', "1 MILHÃO DE REAIS!!!")} Só precisa passar o #{color('g', "número do seu cartão, a senha e o cvv para resgatar")}  o prêmio 😉!"
    
else
    print "Não há contas para ganhar o prêmio, então eu vou ficar! ^^\n"
    




