require '../stdlib'

hd = load_yaml "dados/armazenamento/hd.yaml"
usuarios = load_yaml "dados/credenciamento/contas.yaml"

if !hd
    print color("r", "\nO HD não possui nenhum arquivo!\n")
else

    if !usuarios
        print color('r', "\nNenhum usuário cadastrado!\n")
    else
        qtd_usuarios = len(usuarios)
        qtd_arquivos = len(hd)

        for i in [0...qtd_usuarios]
            usuario = usuarios[i]
            nome_maior = "Nenhum"
            tam_maior = 0

            for j in [0...qtd_arquivos]
                arquivo = hd[j]

                if arquivo.usuario == usuario.usuario
                    if arquivo.tamanho > tam_maior
                        tam_maior = arquivo.tamanho
                        nome_maior = arquivo.arquivo

            print color('b', "Usuario: " + usuario.usuario)
            print color('b', "Maior arquivo: " + nome_maior)
            print color('b', "Tamanho arquivo: " + tam_maior + "\n")



            