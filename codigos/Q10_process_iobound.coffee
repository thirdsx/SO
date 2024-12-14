require '../stdlib'

processos = load_yaml 'dados/processos/processos.yaml'

for i in [0...len(processos)]
    if processos[i].io_bound
        print "Nome: #{processos[i].name}\nPID: #{processos[i].pid}\n"


        