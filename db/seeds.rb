# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Delete the content of the actual db
School.destroy_all
Training.destroy_all

# Reset the counters to 0
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# Array of hashes
school_array = [
  {name: "The Hacking Project", website: "https://www.thehackingproject.org/", siret: nil, campuses: 0, creation: 2017, capital: nil, RCS: nil},
  {name: "La Capsule", website: "https://www.lacapsule.academy/", siret: nil, campuses: 3, creation: 2017, capital: nil, RCS: nil},
  {name: "Le Wagon", website: "https://www.lewagon.com/fr", siret: nil, campuses: 39, creation: 2013, capital: nil, RCS: nil},
  {name: "O'clock", website: "https://oclock.io/", siret: nil, campuses: 0, creation: 2016, capital: 1641026, RCS: 818614588},
  {name: "Educatel", website: "https://www.educatel.fr/", siret: nil, campuses: 1, creation: 1958, capital: 2743815.40 , RCS: 530188986},
  {name: "3W Academy", website: "https://3wa.fr/", siret: 75404770200024, campuses: 0, creation: 2012, capital: 7841 , RCS: 754047702},
  {name: "La piscine", website: "https://www.lapiscine.pro/", siret: 83052386600010, campuses: 4, creation: 2018, capital: 13000 , RCS: nil}
]

training_array = [
  {schoolID: 1, name: "Semaine d'intro", duration: 1, description: "Une semaine pour faire son site ! ", url: "https://www.thehackingproject.org/fr/en-construction", mode: "remote or onsite", helpForAJob: false, hours_per_day: 4},
  {schoolID: 1, name: "Full Stack web", duration: 12, description: "Refaire Airbnb en 12 semaines", url: "https://www.thehackingproject.org/courses/code?locale=fr", mode: "remote or onsite", helpForAJob: false, hours_per_day: 4},
  {schoolID: 1, name: "Développeur", duration: 24, description: "Se reconvertira avec 24 semaines de développement", url: "https://www.thehackingproject.org/fr/en-construction", mode: "remote or onsite", helpForAJob: true, hours_per_day: 4},
  {schoolID: 2, name: "Full Stack Developpement Web", duration: 10, description: "Apprenez à coder en 10 semaines", url: "https://www.lacapsule.academy/apprendre-a-coder", mode: "remote or onsite", helpForAJob: false, hours_per_day: 8},
  {schoolID: 2, name: "Part time - Tech & Business", duration: 13, description: "Le Coding Bootcamp à temps partiel, pour apprendre", url: "https://www.lacapsule.academy/coding-bootcamp-part-time", mode: "remote or onsite", helpForAJob: false, hours_per_day: 2},
  {schoolID: 3, name: "Développeur web (temps plein)", duration: 9, description: "à coder et devenir autonome techniquement", url: "https://www.lewagon.com/fr/web-development-course/full-time", mode: "remote or onsite", helpForAJob: true, hours_per_day: 8},
  {schoolID: 3, name: "Développeur web (temps partiel)", duration: 24, description: "En 24 semaines à temps partiel, apprenez toutes les compétences d'un développeur web junior pour progresser dans votre métier ou changer de carrière.", url: "https://www.lewagon.com/fr/web-development-course/part-time", mode: "remote or onsite", helpForAJob: true, hours_per_day: 4},
  {schoolID: 4, name: "Développeur web (temps plein)", duration: 24, description: "Notre programme a été pensé pour les néophytes. En d’autres termes, pas besoin d’avoir dévoré moults bouquins sur le code ou d’avoir essayé tous les MOOCs possibles pour faire bonne figure dans cette formation.", url: "https://oclock.io/formations/developpeur-web", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Développeur Fullstack JavaScript", duration: 24, description: "Au menu : un programme taillé pour devenir développeur web et se construire une expertise sur une techno très appréciée sur le marché pour sa flexibilité et la grande richesse de son écosystème. En dessert, un Titre professionnel reconnu par l’Etat et un coaching intensif jusqu’à la signature de votre premier contrat de développeur web.", url: "https://oclock.io/formations/developpeur-web-fullstack-javascript", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Socle développment web", duration: 12, description: "Ce programme vous apporte les fondements du développement web : l’apprentissage de la programmation informatique, mais aussi les problématiques liées à la conception web. Il vous permet de maîtriser les premières technos essentielles si vous souhaitez concevoir techniquement votre projet d’entreprise, ou vous préparer à devenir développeur web.", url: "https://oclock.io/formations/socle-developpement-web", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Socle JavaScript", duration: 12, description: "Ce programme “socle” vous propose d'acquérir les fondements du développement web avec un focus particulier donné sur JavaScript. L’occasion de se positionner très tôt dans votre parcours de formation sur une techno très appréciée sur le marché pour sa flexibilité et la grande richesse de son écosystème.", url: "https://oclock.io/formations/socle-developpement-javascript", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Spécialisation React.JS", duration: 4, description: "Cette formation vous propose d’approfondir la création d’interface côté client en JavaScript, à l’aide de React.js, la bibliothèque dont la notoriété n’est plus à prouver. Au-delà de la maîtrise de la library, c’est aussi tout l’écosystème autour du langage que l’on va s’approprier : nouvelles spécifications EcmaScript, outils de build, et tout une série de modules indispensables.", url: "https://oclock.io/formations/developpeur-react", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Professionnalisation React.JS", duration: 12, description: "Cette formation vous propose d’approfondir la création d’interface côté client en JavaScript, à l’aide de React.js, la bibliothèque dont la notoriété n’est plus à prouver. Au-delà de la maîtrise de la library, c’est aussi tout l’écosystème autour du langage que l’on va s’approprier : nouvelles spécifications EcmaScript, outils de build, et tout une série de modules indispensables.", url: "https://oclock.io/formations/developpeur-react", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Spécialisation Symfony", duration: 4, description: "Pendant cette formation, vous composerez avec toutes les bonnes pratiques de conception web inhérentes au développement avec Symfony 4. Très apprécié par les recruteurs, Symfony est également porté par une des plus grandes communautés PHP.", url: "https://oclock.io/formations/developpeur-symfony", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Professionnalisation Symfony", duration: 12, description: "Pendant cette formation, vous composerez avec toutes les bonnes pratiques de conception web inhérentes au développement avec Symfony 4. Très apprécié par les recruteurs, Symfony est également porté par une des plus grandes communautés PHP.", url: "https://oclock.io/formations/developpeur-symfony", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Spécialisation WordPress", duration: 4, description: "Cette formation vous propose d’approfondir la solution WordPress pour le développement de sites web administrables. On va décortiquer la gestion de contenu, et se mesurer aux fonctionnalités avancées de l’outil : la customisation du front avec les thèmes, la customisation du back avec les plugins. Un programme bien complet !", url: "https://oclock.io/formations/developpeur-wordpress", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Professionnalisation WordPress", duration: 12, description: "Cette formation vous propose d’approfondir la solution WordPress pour le développement de sites web administrables. On va décortiquer la gestion de contenu, et se mesurer aux fonctionnalités avancées de l’outil : la customisation du front avec les thèmes, la customisation du back avec les plugins. Un programme bien complet !", url: "https://oclock.io/formations/developpeur-wordpress", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Spécialisation Data et conception d'API", duration: 4, description: "Vous serez formés sur les outils vous permettant d’extraire, traiter et interpréter de la data. Une compétence technique transverse que vous serez en mesure d’appliquer sur plusieurs facettes d’un projet web.", url: "https://oclock.io/formations/developpeur-data-api", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Professionnalisation Data et conception d'API", duration: 12, description: "Vous serez formés sur les outils vous permettant d’extraire, traiter et interpréter de la data. Une compétence technique transverse que vous serez en mesure d’appliquer sur plusieurs facettes d’un projet web.", url: "https://oclock.io/formations/developpeur-data-api", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 5, name: "Développeur web et web mobile DWWM", duration: 36, description: "La préparation au titre professionnel Développeur web et web mobile vous permet d’appréhender efficacement les épreuves officielles. À l’issue de votre préparation, vous maîtriserez les compétences professionnelles essentielles pour devenir développeur web et web mobile", url: "https://www.educatel.fr/formation-web-informatique/developpeur-web-mobile", mode: "remote", helpForAJob: true, hours_per_day: nil},
  {schoolID: 6, name: "Développeur Web Javascript PHP", duration: 16, description: "La 3W Academy propose une formation intensive en télé-présentiel de 3 mois au métier de développeur web. Elle est accessible à tous et allie théorie et période d’immersion professionnelle. Elle apporte aux apprenants des compétences en intégration (HTML5), en Web Design, en Javascript et en PHP.", url: "https://3wa.fr/formations/developpeur-web-php/developpeur-web-php-javascript-4-mois-temps-plein/", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 6, name: "Développeur Full Stact React Node.Js", duration: 48, description: "La formation est ouverte à tous les développeurs juniors maîtrisant un langage de programmation : anciens élèves de la 3W Academy, d’autres centres de formation bootcamp, étudiants en 1ère année de BTS ou DUT et toute personne ayant un niveau de connaissances minimum en PHP et JavaScript.", url: "https://3wa.fr/formations/developpeur-web-php/developpeur-full-stack-react-node-js-1-an-alternance/", mode: "remote-alternance", helpForAJob: true, hours_per_day: 8},
  {schoolID: 7, name: "Développeur Web", duration: 12, description: "Nous donnons leur chance à toutes les personnes qui montrent qu'elles ont vraiment envie. Avec ce format intensif, les demandeurs d'emploi, les 'décrocheurs scolaire' ou même les étudiants traditionnels s'y retrouvent. 3 mois intensifs pour changer de vie et devenir développeur web!", url: "https://www.lapiscine.pro/formations/developpeur/", mode: "onsite", helpForAJob: true, hours_per_day: 8}
]


# Seed

7.times do |i|
  School.create(name: school_array[i][:name], website: school_array[i][:website], siret: school_array[i][:siret], campus_nb: school_array[i][:campuses], creation_year: school_array[i][:creation])
end

23.times do |i|
<<<<<<< HEAD
  Training.create( name: training_array[i][:name], duration: training_array[i][:duration], description: training_array[i][:description], hours_per_day: training_array[i][:hours_per_day], url: training_array[i][:url], mode: training_array[i][:mode], school_id: training_array[i][:schoolID])
=======
  Training.create( name: training_array[i][:name], duration: training_array[i][:duration], description: training_array[i][:description], hoursPerDay: training_array[i][:hoursPerDay], url: training_array[i][:url], mode: training_array[i][:mode], school_id: training_array[i][:schoolID], tag_list: [training_array[i][:mode], training_array[i][:duration].to_s] )
>>>>>>> 0c820ba8db2cdd2303a847e3fd22445ed5704e65
end


puts "Seed completed !"
