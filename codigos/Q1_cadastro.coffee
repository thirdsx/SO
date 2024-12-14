require '../stdlib'

contas = load_yaml 'dados/credenciamento/contas.yaml'

if contas != null
    qtd_contas = len(contas)
else
    contas = [{usuario: 'null', senha: 'null'}]
    qtd_contas = 0

#criando um nome
print "Nome: "
usuario = input()

usuario_existe = false

for i in [0...qtd_contas]
    if contas[i].usuario == usuario
        usuario_existe = true
        break

if usuario_existe
    print color('r', "\nO nome de usuario inserido já existe! Tente novamente\n")
else
    #criando uma senha
    print "\nSenha: "
    senha = input_password('*')

    senha_hash = hash_md5(senha)

    #selecionando uma linguagem padrão
    langs = load 'dados/linguagem/langs.txt'
    lista_langs = langs.split('\r\n')

    print "\nSelecione sua língua padrão: "
    for i in [0...len(lista_langs)]
        print lista_langs[i]

    print("\nSua escolha: ")
    lang = input()

    contas.add(usuario: usuario, senha: senha_hash, lang: lang)
    
    if contas[0].usuario == 'null'
        contas.delete(0)
    

    save_yaml 'dados/credenciamento/contas.yaml', contas

    # EDIÇÃO: Ajustar o aviso para a linguagem de preferência do usuário
    print color("c", "\nUsuário cadastrado com sucesso! 😁\n")



