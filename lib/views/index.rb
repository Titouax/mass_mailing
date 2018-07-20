class Menu


	def choice
		puts "Entrez 1 pour recuperer les emails de trois departements, 2 pour envoyer des mails"
		print ">"
		choice = gets.chomp.to_i

		if choice == 1
			Mailer.new
		if choice == 2
			Scrapper.new
		else
			puts "Mauvais choix"
		end
	end

end
end
