# mass_mailing

Bonjour, nous sommes l'équipe THP rescue team de Paris.

Voici notre projet du jour.

"Veuillez envoyer un email à toutes les mairies de trois départements de votre choix et de leur dire qu'ils devraient monter un groupe THP dans leur commune".

Finaliser ce projet a nécessité plusieurs étapes de programmation, soit : la récupérations des coordonnées des mairies de 3 départements, l'envoie des mails à ces dernières, et leur suivi sur Twitter.

Veuillez télécharger le dossier,

vous positionner à la racine avec votre terminal,

lancer un bundle install



##### .gitignore

Ce dossier comprends les fichiers dotenv dont seule la liste (sans détail) vous est accessible.

Ces fichiers ont été créés en locale en vue de stocker nos clés d'Apis pour chacune des applications utilisées (Gmails, Twitter etc.).

#### Gemfile

Ce fichier recence tous les Gem qui ont été utilisés pour mener à bien la mission:

ruby gem 2.5.1, nokogiri, open-uri, dotenv, gmail, twitter.

#### **LE DOSSIER LIB**

####*Comprend le dossier App qui inclut chacun des programmes:*

**Le programme townhalls_scrapper.rb**

Permet la création d'un tableau (array) reprenant le nom des villes à partir de la page http://annuaire-des-mairies.com/.

Les Gems utilisés : 'rubygems'/'nokogiri'/'open-uri'

**Le programme townhalls_mailer.rb**

Ce programme permet de récupérer les emails des mairie (cf townhalls_scrapper.rb). Puis à travers l'applicatif Gmail, envoie un texte de présentations de THP aux mairies.

Les Gems utilisés : /'gmail'/ 'dotenv'

**Le programme townhalls_adder_to_db.rb**

A travers une recherche réalisée via l'applicatif Twitter, ce programme incrémente les identifiants des comptes des représentants des communes au sein du fichier créé précedemment.  

Les Gems utilisés : /'twitter'/ 'dotenv'

**Le programme townhalls_follower.rb**

Ce programme permet de récupérer les identifiants précédemment stockés (cf townhalls_scrapper.rb). Puis à travers l'applicatif Twitter, envoie une commande permettant de follow chacun de ces ID.

Les Gems utilisés : 'twitter'/ 'dotenv'
