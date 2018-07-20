require 'gmail'
require 'dotenv'
require 'csv'

class Mailer
  attr_accessor :array
  def initialize
    @array = []
    #A completer avant de lancer le code
    gmail = Gmail.connect("email", "password")
    send(parse)
  end

  def parse
    CSV.foreach('db/townhalls.csv').map { |col|
       @array << col[1]
     }
     p @array
     return @array
  end

  def send(array)
    #array2 = ["team.thp.rescue@gmail.com"]
    gmail = Gmail.connect("team.thp.rescue@gmail.com"," Thp2018rescue")
    array.each do |x|
    email = gmail.compose do
    to "#{x}"
    subject "thp"
       body "Bonjour,
        Je m'appelle [PRÉNOM], je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection,
        sans restriction géographique. La pédagogie de ntore école est celle du peer-learning,
        où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code.
        Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie
        veut changer le monde avec nous ?
        Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
      end
        gmail.deliver(email)
      end


    gmail.logout
  end
end

Mailer.new
