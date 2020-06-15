# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'time'

# Delete the content of the actual db
School.destroy_all
Training.destroy_all
Session.destroy_all
Program.destroy_all

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
  {schoolID: 1, name: "Développeur", duration: 24, description: "Se reconvertir avec 24 semaines de développement", url: "https://www.thehackingproject.org/fr/en-construction", mode: "remote or onsite", helpForAJob: true, hours_per_day: 4},
  {schoolID: 2, name: "Full Stack Developpement Web", duration: 10, description: "Apprenez à coder en 10 semaines", url: "https://www.lacapsule.academy/apprendre-a-coder", mode: "remote or onsite", helpForAJob: false, hours_per_day: 8},
  {schoolID: 2, name: "Part time - Tech & Business", duration: 13, description: "Le Coding Bootcamp à temps partiel, pour apprendre", url: "https://www.lacapsule.academy/coding-bootcamp-part-time", mode: "remote or onsite", helpForAJob: false, hours_per_day: 2},
  {schoolID: 3, name: "Développeur web (temps plein)", duration: 9, description: "En 9 semaines intensives, apprenez toutes les compétences d'un développeur web junior pour progresser dans votre métier ou changer de carrière.", url: "https://www.lewagon.com/fr/web-development-course/full-time", mode: "remote or onsite", helpForAJob: true, hours_per_day: 8},
  {schoolID: 3, name: "Développeur web (temps partiel)", duration: 24, description: "En 24 semaines à temps partiel, apprenez toutes les compétences d'un développeur web junior pour progresser dans votre métier ou changer de carrière.", url: "https://www.lewagon.com/fr/web-development-course/part-time", mode: "remote or onsite", helpForAJob: true, hours_per_day: 4},
  {schoolID: 4, name: "Développeur web", duration: 24, description: "6 mois pour devenir développeur web, c’est un objectif concret.", url: "https://oclock.io/formations/developpeur-web", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Développeur Fullstack JS", duration: 24, description: "6 mois pour devenir développeur web spécialisé en JavaScript.", url: "https://oclock.io/formations/developpeur-web-fullstack-javascript", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Socle développment web", duration: 12, description: "3 mois pour vous constituer un socle de compétences techniques.", url: "https://oclock.io/formations/socle-developpement-web", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Socle Fullstack JS", duration: 12, description: "3 mois pour plonger dans l'environnement JavaScript", url: "https://oclock.io/formations/socle-developpement-javascript", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Spécialisation React.JS", duration: 4, description: "Une formation pour se spécialiser en React, la célèbre bibliothèque JavaScript", url: "https://oclock.io/formations/developpeur-react", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Professionnalisation React.JS", duration: 12, description: "Une formation pour se professionnaliser en React, la célèbre bibliothèque JavaScript", url: "https://oclock.io/formations/developpeur-react", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Spécialisation Symfony", duration: 4, description: "Une formation pour se spécialiser en Symfony, le puissant framework PHP.", url: "https://oclock.io/formations/developpeur-symfony", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Professionnalisation Symfony", duration: 12, description: "Une formation pour se professionnaliser en Symfony, le puissant framework PHP.", url: "https://oclock.io/formations/developpeur-symfony", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Spécialisation WordPress", duration: 4, description: "Une formation pour se spécialiser en WordPress, le CMS utilisé par 35% du web !", url: "https://oclock.io/formations/developpeur-wordpress", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Professionnalisation WordPress", duration: 12, description: "Une formation pour se professionnaliser en WordPress, le CMS utilisé par 35% du web !", url: "https://oclock.io/formations/developpeur-wordpress", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Spécialisation Data et conception d'API", duration: 4, description: "Une formation pour apprendre à jongler avec des données en JavaScript.", url: "https://oclock.io/formations/developpeur-data-api", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 4, name: "Professionnalisation Data et conception d'API", duration: 12, description: "Une formation pour se professsionnaliser avec les données en JavaScript.", url: "https://oclock.io/formations/developpeur-data-api", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 5, name: "Développeur web et web mobile DWWM", duration: 36, description: "Avec Educatel, vous pouvez apprendre le métier de développeur web tout en préparant le passage de votre titre professionnel, reconnu par l’Etat.", url: "https://www.educatel.fr/formation-web-informatique/developpeur-web-mobile", mode: "remote", helpForAJob: true, hours_per_day: nil},
  {schoolID: 6, name: "Développeur Web Javascript PHP", duration: 16, description: "Devenez développeur web junior en 4 mois en maîtrisant les 5 langages les plus demandés sur le marché du travail : HTML, CSS, JavaScript, SQL et PHP.", url: "https://3wa.fr/formations/developpeur-web-php/developpeur-web-php-javascript-4-mois-temps-plein/", mode: "remote", helpForAJob: true, hours_per_day: 8},
  {schoolID: 6, name: "Développeur Full Stact React Node.Js", duration: 48, description: "La 3W Academy propose une formation en alternance au métier de Développeur Web permettant de se spécialiser sur les technologies les plus demandées sur le marché : Node.Js et React.", url: "https://3wa.fr/formations/developpeur-web-php/developpeur-full-stack-react-node-js-1-an-alternance/", mode: "remote-alternance", helpForAJob: true, hours_per_day: 8},
  {schoolID: 7, name: "Développeur Web", duration: 12, description: "Un programme de 490h pour devenir développeur web et changer de vie.", url: "https://www.lapiscine.pro/formations/developpeur/", mode: "onsite", helpForAJob: true, hours_per_day: 8}
]

session_array = [
  {trainingID: 1, start_date: DateTime.new(2020,6,29,0,0), end_date: DateTime.new(2020,9,18,0,0), location: "France", price: 500},
  {trainingID: 2, start_date: DateTime.new(2020,6,29,0,0), end_date: DateTime.new(2020,9,18,0,0), location: "France", price: 500},
  {trainingID: 4, start_date: DateTime.new(2020,6,15,0,0), end_date: DateTime.new(2020,8,23,0,0), location: "Paris", price: 6500},
  {trainingID: 4, start_date: DateTime.new(2020,6,15,0,0), end_date: DateTime.new(2020,8,23,0,0), location: "Lyon", price: 6500},
  {trainingID: 4, start_date: DateTime.new(2020,6,15,0,0), end_date: DateTime.new(2020,8,23,0,0), location: "Lisbonne", price: 6500}
]


program_array = [ 
  {trainingID: 2, description: "Le parcours fullstack se déroule en 12 semaines. Il a pour objectif de permettre à un entrepreneur de créer son projet, à une personne en reconversion d'initier sa nouvelle carrière, ou simplement de compléter son CV pour améliorer son employabilité. Cette formation est ultra intense et vous demandera d'être disponible du lundi au vendredi de 09h00 à 20h00. Comme nous ne sommes pas une école classique, vous pourrez adapter vos horaires en fonction de vos obligations.", language: "HTML, CSS, JavaScript, Ruby, Ruby on Rails, SQL, Git, GitHub"},
  {trainingID: 4, description: "Vous allez expérimenter une nouvelle façon d'apprendre. A La Capsule, vous apprenez en construisant vos produits tech. C'est l'approche par projet ou Project-Based Learning. À travers ces 9 projets, vous allez apprendre à coder en immersion complète, comme si vous étiez déjà développeur web ! Au rythme d'un nouveau projet par semaine, chaque jour, les nouvelles notions sont immédiatement mises en pratique au sein d’un projet qui vous suit tout au long de la semaine.", language: "JavaScript, React, React Native"}
]

# Seed

7.times do |i|
  School.create(name: school_array[i][:name], website: school_array[i][:website], siret: school_array[i][:siret], campus_nb: school_array[i][:campuses], creation_year: school_array[i][:creation])
end

23.times do |i|
  Training.create(name: training_array[i][:name], duration: training_array[i][:duration], description: training_array[i][:description], hours_per_day: training_array[i][:hours_per_day], url: training_array[i][:url], mode: training_array[i][:mode], school_id: training_array[i][:schoolID], tag_list: [training_array[i][:mode],training_array[i][:duration].to_s])
end

4.times do |i|
  Session.create(start_date: session_array[i][:start_date], end_date: session_array[i][:end_date], location: session_array[i][:location], price: session_array[i][:price], training_id: session_array[i][:trainingID])
end

2.times do |i|
  Program.create(description: program_array[i][:description], language: program_array[i][:language])
end



puts "Seed completed !"
