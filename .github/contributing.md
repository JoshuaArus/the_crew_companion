Afin de garder une base de code saine et commune, il est recommandé de travailler sous VS Code avec les plugins suivants : 

# Extensions obligatoires

[Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

[Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code)

[Dart Data Class Generator](https://marketplace.visualstudio.com/items?itemName=BendixMa.dart-data-class-generator) pour la génération des classes à partir de leurs attributs

Une fois les extensions installées, il y'a quelques configurations à faire.

## settings.json

```
"[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": false,
    "editor.selectionHighlight": true,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": false
  },
```

Vous pouvez supprimer la ligne `"editor.rulers": [80],` qui n'est pas très utile si elle a été générée par défaut.

# Extensions optionnelles

Pour votre confort, nous vous conseillons les extenions suivantes : 

[Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)

[Bracket Pair Colorizer](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer)

[GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)

[Prettify JSON](https://marketplace.visualstudio.com/items?itemName=mohsen1.prettify-json)

[VSCode Great Icons](https://marketplace.visualstudio.com/items?itemName=emmanuelbeziat.vscode-great-icons)