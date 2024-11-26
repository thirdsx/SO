require '../stdlib'

contas = load_yaml 'dados/contas.yaml'

tentativas = load_yaml 'dados/tentativas_login.yaml'
qtd_tentativas = tentativas.contador

emojis_por_tentativa = ['😔', '🤔', '😠', '🤬', '👮🏽‍♂️']
emoji = emojis_por_tentativa[qtd_tentativas]

if contas == null
    print color('b', "Não há contas registradas, gostaria de se cadastrar?\n")
else
    qtd_contas = len contas

    print "Usuário: "
    usuario = input()

    print "\nSenha: "
    senha = input_password('*')

    usuario_existe = false

    i=0
    for i in [0...qtd_contas]
        if contas[i].usuario == usuario

            usuario_existe = true
            break
    
    if !usuario_existe
        print "\n"
        print(emoji)
        print color('r', "Credenciais inválidas! Tente novamente!\n")

        #aumentando a quantidade de tentativas falhas!
        qtd_tentativas++
        tentativas.contador = qtd_tentativas
        save_yaml 'dados/tentativas_login.yaml', tentativas
    else
        senha_hash = hash_md5(senha)

        if contas[i].senha == senha_hash
            resource = {
                'pt-br': {
                    greeting: "Seja bem-vindo! 😌",
                }
                'en': {
                    greeting: "Welcome! 😌",
                }
                'ja': {
                    greeting: "いらっしゃいませ 😌",
                }
                'fr': {
                    greeting: "Bienvenu 😌",
                }
                'es': {
                    greeting: "Bienvenido(a) 😌",
                }
            }

            lang = contas[i].lang
            
            #resetando contador de erros ao logar
            tentativas.contador = 0
            save_yaml 'dados/tentativas_login.yaml', tentativas

            print color("c", contas[i].usuario)
            print color("c", resource[lang].greeting)

        else 
            print "\n"
            print(emoji)
            print color('r', "Credenciais inválidas! Tente novamente!\n")

            qtd_tentativas++
            tentativas.contador = qtd_tentativas
            save_yaml 'dados/tentativas_login.yaml', tentativas

        