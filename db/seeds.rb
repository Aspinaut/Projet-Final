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
  {name: "The Hacking Project", website: "https://www.thehackingproject.org/", siret: nil, campuses: 0, creation: 2017, capital: nil, RCS: nil, logo_url: "https://pbs.twimg.com/profile_images/901904651087486976/f0nVknhv.jpg"},
  {name: "La Capsule", website: "https://www.lacapsule.academy/", siret: nil, campuses: 3, creation: 2017, capital: nil, RCS: nil, logo_url:"https://pbs.twimg.com/profile_images/1172456585920167936/1fYpLkRK_400x400.jpg"},
  {name: "Le Wagon", website: "https://www.lewagon.com/fr", siret: nil, campuses: 39, creation: 2013, capital: nil, RCS: nil, logo_url:"https://dwj199mwkel52.cloudfront.net/assets/lewagon-logo-square-fe76916e1b923ade71e253ae6dc031d936e5e8eebac4e26b0fbac650ea6ee360.png"},
  {name: "O'clock", website: "https://oclock.io/", siret: nil, campuses: 0, creation: 2016, capital: 1641026, RCS: 818614588, logo_url:"https://www.jaimelesstartups.fr/wp-content/uploads/2016/08/K81NHwiA_400x400.jpg"},
  {name: "Educatel", website: "https://www.educatel.fr/", siret: nil, campuses: 1, creation: 1958, capital: 2743815.40 , RCS: 530188986, logo_url:"https://www.leguidedesmetiers.fr/images/photos/logo-educatel-300x0.png"},
  {name: "3W Academy", website: "https://3wa.fr/", siret: 75404770200024, campuses: 0, creation: 2012, capital: 7841 , RCS: 754047702, logo_url:"https://forum.3wa.fr/uploads/default/original/1X/a3255b2bc73c22eaffa7d592e660d123ecb31070.png"},
  {name: "La piscine", website: "https://www.lapiscine.pro/", siret: 83052386600010, campuses: 4, creation: 2018, capital: 13000 , RCS: nil, logo_url:"data:image/png;base64,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"}
]

training_array = [
  {schoolID: 1, name: "Semaine d'intro", duration: 1, description: "Une semaine pour faire son site ! ", url: "https://www.thehackingproject.org/fr/en-construction", mode: "à distance ou présentiel", helpForAJob: false, hours_per_day: 4, background_img: "https://images.pexels.com/photos/7096/people-woman-coffee-meeting.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"},
  {schoolID: 1, name: "Full Stack web", duration: 12, description: "Refaire Airbnb en 12 semaines", url: "https://www.thehackingproject.org/courses/code?locale=fr", mode: "à distance ou présentiel", helpForAJob: false, hours_per_day: 4, background_img: "https://images.pexels.com/photos/3183186/pexels-photo-3183186.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"},
  {schoolID: 1, name: "THP Next", duration: 12, description: "12 semaines pour être professionnel du code", url: "https://thehackingproject.lpages.co/pr%C3%A9sentation-thp-next-summer-2020/", mode: "à distance ou présentiel", helpForAJob: true, hours_per_day: 4, background_img: "https://images.pexels.com/photos/3182773/pexels-photo-3182773.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"},
  {schoolID: 2, name: "Full Stack Developpement Web", duration: 10, description: "Apprenez à coder en 10 semaines", url: "https://www.lacapsule.academy/apprendre-a-coder", mode: "à distance ou présentiel", helpForAJob: false, hours_per_day: 8, background_img: "https://images.pexels.com/photos/3182773/pexels-photo-3182773.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"},
  {schoolID: 2, name: "Part time - Tech & Business", duration: 13, description: "Le Coding Bootcamp à temps partiel, pour apprendre", url: "https://www.lacapsule.academy/coding-bootcamp-part-time", mode: "à distance ou présentiel", helpForAJob: false, hours_per_day: 2, background_img: "https://images.pexels.com/photos/3182822/pexels-photo-3182822.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"},
  {schoolID: 3, name: "Développeur web (temps plein)", duration: 9, description: "En 9 semaines intensives, apprenez toutes les compétences d'un développeur web junior pour progresser dans votre métier ou changer de carrière.", url: "https://www.lewagon.com/fr/web-development-course/full-time", mode: "à distance ou présentiel", helpForAJob: true, hours_per_day: 8, background_img: "https://images.pexels.com/photos/3184339/pexels-photo-3184339.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"},
  {schoolID: 3, name: "Développeur web (temps partiel)", duration: 24, description: "En 24 semaines à temps partiel, apprenez toutes les compétences d'un développeur web junior pour progresser dans votre métier ou changer de carrière.", url: "https://www.lewagon.com/fr/web-development-course/part-time", mode: "à distance ou présentiel", helpForAJob: true, hours_per_day: 4, background_img:"https://images.unsplash.com/photo-1568992688065-536aad8a12f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 4, name: "Développeur web", duration: 24, description: "6 mois pour devenir développeur web, c’est un objectif concret.", url: "https://oclock.io/formations/developpeur-web", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img: "https://images.pexels.com/photos/3184306/pexels-photo-3184306.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"},
  {schoolID: 4, name: "Développeur Fullstack JS", duration: 24, description: "6 mois pour devenir développeur web spécialisé en JavaScript.", url: "https://oclock.io/formations/developpeur-web-fullstack-javascript", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img: "https://images.pexels.com/photos/1367276/pexels-photo-1367276.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"},
  {schoolID: 4, name: "Socle développment web", duration: 12, description: "3 mois pour vous constituer un socle de compétences techniques.", url: "https://oclock.io/formations/socle-developpement-web", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img: "https://images.unsplash.com/photo-1523240795612-9a054b0db644?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"},
  {schoolID: 4, name: "Socle Fullstack JS", duration: 12, description: "3 mois pour plonger dans l'environnement JavaScript", url: "https://oclock.io/formations/socle-developpement-javascript", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img: "https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 4, name: "Spécialisation React.JS", duration: 4, description: "Une formation pour se spécialiser en React, la célèbre bibliothèque JavaScript", url: "https://oclock.io/formations/developpeur-react", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img: "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 4, name: "Professionnalisation React.JS", duration: 12, description: "Une formation pour se professionnaliser en React, la célèbre bibliothèque JavaScript", url: "https://oclock.io/formations/developpeur-react", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img: "https://images.unsplash.com/photo-1558959356-878a1a39e824?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 4, name: "Spécialisation Symfony", duration: 4, description: "Une formation pour se spécialiser en Symfony, le puissant framework PHP.", url: "https://oclock.io/formations/developpeur-symfony", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img: "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 4, name: "Professionnalisation Symfony", duration: 12, description: "Une formation pour se professionnaliser en Symfony, le puissant framework PHP.", url: "https://oclock.io/formations/developpeur-symfony", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img: "https://images.unsplash.com/photo-1523240795612-9a054b0db644?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 4, name: "Spécialisation WordPress", duration: 4, description: "Une formation pour se spécialiser en WordPress, le CMS utilisé par 35% du web !", url: "https://oclock.io/formations/developpeur-wordpress", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img:"https://images.unsplash.com/photo-1557425493-6f90ae4659fc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 4, name: "Professionnalisation WordPress", duration: 12, description: "Une formation pour se professionnaliser en WordPress, le CMS utilisé par 35% du web !", url: "https://oclock.io/formations/developpeur-wordpress", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img:"https://images.unsplash.com/photo-1563461661026-49631dd5d68e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 4, name: "Spécialisation Data et conception d'API", duration: 4, description: "Une formation pour apprendre à jongler avec des données en JavaScript.", url: "https://oclock.io/formations/developpeur-data-api", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img:"https://images.unsplash.com/photo-1553877522-43269d4ea984?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 4, name: "Professionnalisation Data et conception d'API", duration: 12, description: "Une formation pour se professsionnaliser avec les données en JavaScript.", url: "https://oclock.io/formations/developpeur-data-api", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img:"https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 5, name: "Développeur web et web mobile DWWM", duration: 36, description: "Avec Educatel, vous pouvez apprendre le métier de développeur web tout en préparant le passage de votre titre professionnel, reconnu par l’Etat.", url: "https://www.educatel.fr/formation-web-informatique/developpeur-web-mobile", mode: "à distance ou présentiel", helpForAJob: true, hours_per_day: nil, background_img:"https://images.unsplash.com/photo-1573164713619-24c711fe7878?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 6, name: "Développeur Web Javascript PHP", duration: 16, description: "Devenez développeur web junior en 4 mois en maîtrisant les 5 langages les plus demandés sur le marché du travail : HTML, CSS, JavaScript, SQL et PHP.", url: "https://3wa.fr/formations/developpeur-web-php/developpeur-web-php-javascript-4-mois-temps-plein/", mode: "à distance", helpForAJob: true, hours_per_day: 8, background_img:"https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 6, name: "Développeur Full Stact React Node.Js", duration: 48, description: "La 3W Academy propose une formation en alternance au métier de Développeur Web permettant de se spécialiser sur les technologies les plus demandées sur le marché : Node.Js et React.", url: "https://3wa.fr/formations/developpeur-web-php/developpeur-full-stack-react-node-js-1-an-alternance/", mode: "à distance et en alternance", helpForAJob: true, hours_per_day: 8, background_img:"https://images.unsplash.com/photo-1558959356-4b2c36036b8c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"},
  {schoolID: 7, name: "Développeur Web", duration: 12, description: "Un programme de 490h pour devenir développeur web et changer de vie.", url: "https://www.lapiscine.pro/formations/developpeur/", mode: "présentiel", helpForAJob: true, hours_per_day: 8, background_img:"https://images.unsplash.com/photo-1558959355-d9922ff0b767?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"}
]


session_array = [
  {trainingID: 2, start_date: DateTime.new(2020,6,29,0,0), end_date: DateTime.new(2020,9,18,0,0), location: "France", price: 500},
  {trainingID: 3, start_date: DateTime.new(2020,6,29,0,0), end_date: DateTime.new(2020,9,18,0,0), location: "France", price: 1500},
  {trainingID: 4, start_date: DateTime.new(2020,8,31,0,0), end_date: DateTime.new(2020,11,6,0,0), location: "Paris", price: 6500},
  {trainingID: 4, start_date: DateTime.new(2020,9,14,0,0), end_date: DateTime.new(2020,11,20,0,0), location: "Lisbonne", price: 6500},
  {trainingID: 4, start_date: DateTime.new(2020,9,21,0,0), end_date: DateTime.new(2020,11,27,0,0), location: "Lyon", price: 5200},
  {trainingID: 5, start_date: DateTime.new(2020,9,21,0,0), end_date: DateTime.new(2020,12,18,0,0), location: "Paris", price: 3900},
  {trainingID: 6, start_date: DateTime.new(2020,7,6,0,0), end_date: DateTime.new(2020,9,4,0,0), location: "Paris", price: 6900},
  {trainingID: 7, start_date: DateTime.new(2020,9,5,0,0), end_date: DateTime.new(2021,2,27,0,0), location: "Paris", price: 6900},
  {trainingID: 6, start_date: DateTime.new(2020,7,6,0,0), end_date: DateTime.new(2020,9,4,0,0), location: "Nantes", price: 6000},
  {trainingID: 7, start_date: DateTime.new(2020,9,26,0,0), end_date: DateTime.new(2021,2,27,0,0), location: "Nantes", price: 6000},
  {trainingID: 6, start_date: DateTime.new(2020,9,14,0,0), end_date: DateTime.new(2020,11,13,0,0), location: "Rennes", price: 6000},
  {trainingID: 6, start_date: DateTime.new(2020,6,29,0,0), end_date: DateTime.new(2020,8,28,0,0), location: "Marseille", price: 6000},
  {trainingID: 7, start_date: DateTime.new(2020,9,26,0,0), end_date: DateTime.new(2021,2,27,0,0), location: "Marseille", price: 6000},
  {trainingID: 6, start_date: DateTime.new(2020,7,6,0,0), end_date: DateTime.new(2020,9,4,0,0), location: "Lyon", price: 6000},
  {trainingID: 7, start_date: DateTime.new(2020,9,26,0,0), end_date: DateTime.new(2021,2,27,0,0), location: "Lyon", price: 6000},
  {trainingID: 6, start_date: DateTime.new(2020,7,6,0,0), end_date: DateTime.new(2020,9,4,0,0), location: "Lille", price: 6000},
  {trainingID: 7, start_date: DateTime.new(2020,10,5,0,0), end_date: DateTime.new(2021,3,8,0,0), location: "Lille", price: 6000},
  {trainingID: 6, start_date: DateTime.new(2020,7,6,0,0), end_date: DateTime.new(2020,9,4,0,0), location: "Bordeaux", price: 6000},
  {trainingID: 7, start_date: DateTime.new(2020,10,3,0,0), end_date: DateTime.new(2021,3,6,0,0), location: "Bordeaux", price: 6000},
  {trainingID: 8, start_date: DateTime.new(2020,7,13,0,0), end_date: DateTime.new(2020,12,21,0,0), location: "à distance", price: 6500},
  {trainingID: 8, start_date: DateTime.new(2020,8,24,0,0), end_date: DateTime.new(2021,2,9,0,0), location: "à distance", price: 6500},
  {trainingID: 8, start_date: DateTime.new(2020,9,14,0,0), end_date: DateTime.new(2021,3,4,0,0), location: "à distance", price: 6500},
  {trainingID: 8, start_date: DateTime.new(2020,10,26,0,0), end_date: DateTime.new(2021,4,12,0,0), location: "à distance", price: 6500},
  {trainingID: 9, start_date: DateTime.new(2020,8,24,0,0), end_date: DateTime.new(2021,2,9,0,0), location: "à distance", price: 6500},
  {trainingID: 9, start_date: DateTime.new(2020,10,5,0,0), end_date: DateTime.new(2021,3,22,0,0), location: "à distance", price: 6500},
  {trainingID: 10, start_date: DateTime.new(2020,10,3,0,0), end_date: DateTime.new(2021,3,6,0,0), location: "à distance", price: 6500},
  {trainingID: 11, start_date: DateTime.new(2020,8,24,0,0), end_date: DateTime.new(2020,11,27,0,0), location: "à distance", price: 3900},
  {trainingID: 11, start_date: DateTime.new(2020,5,10,0,0), end_date: DateTime.new(2021,1,15,0,0), location: "à distance", price: 3900},
  {trainingID: 12, start_date: DateTime.new(2020,7,8,0,0), end_date: DateTime.new(2020,8,6,0,0), location: "à distance", price: 2000},
  {trainingID: 12, start_date: DateTime.new(2020,7,29,0,0), end_date: DateTime.new(2020,8,27,0,0), location: "à distance", price: 2000},
  {trainingID: 12, start_date: DateTime.new(2020,9,7,0,0), end_date: DateTime.new(2020,10,7,0,0), location: "à distance", price: 2000},
  {trainingID: 12, start_date: DateTime.new(2020,10,21,0,0), end_date: DateTime.new(2020,11,19,0,0), location: "à distance", price: 2000},
  {trainingID: 12, start_date: DateTime.new(2020,12,2,0,0), end_date: DateTime.new(2021,1,8,0,0), location: "à distance", price: 2000},
  {trainingID: 13, start_date: DateTime.new(2020,7,8,0,0), end_date: DateTime.new(2020,10,1,0,0), location: "à distance", price: 2900},
  {trainingID: 13, start_date: DateTime.new(2020,7,29,0,0), end_date: DateTime.new(2020,10,27,0,0), location: "à distance", price: 2900},
  {trainingID: 13, start_date: DateTime.new(2020,9,7,0,0), end_date: DateTime.new(2020,11,22,0,0), location: "à distance", price: 2900},
  {trainingID: 13, start_date: DateTime.new(2020,10,21,0,0), end_date: DateTime.new(2021,1,14,0,0), location: "à distance", price: 2900},
  {trainingID: 13, start_date: DateTime.new(2020,12,2,0,0), end_date: DateTime.new(2021,3,5,0,0), location: "à distance", price: 2900},
  {trainingID: 14, start_date: DateTime.new(2020,7,29,0,0), end_date: DateTime.new(2020,8,27,0,0), location: "à distance", price: 2000},
  {trainingID: 14, start_date: DateTime.new(2020,8,17,0,0), end_date: DateTime.new(2020,9,15,0,0), location: "à distance", price: 2000},
  {trainingID: 14, start_date: DateTime.new(2020,10,21,0,0), end_date: DateTime.new(2020,11,19,0,0), location: "à distance", price: 2000},
  {trainingID: 14, start_date: DateTime.new(2020,12,2,0,0), end_date: DateTime.new(2021,1,8,0,0), location: "à distance", price: 2000},
  {trainingID: 14, start_date: DateTime.new(2021,1,4,0,0), end_date: DateTime.new(2021,2,2,0,0), location: "à distance", price: 2000},
  {trainingID: 15, start_date: DateTime.new(2020,7,29,0,0), end_date: DateTime.new(2020,10,22,0,0), location: "à distance", price: 2900},
  {trainingID: 15, start_date: DateTime.new(2020,8,17,0,0), end_date: DateTime.new(2020,11,10,0,0), location: "à distance", price: 2900},
  {trainingID: 15, start_date: DateTime.new(2020,10,21,0,0), end_date: DateTime.new(2020,1,14,0,0), location: "à distance", price: 2900},
  {trainingID: 15, start_date: DateTime.new(2020,12,2,0,0), end_date: DateTime.new(2021,3,5,0,0), location: "à distance", price: 2900},
  {trainingID: 15, start_date: DateTime.new(2021,1,4,0,0), end_date: DateTime.new(2021,3,30,0,0), location: "à distance", price: 2900},
  {trainingID: 16, start_date: DateTime.new(2020,7,29,0,0), end_date: DateTime.new(2020,8,27,0,0), location: "à distance", price: 2000},
  {trainingID: 16, start_date: DateTime.new(2020,8,17,0,0), end_date: DateTime.new(2020,9,15,0,0), location: "à distance", price: 2000},
  {trainingID: 16, start_date: DateTime.new(2020,10,21,0,0), end_date: DateTime.new(2020,11,19,0,0), location: "à distance", price: 2000},
  {trainingID: 16, start_date: DateTime.new(2020,12,2,0,0), end_date: DateTime.new(2021,1,8,0,0), location: "à distance", price: 2000},
  {trainingID: 16, start_date: DateTime.new(2021,1,4,0,0), end_date: DateTime.new(2021,2,2,0,0), location: "à distance", price: 2000},
  {trainingID: 17, start_date: DateTime.new(2020,7,29,0,0), end_date: DateTime.new(2020,10,22,0,0), location: "à distance", price: 2900},
  {trainingID: 17, start_date: DateTime.new(2020,8,17,0,0), end_date: DateTime.new(2020,11,10,0,0), location: "à distance", price: 2900},
  {trainingID: 17, start_date: DateTime.new(2020,10,21,0,0), end_date: DateTime.new(2021,1,14,0,0), location: "à distance", price: 2900},
  {trainingID: 17, start_date: DateTime.new(2020,12,2,0,0), end_date: DateTime.new(2021,3,5,0,0), location: "à distance", price: 2900},
  {trainingID: 17, start_date: DateTime.new(2021,1,4,0,0), end_date: DateTime.new(2021,3,30,0,0), location: "à distance", price: 2900},
  {trainingID: 18, start_date: DateTime.new(2020,7,8,0,0), end_date: DateTime.new(2020,8,6,0,0), location: "à distance", price: 2000},
  {trainingID: 18, start_date: DateTime.new(2020,8,17,0,0), end_date: DateTime.new(2020,9,15,0,0), location: "à distance", price: 2000},
  {trainingID: 18, start_date: DateTime.new(2020,9,7,0,0), end_date: DateTime.new(2020,10,7,0,0), location: "à distance", price: 2000},
  {trainingID: 18, start_date: DateTime.new(2020,12,2,0,0), end_date: DateTime.new(2021,1,8,0,0), location: "à distance", price: 2000},
  {trainingID: 18, start_date: DateTime.new(2021,1,20,0,0), end_date: DateTime.new(2021,2,18,0,0), location: "à distance", price: 2000},
  {trainingID: 19, start_date: DateTime.new(2020,7,8,0,0), end_date: DateTime.new(2020,10,1,0,0), location: "à distance", price: 2900},
  {trainingID: 19, start_date: DateTime.new(2020,8,17,0,0), end_date: DateTime.new(2020,11,10,0,0), location: "à distance", price: 2900},
  {trainingID: 19, start_date: DateTime.new(2020,9,7,0,0), end_date: DateTime.new(2020,12,2,0,0), location: "à distance", price: 2900},
  {trainingID: 19, start_date: DateTime.new(2020,12,2,0,0), end_date: DateTime.new(2021,3,5,0,0), location: "à distance", price: 2900},
  {trainingID: 19, start_date: DateTime.new(2021,1,20,0,0), end_date: DateTime.new(2021,4,15,0,0), location: "à distance", price: 2900},
  {trainingID: 20, start_date: "A tout moment de l'année", end_date: "", location: "à distance", price: 3950}
  ]
  
program_array = [ 
  {trainingID: 1, description: "NC", language: "HTML, CSS"},
  {trainingID: 2, description: "Le parcours fullstack se déroule en 12 semaines. Il a pour objectif de permettre à un entrepreneur de créer son projet, à une personne en reconversion d'initier sa nouvelle carrière, ou simplement de compléter son CV pour améliorer son employabilité. Cette formation est ultra intense et vous demandera d'être disponible du lundi au vendredi de 09h00 à 20h00. Comme nous ne sommes pas une école classique, vous pourrez adapter vos horaires en fonction de vos obligations.", language: "HTML, CSS, JavaScript, Ruby, Ruby on Rails, SQL, Git, GitHub"},
  {trainingID: 3, description: "THP Next est une formation de 12 semaines qui vient à la suite de THP code : les élèves ont des notions en Ruby on Rails et ces derniers savent reproduire Airbnb. Cette formation permettra d’engager une carrière professionnelle et promettra à celui ou celle qui la fera l’assurance de débouchés beaucoup plus importants en terme d’emplois ou de freelance. Pour ceux ou celles qui souhaitent créer leur entreprise cela leur permettra d’améliorer leur produit et de le rendre compatible avec les exigences des utilisateurs des années 2020.", language: "JavaScript moderne, ReactJS"},
  {trainingID: 4, description: "Vous allez expérimenter une nouvelle façon d'apprendre. A La Capsule, vous apprenez en construisant vos produits tech. C'est l'approche par projet ou Project-Based Learning. À travers ces 9 projets, vous allez apprendre à coder en immersion complète, comme si vous étiez déjà développeur web ! Au rythme d'un nouveau projet par semaine, chaque jour, les nouvelles notions sont immédiatement mises en pratique au sein d’un projet qui vous suit tout au long de la semaine.", language: "JavaScript, React, React Native"},
  {trainingID: 5, description: "À l'issue de ce Part-Time Coding Bootcamp, vous serez capables de coder un produit web, vous aurez l’autonomie technique nécessaire pour échanger et communiquer efficacement avec des équipes Tech et vous développerez votre esprit critique sur la faisabilité d’une fonctionnalité et sur les solutions techniques choisies. Vous apprendrez à travailler avec une équipe de développeurs et à adopter les process utilisés par les meilleures startups.", language: "Front-end, Back-end et Base de données"},
  {trainingID: 6, description: "Notre formation Développeur Web est une expérience immersive qui vous fait passer de débutant à Développeur Web en 9 semaines. À la fin de la formation, vous saurez construire des applications web fonctionnelles qui répondent aux besoins de vos utilisateurs, vous saurez collaborer avec d'autres Développeurs, Designers et Product Managers avec le bon workflow et les bonnes pratiques.", language: "HTML, CSS, JavaScript, Ruby, Ruby on Rails, SQL, Git, GitHub"},
  {trainingID: 7, description: "Notre formation Développeur Web est une expérience immersive qui vous fait passer de débutant à Développeur Web en 9 semaines. À la fin de la formation, vous saurez construire des applications web fonctionnelles qui répondent aux besoins de vos utilisateurs, vous saurez collaborer avec d'autres Développeurs, Designers et Product Managers avec le bon workflow et les bonnes pratiques.", language: "HTML, CSS, JavaScript, Ruby, Ruby on Rails, SQL, Git, GitHub"},
  {trainingID: 8, description: "Devenir développeur web, c’est avant tout mettre le doigt dans un univers vaste de technologies et de langages à dompter. Le premier objectif sera donc de vous constituer un socle technique suffisamment étoffé pour appréhender les problématiques du métier. L’objectif de la formation ne se résume pas à ingurgiter les langages jusqu’à plus soif, mais de se développer une capacité à créer. Se spécialiser sur certaines technos, afin de développer un savoir-faire concret permettant de concevoir une application.", language: "HTML, CSS, PHP, JS + spécialisation en Symfony, React ou Wordpress"},
  {trainingID: 9, description: "Devenir développeur web, c’est avant tout mettre le doigt dans un univers vaste de technologies et de langages à dompter. Le premier objectif sera donc de vous constituer un socle technique suffisamment étoffé pour appréhender les problématiques du métier. L’objectif de la formation ne se résume pas à ingurgiter les langages jusqu’à plus soif, mais de se développer une capacité à créer. Se spécialiser sur certaines technos, afin de développer un savoir-faire concret permettant de concevoir une application.", language: "HTML, CSS, JS + spécialisation en React ou API/data"},
  {trainingID: 10, description: "Notre formation Développeur Web est une expérience immersive qui vous fait passer de débutant à Développeur Web en 9 semaines. À la fin de la formation, vous saurez construire des applications web fonctionnelles qui répondent aux besoins de vos utilisateurs, vous saurez collaborer avec d'autres Développeurs, Designers et Product Managers avec le bon workflow et les bonnes pratiques.", language: "HTML, CSS, JavaScript, Ruby, Ruby on Rails, SQL, Git, GitHub"},
  {trainingID: 11, description: "Ce programme “socle” vous propose d'acquérir les fondements du développement web avec un focus particulier donné sur JavaScript. L’occasion de se positionner très tôt dans votre parcours de formation sur une techno très appréciée sur le marché pour sa flexibilité et la grande richesse de son écosystème.", language: "HTML, CSS, JavaScript, Node.js, SQL, Git, NoSQL, AJAX"},
  {trainingID: 12, description: "Cette formation vous propose d’approfondir la création d’interface côté client en JavaScript, à l’aide de React.js, la bibliothèque dont la notoriété n’est plus à prouver. Au-delà de la maîtrise de la library, c’est aussi tout l’écosystème autour du langage que l’on va s’approprier : nouvelles spécifications EcmaScript, outils de build, et tout une série de modules indispensables.", language: "JavaScript, React, Redux, React Hooks"},
  {trainingID: 13, description: "Cette formation vous propose d’approfondir la création d’interface côté client en JavaScript, à l’aide de React.js, la bibliothèque dont la notoriété n’est plus à prouver. Au-delà de la maîtrise de la library, c’est aussi tout l’écosystème autour du langage que l’on va s’approprier : nouvelles spécifications EcmaScript, outils de build, et tout une série de modules indispensables.", language: "JavaScript, React, Redux, React Hooks"},
  {trainingID: 14, description: "Les fans de PHP vont adorer cette expédition à travers les fonctionnalités et modules les plus utiles du framework. Pendant cette formation, vous composerez avec toutes les bonnes pratiques de conception web inhérentes au développement avec Symfony 4. Très apprécié par les recruteurs, Symfony est également porté par une des plus grandes communautés PHP.", language: "Symfony 4"},
  {trainingID: 15, description: "Les fans de PHP vont adorer cette expédition à travers les fonctionnalités et modules les plus utiles du framework. Pendant cette formation, vous composerez avec toutes les bonnes pratiques de conception web inhérentes au développement avec Symfony 4. Très apprécié par les recruteurs, Symfony est également porté par une des plus grandes communautés PHP.", language: "Symfony 4"},
  {trainingID: 16, description: "Cette formation vous propose d’approfondir la solution WordPress pour le développement de sites web administrables. On va décortiquer la gestion de contenu, et se mesurer aux fonctionnalités avancées de l’outil : la customisation du front avec les thèmes, la customisation du back avec les plugins. Un programme bien complet !", language: "POO PHP, Axios, WP REST API"},
  {trainingID: 17, description: "Cette formation vous propose d’approfondir la solution WordPress pour le développement de sites web administrables. On va décortiquer la gestion de contenu, et se mesurer aux fonctionnalités avancées de l’outil : la customisation du front avec les thèmes, la customisation du back avec les plugins. Un programme bien complet !", language: "POO PHP, Axios, WP REST API"},
  {trainingID: 18, description: "Entrez de plain pied dans la problématique qui va nous occuper pendant les prochaines décennies : la data ! Ou ce que l’on appelle plus simplement la gestion de données. Vous serez formés sur les outils vous permettant d’extraire, traiter et interpréter de la data. Une compétence technique transverse que vous serez en mesure d’appliquer sur plusieurs facettes d’un projet web.", language: "Express.js, Hapi.js, NoSQL, GraphQL, Machine Learning, Big Data"},
  {trainingID: 19, description: "Entrez de plain pied dans la problématique qui va nous occuper pendant les prochaines décennies : la data ! Ou ce que l’on appelle plus simplement la gestion de données. Vous serez formés sur les outils vous permettant d’extraire, traiter et interpréter de la data. Une compétence technique transverse que vous serez en mesure d’appliquer sur plusieurs facettes d’un projet web.", language: "Express.js, Hapi.js, NoSQL, GraphQL, Machine Learning, Big Data"},
  {trainingID: 20, description: "Avec Educatel, vous pouvez apprendre le métier de développeur web tout en préparant le passage de votre titre professionnel, reconnu par l’Etat. Grâce à notre formation DWWM à distance, notre école vous apporte toutes les connaissances requises pour passer l’examen et obtenir votre titre professionnel de développeur web et web mobile.", language: "HTML, CSS, PHP, Javascript, Angular 9,MySQL, Symphony, Python"},
  {trainingID: 21, description: "Devenez développeur web junior en 4 mois en maîtrisant les 5 langages les plus demandés sur le marché du travail", language: "HTML, CSS, PHP, Javascript, SQL"},
  {trainingID: 22, description: "La 3W Academy propose une formation en alternance au métier de Développeur Web permettant de se spécialiser sur les technologies les plus demandées sur le marché : Node.Js et React. Le cœur de ce qui a fait la réussite de la 3W Academy est au rendez-vous : les sessions sont composées de 15 élèves au maximum, une nouvelle session démarrant chaque mois.", language: "Node.Js, React, JavaScript, PHP"},
  {trainingID: 23, description: "Grâce à La Piscine tu seras en mesure de comprendre la technique qui se cache derrière un siteweb. Du code à la base de données en passant par le serveur, le développement d'un siteweb n'aura plus de secret pour toi.", language: "HTML, CSS, Bootstrap, PHP, Symphony, SQL"}
]
# Seed{trainingID: 7, description: "Notre formation Développeur Web est une expérience immersive qui vous fait passer de débutant à Développeur Web en 9 semaines. À la fin de la formation, vous saurez construire des applications web fonctionnelles qui répondent aux besoins de vos utilisateurs, vous saurez collaborer avec d'autres Développeurs, Designers et Product Managers avec le bon workflow et les bonnes pratiques.", language: "HTML, CSS, JavaScript, Ruby, Ruby on Rails, SQL, Git, GitHub"},

7.times do |i|
  School.create(name: school_array[i][:name], website: school_array[i][:website], siret: school_array[i][:siret], campus_nb: school_array[i][:campuses], creation_year: school_array[i][:creation], logo_url: school_array[i][:logo_url])
end

22.times do |i|
  training = Training.create(name: training_array[i][:name], duration: training_array[i][:duration], description: training_array[i][:description], hours_per_day: training_array[i][:hours_per_day], url: training_array[i][:url], mode: training_array[i][:mode], school_id: training_array[i][:schoolID], background_img: training_array[i][:background_img])

  duration = training_array[i][:duration].to_i

  if duration <= 10
    duration = "1-10"
  elsif duration > 10 && duration <= 20
    duration = "11-20"
  elsif duration > 20 && duration <= 30
    duration = "21-30"
  elsif duration > 30 && duration <= 40
    duration = "31-40"
  elsif duration > 41
    duration = "41+"
  end
  training.update(tag_list: [training_array[i][:mode], duration])
end

69.times do |i|
  session = Session.create(start_date: session_array[i][:start_date], end_date: session_array[i][:end_date], location: session_array[i][:location], price: session_array[i][:price], training_id: session_array[i][:trainingID])

  duration = session.training[:duration].to_i
  price = session[:price].to_i

  if duration <= 10
    duration = "1-10"
  elsif duration > 10 && duration <= 20
    duration = "11-20"
  elsif duration > 20 && duration <= 30
    duration = "21-30"
  elsif duration > 30 && duration <= 40
    duration = "31-40"
  elsif duration > 41
    duration = "41+"
  end

  if price <= 1000
    price = "0-1000"
  elsif price > 1000 && price <= 2000
    price = "1001-2000"
  elsif price > 2000 && price <= 3000
    price = "2001-3000"
  elsif price > 3000 && price <= 4000
    price = "3001-4000"
  elsif price > 4000
    price = "4000+"
  end

  session.training.update(tag_list: [session.training[:mode], duration, price])
end

23.times do |i|
  Program.create(description: program_array[i][:description], language: program_array[i][:language], training_id: session_array[i][:trainingID])
end

puts "Seed completed !"
