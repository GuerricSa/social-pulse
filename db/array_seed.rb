USER_PRESENTATIONS = [
  "Amoureuse de la nature, cherche des compagnons de randonnée pour explorer les sentiers pittoresques de sa région.",
  "Passionné de cuisine, propose des ateliers de cuisine à domicile pour partager ses talents culinaires avec d'autres gourmets.",
  "Fan de musique, recherche des partenaires de jam pour des sessions musicales improvisées dans son quartier.",
  "Photographe amateur, organise des sorties photo pour capturer les plus beaux moments de la vie locale.",
  "Sportive passionnée, cherche des coéquipiers pour des matchs de football amical le week-end."
].freeze

CITIES = %w[Paris Lyon Lille Rennes Strasbourg].freeze

ADDRESSES = {
  "Paris" => [
    "17 Rue de la Petite Truanderie",
    "42 Rue de la Grange aux Belles",
    "71 Rue de la Roquette",
    "29 Rue de la Pompe",
    "88 Rue de la Chapelle",
    "53 Rue de la Convention",
    "11 Rue de la Butte-aux-Cailles",
    "64 Rue de la Verrerie",
    "37 Rue de Belleville",
    "22 Rue de la Montagne Sainte-Geneviève"
  ],
  "Lyon" => [
    "23 Rue de la République",
    "15 Quai Tilsitt",
    "8 Rue de la Charité",
    "41 Rue de la Bourse",
    "6 Place Bellecour",
    "32 Rue du Président Édouard Herriot",
    "5 Quai Jean Moulin",
    "14 Rue de la Poulaillerie",
    "27 Rue de la République",
    "20 Rue des Marronniers"
  ],
  "Lille" => [
    "17 Rue de la Clef",
    "29 Rue de la Monnaie",
    "8 Place du Général de Gaulle",
    "56 Rue de la Barre",
    "33 Rue de la Vieille Comédie",
    "11 Rue des Manneliers",
    "42 Rue de la Clef",
    "25 Rue de la Monnaie",
    "6 Place de la République",
    "19 Rue de la Vieille Comédie"
  ],
  "Rennes" => [
    "15 Rue Saint-Georges",
    "27 Rue de la Monnaie",
    "8 Place de la Mairie",
    "46 Rue de la Visitation",
    "21 Rue du Champ Jacquet",
    "12 Rue de la Soif",
    "35 Rue Saint-Melaine",
    "18 Rue Saint-Georges",
    "6 Place de la Mairie",
    "39 Rue de la Visitation"
  ],
  "Strasbourg" => [
    "15 Rue de la Mésange",
    "27 Rue des Juifs",
    "8 Place de la Cathédrale",
    "46 Rue du Vieux Marché aux Vins",
    "21 Quai des Bateliers",
    "12 Rue du Dôme",
    "35 Rue des Hallebardes",
    "18 Rue de la Mésange",
    "6 Place du Château",
    "39 Rue du Vieux Marché aux Vins"
  ]
}

# Description par activity_type

DESCRIPTION = {
  # ok
"Danse" => {
  "Cours de Danse Latine" => "Mettez-vous en mouvement avec nos cours de danse latine. De la salsa sensuelle à la bachata romantique, vous explorerez des rythmes envoûtants et partagerez des moments de connexion sur la piste de danse.",
  "Soirée Swing et Lindy Hop" => "Plongez dans l'âge d'or du jazz avec notre soirée swing et lindy hop. Les rythmes rétro, les pas joyeux et l'ambiance vintage vous emmèneront dans une époque révolue.",
  "Danse Contemporaine en Plein Air" => "Connectez-vous avec votre corps et la nature lors de notre séance de danse contemporaine en plein air. Les mouvements fluides et l'air frais créent une expérience unique.",
  "Cours de Danse Hip-Hop" => "Laissez votre créativité s'exprimer dans nos cours de danse hip-hop. Vous apprendrez des chorégraphies énergiques et explorerez la culture urbaine de la danse.",
  "Soirée Tango Passion" => "Entre passion et élégance, plongez dans l'univers du tango lors de notre soirée dédiée. Dansez avec intensité et ressentez la connexion profonde avec votre partenaire."
},
# ok
"Photographie" => {
  "Balade Photographique Urbaine" => "Explorez la ville sous un nouvel angle lors de notre balade photographique. Chaque coin de rue devient une opportunité de capturer des images exceptionnelles.",
  "Cours de Photographie Nature" => "Apprenez à immortaliser la beauté de la nature lors de nos cours de photographie en plein air. Des paysages époustouflants aux détails subtils, chaque moment devient une œuvre d'art.",
  "Photographie de Rue" => "Plongez dans l'effervescence de la vie urbaine avec notre séance de photographie de rue. Saisissez l'essence de la ville et racontez des histoires à travers vos clichés.",
  "Atelier de Retouche Photo" => "Transformez vos photos en chefs-d'œuvre lors de notre atelier de retouche photo. Apprenez les techniques d'amélioration d'image pour donner vie à votre vision.",
  "Séance de Photographie Nocturne" => "La nuit révèle des mystères et des scènes captivantes. Participez à notre séance de photographie nocturne pour maîtriser l'art de la photographie en basse lumière."
},
# ok
"Bricolage" => {
  "Atelier de Création de Bijoux" => "Faites preuve de créativité en créant vos propres bijoux. Notre atelier vous guide dans la conception de pièces uniques que vous serez fier de porter.",
  "Cours de Menuiserie" => "Découvrez les secrets de la menuiserie lors de nos cours. Des étagères aux meubles, vous apprendrez les compétences essentielles pour réaliser vos projets de bricolage.",
  "Fabrication de Décorations Maison" => "Transformez votre maison en un lieu unique en participant à notre atelier de fabrication de décorations. Des objets artisanaux personnalisés ajouteront une touche spéciale à votre espace.",
  "Atelier de Couture" => "Apprenez l'art de la couture et de la confection de vêtements lors de notre atelier dédié. Des vêtements sur mesure aux retouches, la couture devient une seconde nature.",
  "Création de Cartes et d'Artisanat Papier" => "Exprimez votre créativité avec du papier lors de notre atelier d'art. Des cartes de vœux aux projets de scrapbooking, vous découvrirez les possibilités infinies du papier."
},
# ok
"Ecriture" => {
  "Écriture de Poèmes en Groupe" => "Laissez vos émotions s'exprimer à travers les mots lors de notre séance d'écriture de poèmes en groupe. Ensemble, nous explorerons des thèmes profonds, partageant notre sensibilité et notre créativité.",
  "Création d'une Histoire Collaborative" => "Rejoignez notre aventure littéraire collective en contribuant à une histoire épique. Chacun apporte sa plume et ses idées, tissant une trame narrative complexe et envoûtante.",
  "Blogging Collectif" => "Unissez vos voix dans notre blog collectif, où chaque participant partage ses réflexions, ses passions et ses expériences. En créant du contenu ensemble, nous célébrons la diversité de nos points de vue.",
  "Atelier d'Écriture Créative" => "Affûtez vos compétences d'écrivain lors de notre atelier d'écriture créative. Nous explorerons des techniques, des styles et des défis littéraires pour donner vie à des récits captivants.",
  "Lettres d'Amour et d'Amitié" => "Plongez dans l'art perdu de l'écriture manuscrite. Échangez des lettres d'amour et d'amitié avec vos amis, partagez vos sentiments les plus profonds et créez des souvenirs durables."
},
# ok
"Meditation" => {
  "Séance de Méditation Guidée" => "Rejoignez notre cercle de méditation guidée pour un moment de paix intérieure. Laissez-vous porter par la voix apaisante du guide et trouvez l'harmonie en vous-même.",
  "Méditation en Plein Air" => "Respirez l'air pur et connectez-vous à la nature lors de notre séance de méditation en plein air. Assis sur l'herbe ou sur le sable, vous sentirez le stress fondre au rythme de votre respiration.",
  "Méditation Bouddhiste" => "Explorez la tradition millénaire de la méditation bouddhiste lors d'une séance dans un temple ou un centre dédié. Apprenez les techniques de concentration et de pleine conscience pour trouver l'équilibre intérieur.",
  "Méditation Sonore" => "Laissez les vibrations sonores vous guider dans un état méditatif profond. Nos sessions de méditation sonore utilisent des instruments comme les bols tibétains pour créer une expérience sensorielle unique.",
  "Retraite de Méditation" => "Offrez-vous une pause bien méritée avec notre retraite de méditation. Éloignez-vous du tumulte de la vie quotidienne et plongez dans une expérience de méditation prolongée."
},
# ok
"Natation" => {
  "Nage en Eau Libre" => "Explorez le plaisir de la nage en eau libre dans nos lacs et rivières locaux. La sensation de l'eau autour de vous et le paysage naturel vous offrent une expérience de nage unique.",
  "Cours de Natation pour Débutants" => "Que vous soyez un adulte ou un enfant, nos cours de natation pour débutants vous apprendront les bases de la natation. Plongez en toute confiance dans le monde aquatique.",
  "Entraînement de Natation" => "Améliorez votre endurance et votre technique avec nos séances d'entraînement de natation. Nos coaches vous guideront à travers des séances variées pour maximiser vos performances.",
  "Natation Artistique" => "Laissez votre créativité s'exprimer dans l'eau avec notre cours de natation artistique. Les mouvements gracieux et la synchronisation créent une performance aquatique enchanteresse.",
  "Plongée en Apnée" => "Découvrez la beauté des fonds marins avec notre séance de plongée en apnée. Explorez les récifs, observez la faune marine et ressentez la liberté de la nage sans équipement."
},
# ok
"Astronomie" => {
  "Nuit d'Observation Astronomique" => "Rejoignez notre nuit d'observation astronomique pour explorer les merveilles du cosmos. Les télescopes pointés vers les étoiles révèleront des détails fascinants, des galaxies lointaines aux planètes proches.",
  "Exploration de la Lune et de Mars" => "Embarquez pour un voyage virtuel vers la Lune et Mars lors de notre atelier d'exploration spatiale. Découvrez les dernières découvertes de l'exploration planétaire.",
  "Atelier de Photographie Céleste" => "Apprenez à capturer la beauté du ciel nocturne lors de notre atelier de photographie céleste. Vous maîtriserez les techniques pour prendre des clichés d'étoiles et de nébuleuses.",
  "Soirée Astronomique et Contes Étoilés" => "Vivez une soirée immersive avec des contes étoilés sous la voie lactée. Des récits mythologiques aux légendes cosmiques, laissez-vous emporter par l'imaginaire.",
  "Discussion sur la Vie Extraterrestre" => "Plongez dans le mystère de la vie extraterrestre lors de notre discussion animée. Partagez des théories, des faits intrigants et des hypothèses sur l'existence d'autres formes de vie dans l'univers."
},
# ok
"Art" => {
  "Atelier de Peinture sur Toile" => "Exprimez votre créativité sur la toile avec nous. Nos séances d'art sont une invitation à laisser votre imagination s'envoler, à jouer avec les couleurs et à créer des œuvres uniques.",
  "Exposition d'Art Locale" => "Rejoignez-nous pour une visite d'exposition d'art locale. Vous découvrirez des talents émergents et des œuvres inspirantes qui éveilleront votre appréciation de l'art.",
  "Sculpture en Plein Air" => "Plongez dans le monde de la sculpture en plein air. Nous travaillons avec divers matériaux, de la pierre au bois, pour donner naissance à des sculptures qui transmettent des émotions.",
  "Cours d'Art Abstrait" => "Abandonnez-vous à l'art abstrait lors de notre cours dédié. Explorez les formes, les textures et les gestes libres pour créer des œuvres qui éveilleront la curiosité.",
  "Création d'Artisanat" => "Notre atelier d'artisanat vous guide dans la création de bijoux, de poteries et d'autres pièces artisanales. Chaque objet est une expression de votre talent créatif."
},
# ok
"Lecture" => {
  "Club de Lecture Mensuel" => "Plongez dans des mondes littéraires variés en rejoignant notre club de lecture. Chaque mois, nous explorons un nouveau livre, partageons nos impressions et élargissons notre compréhension du monde.",
  "Lecture en Groupe au Parc" => "Apportez votre livre préféré et rejoignez-nous au parc pour une séance de lecture en groupe. Sous le feuillage des arbres, la magie des mots prend une nouvelle dimension.",
  "Échange de Livres" => "Partagez vos trésors littéraires en participant à notre échange de livres. Chacun apporte un livre qu'il a adoré, et repart avec un nouveau compagnon de lecture.",
  "Séance de Poésie" => "Laissez-vous envoûter par la poésie lors de notre séance dédiée. Nous lisons des poèmes classiques et contemporains, partageons nos propres créations et explorons la beauté des mots.",
  "Bibliothèque de Quartier" => "Visitez notre bibliothèque de quartier et explorez une vaste collection de livres. Vous pouvez emprunter, lire sur place et même participer à des discussions littéraires."
},
# ok
"Voyage" => {
  "Soirée Diaporama de Voyage" => "Voyagez sans quitter votre ville lors de notre soirée diaporama. Les voyageurs passionnés partagent leurs aventures, leurs photos et leurs conseils pour des destinations lointaines.",
  "Excursion d'Exploration Urbaine" => "Partons à la découverte de quartiers méconnus de la ville lors de notre excursion urbaine. Chaque rue révèle une histoire, chaque coin un trésor caché.",
  "Cuisine du Monde" => "Plongez dans la culture d'un pays étranger chaque mois avec notre club de cuisine du monde. Nous préparons des plats traditionnels, échangeons des anecdotes et savourons des saveurs exotiques.",
  "Concerts du Monde" => "La musique est un langage universel. Assistez à nos concerts du monde où des artistes internationaux vous emmèneront en voyage musical, des rythmes africains aux mélodies asiatiques.",
  "Séance de Planification de Voyage" => "Que vous prépariez un voyage lointain ou une escapade de week-end, rejoignez notre séance de planification de voyage. Nous partageons des conseils, des itinéraires et des astuces pour des aventures réussies."
},
# ok
"Jardinage" => {
  "Jardinage Communautaire" => "Rejoignez notre jardin communautaire et découvrez la joie de faire pousser vos propres légumes et fleurs. Chaque saison apporte de nouvelles récoltes et de nouveaux défis.",
  "Atelier de Création de Jardins Miniatures" => "Cultivez votre créativité avec notre atelier de jardins miniatures. Vous confectionnerez des paysages en miniature, des jardins zen apaisants aux mondes fantastiques en pot.",
  "Soins des Plantes d'Intérieur" => "Apprenez à prendre soin de vos plantes d'intérieur lors de notre séance dédiée. Nous discutons des besoins spécifiques de chaque plante et partageons des secrets de verdure.",
  "Jardinage Vertical" => "Optimisez l'espace de votre balcon ou de votre terrasse avec notre atelier de jardinage vertical. Les murs se transforment en jardins luxuriants, apportant une touche de verdure à la vie urbaine.",
  "Visite de Jardins Botaniques" => "Explorez la diversité de la flore en visitant nos jardins botaniques locaux. Des orchidées exotiques aux cactus inhabituels, chaque visite est une leçon de botanique en plein air."
},
# ok
"Jeux de societe" => {
  "Soirée Jeux de Société" => "Rassemblez vos amis et découvrez de nouveaux jeux de société. Des jeux de stratégie complexes aux jeux de rôle hilarants, chaque soirée est une aventure ludique.",
  "Tournoi de Jeu de Cartes" => "Préparez vos cartes et rejoignez notre tournoi de jeu de cartes. Que vous soyez passionné de poker, de bridge ou de tarot, la compétition et le plaisir sont garantis.",
  "Jeux de Société Classiques" => "Replongez dans l'enfance avec nos jeux de société classiques. Monopoly, Scrabble, Risk - nous avons tous vos favoris, prêts à être joués autour d'une table conviviale.",
  "Jeu de Dés Épiques" => "Préparez-vous à des aventures épiques lors de nos sessions de jeu de dés. Incarnez des personnages fantastiques, résolvez des énigmes et explorez des mondes imaginaires.",
  "Soirée Puzzles" => "Résolvez des énigmes en équipe lors de notre soirée puzzles. Les pièces s'emboîtent, les images prennent forme, et la satisfaction de voir l'image complète est incomparable."
},
# ok
"Randonnee" => {
  "Randonnée Matinale" => "Démarrez votre journée du bon pied en rejoignant notre randonnée matinale. Les sentiers tranquilles, le chant des oiseaux et l'air frais vous revitaliseront pour la journée.",
  "Randonnée en Montagne" => "Laissez-vous émerveiller par des paysages grandioses lors de notre randonnée en montagne. Chaque sommet atteint est une victoire, chaque panorama une récompense.",
  "Sentier Forestier Mystique" => "Explorez des sentiers forestiers mystiques lors de notre randonnée nocturne. Les ombres des arbres, les bruits nocturnes et les étoiles vous transporteront dans un autre monde.",
  "Randonnée à la Cascade" => "Suivez le murmure de l'eau jusqu'à une cascade majestueuse lors de notre randonnée. La fraîcheur de l'eau, le ruissellement apaisant et la nature luxuriante vous attendent.",
  "Sentier d'Histoire Naturelle" => "Marchez sur un sentier d'histoire naturelle pour découvrir la faune et la flore locales. Nos guides expérimentés partageront leurs connaissances sur la biodiversité de la région."
},
# ok
"Camping" => {
  "Camping sous les Étoiles" => "Échappez à la ville et campez sous les étoiles avec nous. Le feu de camp crépite, les histoires se racontent et la magie de la nuit vous enveloppe.",
  "Cuisine en Plein Air" => "Découvrez l'art de la cuisine en plein air lors de notre séance de barbecue et de cuisine au campement. Les saveurs de la nature rehaussent chaque bouchée.",
  "Activités de Camping" => "Du tir à l'arc à la pêche, nos activités de camping sont une aventure en soi. Chaque jour apporte de nouvelles opportunités d'explorer la nature et de créer des souvenirs durables.",
  "Nuitée au Bord du Lac" => "Installez votre tente au bord du lac pour une nuitée paisible. Le reflet des étoiles sur l'eau, le bruit apaisant des vagues et la sérénité de la nature vous attendent.",
  "Feux de Camp et Contes" => "Rassemblez-vous autour du feu de camp pour des contes mystérieux et des légendes. Les ombres dansantes et le crépitement du feu ajoutent une dimension magique à chaque histoire."
},
# ok
"Theatre" => {
  "Soirée de Théâtre Intime" => "Plongez dans l'émotion du théâtre lors de nos soirées intimes. Des performances théâtrales captivantes vous rapprocheront des personnages et des histoires.",
  "Atelier de Jeu d'Acteur" => "Devenez acteur d'un jour en participant à notre atelier de jeu d'acteur. Vous explorerez des techniques de performance, développerez votre talent et ferez l'expérience de la scène.",
  "Représentation de Théâtre Classique" => "Rejoignez-nous pour une représentation de théâtre classique. Des pièces de Shakespeare aux tragédies grecques, chaque spectacle vous transporte dans un autre temps.",
  "Théâtre d'Improvisation" => "Laissez libre cours à votre créativité lors de notre séance de théâtre d'improvisation. Les scénarios surgissent spontanément, et le rire est au rendez-vous.",
  "Visite de Coulisses" => "Découvrez les secrets des coulisses du théâtre lors de notre visite spéciale. Vous explorerez les décors, les costumes et vivrez l'excitation des préparatifs avant une représentation."
},
# ok
"Sport" => {
  "Match de Basketball Amical" => "Rejoignez-nous au terrain de basket du parc ce samedi après-midi. Marquez des paniers, défendez vaillamment et partagez des fous rires à chaque dribble. ",
  "Yoga en Plein Air" => "Ressentez la connexion avec la nature lors de nos séances de yoga en plein air chaque dimanche matin. Nous pratiquons sous le soleil, respirons l'air frais et trouvons la paix intérieure ensemble.",
  "Course à Pied en Groupe" => "Laissez le stress derrière vous et rejoignez notre groupe de course à pied. Nous courons ensemble pour le plaisir, nous motivant mutuellement à atteindre de nouveaux sommets.",
  "Séance d'Entraînement en Circuit" => "Notre jardin se transforme en salle de sport en plein air chaque mardi soir. Nous faisons des burpees, des pompes et bien plus encore.",
  "Tournoi de Tennis en Double" => "Notre club de tennis organise un tournoi amical en double ce week-end. Apportez votre raquette et rejoignez-nous pour des matchs passionnants."
},
# ok
"Musique" => {
  "Concert en Petit Comité" => "Bienvenue chez nous pour une soirée intime de musique acoustique. Nous jouerons nos chansons préférées, partagerons nos histoires et laisserons la musique nous unir.",
  "Atelier de Composition" => "Explorez l'art de la création musicale avec nous. Chacun apporte ses idées et son inspiration, et ensemble, nous construisons une mélodie qui nous ressemble.",
  "Jam Session en Plein Air" => "Rendez-vous au parc ce samedi avec vos instruments. Nous improviserons en plein air, créant des mélodies spontanées, partageant des sourires et bercés par le rythme de la nature.",
  "Cours de Danse et de Rythme" => "La danse est notre passion commune. Inscrivez-vous à notre cours de danse en groupe, où nous apprendrons différents styles et trouverons la joie dans chaque mouvement.",
  "Session d'Écoute de Vinyles" => "Plongez dans le monde de la musique analogique. Chacun apporte ses vinyles préférés et raconte l'histoire derrière chaque morceau. Une soirée d'écoute enrichissante et nostalgique vous attend."
},
# ok
"Cuisine" => {
  "Atelier de Sushi Maison" => "Rejoignez notre atelier de sushis, où nous vous guiderons à travers l'art de la cuisine japonaise. Vous roulerez des makis et couperez des sashimis, puis dégusterez vos créations avec une fierté gastronomique.",
  "Soirée Pizza Faite Maison" => "La cuisine italienne s'invite chez nous. Choisissez vos garnitures préférées et confectionnez votre propre pizza. Une soirée conviviale et gourmande en perspective.",
  "Dégustation de Vins" => "Amoureux du vin ou simples curieux, venez à notre dégustation. Nous partagerons nos connaissances, dégusterons différents cépages et célébrerons l'art de la viticulture.",
  "Cuisine Internationale" => "Chaque mois, nous partons à la découverte d'une nouvelle cuisine du monde. Notre prochaine escale la cuisine indienne. Préparez-vous à épicer vos papilles.",
  "Cours de Cuisine Gourmet" => "Notre cuisine est votre toile, les ingrédients vos couleurs. Inscrivez-vous à notre cours de cuisine gourmet pour apprendre des techniques de chef et créer des plats dignes d'un restaurant étoilé."
},
# ok
"Equitation" => {
  "Balade à Cheval au Coucher du Soleil" => "Explorez la beauté de la nature à dos de cheval lors d'une balade paisible au coucher du soleil. Les sentiers tranquilles et les couleurs du ciel créent une expérience inoubliable.",
  "Cours d'Équitation pour Débutants" => "Apprenez les bases de l'équitation avec nos cours dédiés aux débutants. Vous développerez des compétences équestres et établirez une connexion avec ces majestueux animaux.",
  "Saut d'Obstacles" => "Si vous aimez l'adrénaline, rejoignez notre session de saut d'obstacles. Vous et votre cheval surmonterez des obstacles, défiant la gravité avec grâce et puissance.",
  "Équithérapie" => "Découvrez le pouvoir de l'équithérapie pour renforcer la confiance en soi et l'estime de soi. Nos séances thérapeutiques avec les chevaux apportent bien-être et épanouissement.",
  "Randonnée Équestre" => "Partez à l'aventure lors de notre randonnée équestre à travers des paysages pittoresques. Vous vivrez une expérience immersive dans la nature en compagnie de nos amis à quatre pattes."
},
# ok
"Cinema" => {
  "Soirée Cinéma en Plein Air" => "Rejoignez-nous pour une soirée cinéma en plein air sous les étoiles. Des classiques du cinéma aux films contemporains, chaque projection est une escapade cinématographique.",
  "Cours de Réalisation" => "Explorez le monde de la réalisation cinématographique avec nos cours dédiés. Vous apprendrez à tourner des scènes, à diriger des acteurs et à donner vie à vos idées.",
  "Débat sur les Films Cultes" => "Plongez dans des discussions animées sur les films cultes. Partagez vos critiques, vos théories et vos moments préférés de ces films qui ont marqué l'histoire du cinéma.",
  "Projection de Documentaires Engagés" => "Découvrez des documentaires percutants lors de nos projections spéciales. Ces films vous sensibiliseront aux enjeux sociaux, environnementaux et culturels actuels.",
  "Atelier d'Effets Spéciaux" => "Explorez les coulisses des effets spéciaux au cinéma lors de notre atelier. Vous découvrirez les techniques utilisées pour créer des mondes fantastiques à l'écran."
}
}
