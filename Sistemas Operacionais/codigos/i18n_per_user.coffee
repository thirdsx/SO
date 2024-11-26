require '../stdlib'

resource = {
    'pt-br': {
        welcome: "Olá, tudo bem?",
        goodbye: "Até a próxima!",
    }
    'en': {
        welcome: "Hi, how are you?",
        goodbye: "See you later!",
    }
    'ja': {
        welcome: "こんにちは、お元気ですか？",
        goodbye: "さようなら、次回まで",
    }
    'fr': {
        welcome: "Hé, comment ça va?",
        goodbye: "Au revoir, à plus tard",
    },
    'es': {
        welcome: "Oye ¿cómo te va?",
        goodbye: "Adiós, hasta la próxima",
    }
}

# obtendo a linguagem preferencial do usuário
logged_user = load_yaml 'dados/logged_user.yaml'
lang = logged_user.lang


if resource[lang] == undefined
    print color('r',"Sorry, we don't support this language! So we are using English in the following texts\n")

    #assumindo uma linguagem padrão
    text_lang = 'en'

    #ou

    #pedindo pra escolher um dos idiomas suportados

    '''print "Choose one of the following languages:\n"
    
    for i in range(len(resource))
        print '''

print color('b', resource[lang].welcome)
