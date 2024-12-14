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
    }
    'es': {
        welcome: "Oye ¿cómo te va?",
        goodbye: "Adiós, hasta la próxima",
    }
}

# obtendo a linguagem preferencial do usuário
lang = load_yaml 'dados/linguagem/lang.config'
text_lang = lang.lang


if resource[text_lang] == undefined
    print color('r',"Sorry, we don't support this language! So we are using English in the following texts\n")

    #assumindo uma linguagem padrão
    text_lang = 'en'

print color('b', resource[text_lang].welcome)
