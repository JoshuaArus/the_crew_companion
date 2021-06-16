import 'package:the_crew_companion/entities/aimOption.dart';

import 'entities/mission.dart';

class Story {
  static final List<Mission> missions = [
    Mission(
      0,
      "Mission 1",
      "Félicitation ! Vous avez été sélectionnés parmi un large panel de volontaires pour participer à la plus grande, la plus excitante et la plus dangereuse aventure qu'ait connue l'humanité : **la quête de la neuvième planète**  ! A peine êtes vous arrivés au centre d'entrainement, qu'on vous propose de tester votre esprit d'équipe.",
      1,
      0,
      false,
      []
    ),
    Mission(
      1,
      "Mission 2",
      "Il s'avère rapidement que vous êtes en parfaite adéquation les uns avec les autres. Votre compatibilité mentale, que l'on pourrait même qualifier de fusion mentale, augure du meilleur pour la réussite de la mission. Il est désormais temps de passer aux phases d'entrainements 2 et 3 _: l'apesanteur et la technologie de contrôle._",
      2,
      0,
      false,
      []
    ),
    Mission(
      2,
      "Mission 3",
      "Chaque phase d'entrainement vous demande de mobiliser les compétences acquises lors des phases précédentes_. La gestion de l'alimentation électrique et la priorisation des urgences_ nécessitent un haut degré de raisonnement logique afin d'appréhender les systèmes dans leur ensemble. C'est ici que vos facultés en mathématiques se révèleront utiles.",
      2,
      0,
      false,
      [AimOption.One, AimOption.Two]
    ),
    Mission(
      3,
      "Mission 4",
      "Votre préparation touche bientôt à sa fin. Les dernières phases d'entrainement concernent la recalibration des modules de contrôle et d'entretien des systèmes de communication ainsi que des systèmes auxiliaires des combinaison spatiales. Le décollage n'a jamais été aussi proche !",
      3,
      0,
      false,
      []
    ),
    Mission(
      4,
      "Mission 5",
      "Fausse joie ! L'un d'entre vous est cloué au lit. Chacun consulte ses cartes. Le commandant demande ensuite à chaque membre comment il se sent. Les seules réponses autorisées sont « bien » ou « mal ». Le commandant décide enfin qui est malade. Il ne peut se désigner lui-même. **Le membre de l'équipage souffrant ne doit remporter aucun pli.**",
      0,
      0,
      false,
      []
    ),
    Mission(
      5,
      "Mission 6",
      "Après ce petit contretemps arrive enfin le dernier entrainement : apprendre à travailler avec des moyens de communication restreints. Dans l'environnement spatial, il faut savoir faire face aux circonstances les plus imprévisibles ; c'est pourquoi, une **Zone de silence** sera simulée. Renforcez vos connexions mentales pour réussir ce dernier test.",
      3,
      0,
      false,
      [AimOption.First, AimOption.Second]
    ),
    Mission(
      6,
      "Mission 7",
      "Cette journée sera mémorable ! Tenez vous prêt au lacement. L'achèvement de votre entrainement n'est que le début de la véritable aventure. **10 9 8 7 6 5 4 3 2 1 DECOLLAGE !** Une force incroyable vous plaque sur vos sièges, il n'y a désormais plus aucun moyen de faire machine arrière. Dans un vacarme assourdissant, vous vous êtes arrachés du sol, du pays, du contient, de la planète.",
      3,
      0,
      false,
      [AimOption.Last]
    ),
    Mission(
      7,
      "Mission 8",
      "Vous êtes en orbite lunaire, vous ressentez l'apesanteur, cette sensation est tout bonnement indescriptible. Après tous ces tests et entrainements, la joie vous étreint. Vous observez la Terre, qui constituait l'intégralité de votre monde jusqu'alors, tandis que vous pouvez déjà la masquer de votre pouce en tendant le bras.",
      3,
      0,
      false,
      [AimOption.One, AimOption.Two, AimOption.Three]
    ),
    Mission(
      8,
      "Mission 9",
      "Vous êtes soudainement arrachés de vos pensées par l'alarme assourdissante du module d'analyse de bord NAVI qui exige votre attention. Une petite pièce de métal est venu se loger dans l'unité de commande. Il va falloir des doigts de fée pour éviter d'endommager les cartes électroniques. Au moins une carte de couleur de valeur 1 doit remporter un pli.",
      0,
      0,
      false,
      []
    ),
    Mission(
      9,
      "Mission 10",
      "Après cette petite péripétie de début de mission, vous êtes désormais prêts à laisser la Lune derrière vous. Vous faites votre rapport à la Terre, activez les systèmes de vol ainsi que tous vos instruments de mesure et allumez les moteurs. Ce sera un véritable pas de géant. Pour vous et pour l'humanité toute entière.",
      4,
      0,
      false,
      []
    ),
    Mission(
      10,
      "Mission 11",
      "Vos systèmes radars font état d'un champ d'astéroïdes particulièrement dense qui devrait gêner votre trajectoire_. Le commandant doit désigner un autre membre d'équipage afin qu'il calcule une trajectoire d'évitement_. Cette tâche nécessitant la plus haute concentration, **ce membre ne peut pas communiquer durant cette mission**.",
      4,
      0,
      false,
      [AimOption.One]
    ),
    Mission(
      11,
      "Mission 12",
      "Vous scrutez avec anxiété les astéroïdes qui vous frôlent. Ils passent incroyablement près. Accaparés par cette menace, vous vous êtes perdus dans vos relevés, ce qui entraîne quelques minutes de confusion. **Immédiatement après le premier pli, chaque membre d'équipage doit piocher aléatoirement une carte dans la main de son voisin de droite et l'ajouter à sa propre main.** Poursuivez ensuite la partie normalement.",
      4,
      0,
      false,
      [AimOption.Last]
    ),
    Mission(
      12,
      "Mission 13",
      "Il semble que malgré votre manoeuvre d'évitement, vous ayez été percutés par quelques menus débris. Le module de contrôle présente des signes de dysfonctionnements dans l'unité de commande. Effectuez un essai de propulsion avec chacun des propulseurs pour identifier l'origine du problème... Remportez un pli avec chaque carte Fusée",
      0,
      0,
      false,
      []
    ),
    Mission(
      13,
      "Mission 14",
      "Vous êtes suffisamment proche de Mars pour que l'Olympus Mons, le plus haut volcan du système solaire, soit visible à l'œil nu. Vous profitez de cette opportunité pour le prendre en photo, ainsi que les lunes de Mars, Phobos et Deimos. Malheureusement, la proximité de la planète interfère avec votre système de communication et vous vous retrouvez dans une **Zone de silence**.",
      4,
      0,
      false,
      [AimOption.First, AimOption.Second, AimOption.Third]
    ),
    Mission(
      14,
      "Mission 15",
      "Vous vous éloignez de Mars et quittez la Zone de silence. Vous vous surprenez à rêver de barres chocolatées lorsque retentit l'alarme du système anticollision. Avant même de pouvoir réagir en conséquence, vous êtes heurtés par un astéroïde. Isolez immédiatement les quatre modules endommagés et commencez les réparations.",
      4,
      0,
      false,
      [AimOption.One, AimOption.Two, AimOption.Three, AimOption.Four]
    ),
    Mission(
      15,
      "Mission 16",
      "Il s'avère que les dégâts ont été moins impressionnant que le choc et vous êtes parvenu à tout réparer promptement. Néanmoins le 9ème module de contrôle, qui surveille le système de survie de vos combinaisons, a été sévèrement endommagé lors de la collision et a cessé de fonctionner. Vous ne devez remporter aucun pli avec un 9.",
      0,
      0,
      false,
      []
    ),
    Mission(
      16,
      "Mission 17",
      "Les dégâts subis par le 9ème module de contrôle sont plus grave que prévu et nécessitent une analyse bien plus approfondie afin de pouvoir être réparé. Mais dans le même temps, vous devez garder le contrôle de votre trajectoire et envoyer un message à la Terre où votre rapport est vivement attendu. Vous ne devez remporter aucun pli avec un 9.",
      2,
      0,
      false,
      []
    ),
    Mission(
      17,
      "Mission 18",
      "Vous mettez le cap sur Jupiter tandis que vous traversez un nuage de poussière. Quasiment au même instant, votre module de communication se met à réagir étrangement. Le signal est de prime abord étonnamment bon, mais quelques secondes plus tard vous perdez subitement la connexion. Vous n'êtes autorisés à communiquer qu'à partir du 2ème pli.",
      5,
      0,
      false,
      []
    ),
    Mission(
      18,
      "Mission 19",
      "Le nuage de poussière se révèle bien plus dense que vous ne le pensiez. Plus vous y restez, et plus votre module de communication se conduit étrangement. Le signal passe successivement de la pureté du cristal à une succession de parasites indescriptibles. Vous n'êtes autorisés à communiquer qu'à partir du 3ème pli.",
      5,
      0,
      false,
      [AimOption.One]
    ),
    Mission(
      19,
      "Mission 20",
      "Enfin le nuage s'estompe et les sautes d'humeur de votre module de communication sont notablement réduites. Devant vous, Jupiter se révèle dans toute sa splendeur. La géante gazeuse porte vraiment bien son nom. Votre éblouissement est rapidement interrompu par les deux capteurs radars qui passent en mode alarme. Le commandant désigne le membre devant s'atteler aux réparations et recevant toutes les tâches. Le commandant ne peut se choisir lui-même",
      2,
      0,
      false,
      [AimOption.Hidden]
    ),
    Mission(
      20,
      "Mission 21",
      "Une fois les réparations faites, vous constatez que vous vous êtes bien trop rapprochés de Jupiter en traversant le nuage. Sa force d'attraction valant deux fois et demi celle de la Terre, a drastiquement influé sur votre trajectoire. Pour la contrer, vous allez devoir vous concentrer et travailler de façon minutieuse, afin d'atteindre le point de sortie idéal. Pris dans vos calculs, vous remarquez à peine que le système radio est défaillant dans cette **Zone de silence**.",
      5,
      0,
      false,
      [AimOption.One, AimOption.Two]
    ),
    Mission(
      21,
      "Mission 22",
      "Vous êtes tout juste tirés d'affaire que la température de l'habitacle chute soudainement. Tous les systèmes de contrôles sonnent en même temps tandis que vous revêtez en vitesse vos combinaisons. Le module de régulation parvient difficilement à maintenir les différents paramètres. Détournez rapidement l'alimentation électrique de chaque module, l'un après l'autre, pour éviter une défaillance généralisée du système.",
      5,
      0,
      false,
      [AimOption.First, AimOption.Second, AimOption.Third, AimOption.Fourth]
    ),
    Mission(
      22,
      "Mission 23",
      "La plupart des modules sont toujours sur l'alimentation de secours, et vous vous questionnez sur la cause de ce refroidissement soudain. Passant au large de Callisto, l'une des 79 lunes de Jupiter, il vous semble avoir quitté la zone glacée. **Avant d'assigner les cartes Tâches, vous pouvez inversez la position de 2 jetons Tâche. Décidez collectivement, mais ne révélez rien de vos propres cartes.**",
      5,
      0,
      false,
      [AimOption.One, AimOption.Two, AimOption.Three, AimOption.Four, AimOption.Five]
    ),
    Mission(
      23,
      "Mission 24",
      "Cet incident a totalement perturbé vos procédures de vol. Il y a tant à faire, et personne ne sait par où commencer. Le commandant doit prendre l'initiative et dresser un plan précis afin de remettre la mission sur les rails. Pour procéder le plus efficacement possible, le commandant distribue les Tâches individuellement.",
      6,
      0,
      false,
      []
    ),
    Mission(
      24,
      "Mission 25",
      "Vous atteignez Saturne et prenez le temps d'admirer l'éblouissant spectacle des anneaux de roche et de poussières qui gravitent autour d'elle. Ce n'est pas sans raison qu'on la surnomme le « Seigner des Anneaux ». Sans grand entrain, vous vous plongez ensuite dans l'analyse des systèmes de bord avant de piquer du nez. A cause de la **Zone de silence** , vous ne serez pas réveillés. **Si vous jouez à 5 joueurs, vous pouvez désormais utiliser la règle supplémentaire pour 5 membres de l'équipage.**",
      6,
      0,
      false,
      [AimOption.First, AimOption.Second]
    ),
    Mission(
      25,
      "Mission 26",
      "Une puissante détonation vous tire de votre léthargie. Deux blocs de roche gravitant autour de Saturne ont laissé des trous béants dans la coque de votre astronef. Les systèmes de bord ont immédiatement isolé la zone de stockage endommagée. Les deux rochers sont toujours enfichés dans la coque, et vous allez devoir les retirez délicatement afin de ne pas aggraver la situation. : Au moins 2 plis doivent être remportés par une carte de couleur de valeur 1.",
      0,
      0,
      false,
      []
    ),
    Mission(
      26,
      "Mission 27",
      "Vous constatez que la brèche dans la coque est des plus sérieuses. Une vérification des modules connectés à la zone de stockage indique de graves dysfonctionnements dans le condensateur de flux. Bien qu'il n'y ait aucun problème urgent, une réparation s'impose sur le long terme si vous voulez pouvoir un jour rentrer chez vous. **Le commandant choisit qui doit s'occuper de la réparation.**",
      3,
      0,
      false,
      [AimOption.Hidden]
    ),
    Mission(
      27,
      "Mission 28",
      "Vous mesurez un taux de radiations cosmiques anormalement élevé. Malgré cela, vous poursuivez nonchalamment votre vol sans savoir que vos messages radio en direction de la Terre n'aboutissent pas ou sont reçus avec beaucoup de retard. Cela ne va pas vous faciliter le travail. **Avec toutes ces Perturbations, vous ne pouvez pas communiquer avant le 3ème pli.**",
      6,
      0,
      false,
      [AimOption.One, AimOption.Last]
    ),
    Mission(
      28,
      "Mission 29",
      "Votre module de communication semble avoir souffert davantage que vous ne le pensiez. La réparation nécessite une série de tests et de calibrages que vous devez effectuer de façon précise et synchrone. Les communications sont limitées par une Zone de silence. A aucun moment, un membre d'équipage ne doit avoi remporté 2 plis de plus qu'un autre membre.",
      0,
      0,
      false,
      []
    ),
    Mission(
      29,
      "Mission 30",
      "Les premières réparations sont effectuées, mais vous devez remettre le reste à plus tard, car vous vous dirigez droit sur Uranus. Sa surface lisse et bleu pâle lui donne une allure presque artificielle. Vous devez vous arracher à cette vision fascinante, car toutes les réparations ne sont pas encore terminées. **Vous n'êtes autorisé à communiquer qu'à partir du 2ème pli à cause de ces perturbations.**",
      6,
      0,
      false,
      [AimOption.First, AimOption.Second, AimOption.Third]
    ),
    Mission(
      30,
      "Mission 31",
      "Tandis que vous vous éloignez lentement d'Uranus, vous recevez un message en provenance de la Terre vous demandant de collecter des données sur les lunes d'Uranus. A cause des perturbations, il est arrivé quasiment trop tard, et seul 3 des 27 lunes sont encore visibles : Rosalinde, Belinda et Puck. Il va falloir s'en contenter.",
      6,
      0,
      false,
      [AimOption.One, AimOption.Two, AimOption.Three]
    ),
    Mission(
      31,
      "Mission 32",
      "Malgré les conditions de vol favorables, depuis le temps que vous vivez ensemble de façon confinée, certaines émotions humaines commencent à faire surface. Afin d'éviter d'envenimer la situation, chaque membre évite tout contact et se concentre sur son travail. Le commandant prend l'organisation en main et attribue les tâches à chacun.",
      7,
      0,
      false,
      []
    ),
    Mission(
      32,
      "Mission 33",
      "Une sortie spatiale s'impose ! Une des écoutilles est endommagée et doit être réparé. Mais quitter l'astronef présente toujours des risques. **Une fois que chaque membre d'équipage a pris connaissance de ses cartes en main, le commandant demande à chacun s'il souhaite se porter volontaire. Les seules réponses autorisées sont OUI et NON. Le commandant désigne ensuite l'un des membres de l'équipage (autre que lui-même). Celui-ci doit remporter au final 1 pli, mais sans utiliser de cartes Fusées.**",
      0,
      0,
      false,
      []
    ),
    Mission(
      33,
      "Mission 34",
      "Neptune est déjà en vue lorsque votre astronef commence à montrer des signes de faiblesses. Vous êtes contraints de passer les stabilisateurs en mode manuel afin de ne pas perdre le contrôle. Pendant ce temps, le commandant doit réaligner le module gravitationnel. **A aucun moment, un membre de l'équipage ne peut avoir remporté 2 plis de plus qu'un autre membre. De plus, le commandant doit remporter le 1er et le dernier pli.**",
      0,
      0,
      false,
      []
    ),
    Mission(
      34,
      "Mission 35",
      "Vous atteignez la planète la plus éloignée du système solaire : Neptune, la géante glacée. La profondeur de son bleu vous donne des frissons. Tandis que vous la dépassez lentement, vous recevez un nouveau message de la Terre. Les capteurs de la sonde spatiales Alpha 5, actuellement en orbite autour de Neptune, sont endommagés. Trouvez-la et réparez-la.",
      7,
      0,
      false,
      [AimOption.First, AimOption.Second, AimOption.Third]
    ),
    Mission(
      35,
      "Mission 36",
      "Vous profitez d'un des rare moment de répit pour discuter avec le reste de l'équipage. Après toutes ces quelques petite et (majoritairement) grandes défaillances à traiter, avec cette pression sur vos épaules et l'incertitude planant sur l'issue de cette aventure, la tension qui irradie de chacun de vous devient palpable. Il est parfois bon de simplement se détendre, de prendre le temps de se parler et de s'écouter. **Le commandant distribue les tâches individuellement.**",
      7,
      0,
      false,
      [AimOption.One, AimOption.Two]
    ),
    Mission(
      36,
      "Mission 37",
      "Vous atteignez Pluton, la planète naine. Quelques années en arrière, c'était elle la 9ème planète. Vous prenez un instant pour vous remémorer ce que racontait votre très sage mère lorsqu'elle vous parlait des différentes planètes et que vous méditiez sur la versatilité du temps qui passe…Enfin bref, l'astronef doit continuer sa route ! **Le commandant décide qui est responsable du maintien de la trajectoire.**",
      4,
      0,
      false,
      [AimOption.Hidden]
    ),
    Mission(
      37,
      "Mission 38",
      "Vous atteignez l'héliopause, l'extrémité de notre système solaire. Si vos calculs se vérifient, la 9ème planète ne devrait plis être bien loin. L'excitation vous gagne à mesure que l'heure de vérité approche. Vus bondissez de vos sièges lorsque les instruments s'agitent soudain. Juste une fausse alerte, malheureusement. **Vous n'êtes autorisés à communiquer qu'à partir du 3ème pli à cause de perturbations.**",
      8,
      0,
      false,
      []
    ),
    Mission(
      38,
      "Mission 39",
      "Ce ne peut être que ça ! Les données affichées sur votre instrument ne peuvent être produite que par un objet absolument gigantesque. **Ces effets sont si importants que vos communications radio sont affectés et vous vous retrouvez dans une Zone de silence.** Recalibrez vos instruments et découvrez ce qu'il en est.",
      8,
      0,
      false,
      [AimOption.First, AimOption.Second, AimOption.Third]
    ),
    Mission(
      39,
      "Mission 40",
      "Vous prêtez une grande attention à l'objet, mais vous n'avez encore aucune certitude quant à sa nature. Ce qui se présente devant vous pourrait très bien être qu'une lune de Pluton. Non, attendez, ce n'est pas une lune ! Vous l'avez trouvé ! La 9ème planète ! L'euphorie s'empare de vous et vous fait oublier toutes les épreuves que vous avez endurés jusque-là. Le balayage radar de sa surface laisse supposer une croute solide, ce qui impliquerait qu'il ne s'agit pas d'une nouvelle géante gazeuse, et que sa surface peut être praticable. Une opportunité fantastique s'offre à vous. **Avant d'assigner les cartes Tâches, vous pouvez déplacer un jeton Tâche d'une carte Tâche vers une autre qui n'en possède pas. Choisissez ensemble, mais ne révélez rien de vos propres cartes.**",
      8,
      0,
      false,
      [AimOption.One, AimOption.Two, AimOption.Three]
    ),
    Mission(
      40,
      "Mission 41",
      "Vous ajustez la puissance des moteurs et vous vous préparez à vous poser. Du fait des conditions tout à fait nouvelles, l'un d'entre vous doit s'atteler uniquement à la séquence d'approche. **Une fois que chaque membre d'équipage a pris connaissance de ses cartes en main, le commandant demande à chacun si il se sent prêt. Les seules réponses autorisées sont 'Oui' et 'Non'. Le commandant désigne ensuite l'un des membres (autre que lui même), qui ne doit remporter que le premier et le dernier plis. Puisque seuls les propulseurs peuvent être utilisés pour la correction de trajectoire, aucun de ces 2 plis ne peut être remporté avec une carte fusée.**",
      0,
      0,
      false,
      []
    ),
    Mission(
      41,
      "Mission 42",
      "La planète est extrêmement froide et inhospitalière, mais semble toutefois habitable. Lors de votre exploration, vous remarquez une zone qui perturbe vos instruments. A mesure que vous vous en approchez, les erreurs de mesure se font plus flagrantes. Ce que cela peut signifier dépasse toute explication scientifique. Vous parvenez néanmoins à cerner l'étendue du phénomène, car vos mesures se normalisent lorsque vous vous en éloignez.",
      9,
      0,
      false,
      []
    ),
    Mission(
      42,
      "Mission 43",
      "Au nom de la science, vous vous en approchez d'avantage. Les loies de la gravité semblent s'inverser à mesure que vous vous en approchez, et vous devez vous ancrer à sa surface au moyen de vos crochets en vibranium pour votre propre sécurité. **Le commandant s'assure de la sécurité du reste de l'équipage et attribue les tâches individuellement.** Les résultats de vos analyses n'appellent qu'une seule conclusion : Vous venez de découvrir un trou de ver.",
      9,
      0,
      false,
      []
    ),
    Mission(
      43,
      "Mission 44",
      "Jusqu'à présent, les trous de ver n'étaient au mieux que des constructions théoriques, et vous vous tenez maintenant devant l'un d'eux. Un monolithe noir vous surplombe, mysterieux, mais il exerce sur vous un énorme pouvoir d'attraction. Vous envoyez un message vers la Terre et préparez les moteurs pour le grand saut. **Chaque carte fusée doit remporter un pli, en commençant par la carte fusée 1, puis la 2, la 3 et enfin la 4.**",
      0,
      0,
      false,
      []
    ),
    Mission(
      44,
      "Mission 45",
      "L'effet est incommensurable ! Vous êtes sanglés sur vos sièges, et pourtant, vous avez l'impression d'être partout à la fois. Les couleurs et les formes fusionnent, la lumière prend corps en une masse tourbillonnante douée d'intelligence et vous étreint. Vous vous concentrez sur les écrans du tableau de bord et tentez de ne pas perdre vos esprits.",
      9,
      0,
      false,
      [AimOption.First, AimOption.Second, AimOption.Third]
    ),
    Mission(
      45,
      "Mission 46",
      "Tandis qu'un nombre incroyable d'informations vous assaille, vous réagissez instinctivement au danger. Le module principal de l'astronef cesse soudain de fonctionner pendant le saut, des alarmes vous tirent brutalement de votre état proche de la transe. **Votre objectif est de vous assurer que le membre d'équipage assis à gauche de celui possédant le 9 ROSE remporte TOUTES les cartes ROSES. Celui qui possède le 9 ROSE l'annonce à voix haute**",
      0,
      0,
      false,
      []
    ),
    Mission(
      46,
      "Mission 47",
      "Vous êtes épuisés, vous avez atteint les limites de votre conscience. Durant le saut, vous vous sentez comme dans une cellule dans laquelle vous ne pouvez plus distinguer le rêve de la réalité. Votre corps hurle qu'il ne tiendra pas 10 secondes de plus, tandis que votre esprit se demande combien de temps peuvent bien durer 10 secondes. Vous commencez à les décompter - et vous ressortez soudainement du trou de ver.",
      10,
      0,
      false,
      []
    ),
    Mission(
      47,
      "Mission 48",
      "Vous avez à peine le temps de reprendre vos esprits, que l'atmosphère devient surchauffée. Le module d'analyse interne passe instantanément tous les systèmes de l'astronef au niveau de danger maximal. Un premier module vient de flancher à cause des variations radicales de température. Même dans vos combinaisons régulées, vous êtes en sueur en à peine quelques secondes. Vous devez activer le protocole d'urgence, déployer les boucliers thermiques et vous éloigner de cette source de chaleur au plus vite. **La tâche Ω doit être remportée lors du dernier pli.**",
      3,
      0,
      false,
      [AimOption.Last]
    ),
    Mission(
      48,
      "Mission 49",
      "Lorsque vous reprenez enfin connaissance, la situation semble s'être stabilisée. Vous êtes tout juste parvenus à assurer le minimum vital avant de succomber de fatigue. Vous déterminez votre position actuelle et pouvez à peine y croire : vous êtes en orbite autour de Vénus ! Le trou de ver est un lien direct entre la neuvième planète et Vénus, la deuxième planète. Cela explique la chaleur extrême, car Vénus est significativement plus proche du Soleil que la Terre. Il vous faut un moment pour réaliser ce que cela signifie : vous allez pouvoir rentrer chez vous ! Vérifiez les dix modules principaux en mettant l'accent sur le système de survie, les moteurs et les communications. Cap sur la Terre ! ",
      10,
      0,
      false,
      [AimOption.First, AimOption.Second, AimOption.Third]
    ),
    Mission(
      49,
      "Mission 50",
      "Le trajet retour s'avère plus compliqué qu'il n'y paraissait. Certains modules ont été endommagés de façon irréversible lors du voyage, et vous allez devoir combattre l'immense force d'attraction du Soleil. Avec vos réserves au plus bas, vous n'avez pas droit à l'erreur. Le trajet retour doit être calculé avec une précision d'orfèvre. Vous devez tout d'abord parvenir à profiter de l'effet de fronde gravitationnelle. Puis, les modules de l'astronef doivent être maintenus en bon état de fonctionnement pour entreprendre la manoeuvre d'approche de la Terre. Enfin, atterrir nécessitera tout autant d'attention que les manoeuvres que vous avez pu effectuer jusqu'ici. **Chacun consulte ses cartes. Un membre d'équipage ne doit remporter que les 4 premiers plis. Un autre membre ne doit remporter que le dernier pli. Le reste de l'équipage doit remporter tous les plis intermédiaires. Le commandant demande à chacun quelle tâche il préfère accomplir et vous décidez ensemble qui doit assurer chaque rôle. Ne révélez rien de vos cartes.**",
      0,
      0,
      false,
      [])
  ];
}