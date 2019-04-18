class Game

  def initialize
    puts
    puts "Nom du joueur 1 ?"
    name_player_1 = gets.chomp
    puts "#{name_player_1}, vous aurez les X comme pion !"
    puts
    value_player_1 = "X"
    @player_1 = Player.new(name_player_1,value_player_1) # Création du joueur 1

    puts "Nom du joueur 2 ?"
    name_player_2 = gets.chomp
    puts "#{name_player_2}, vous aurez les O comme pion !"
    value_player_2 = "O"
    @player_2 = Player.new(name_player_2,value_player_2) # Création du joueur 2

    @players = [@player_1, @player_2] # On met les deux joueurs dans un array pour itérer avec un each après coup.
    @board = Board.new
  end

  def go
    puts "---------------------------------"
    puts" " 
    puts "Voici les cases à indiquer pour placer vos pions :"
    puts ""
    puts "  1 | 2 | 3 "
    puts "-------------"
    puts "  4 | 5 | 6 "
    puts "-------------"
    puts "  7 | 8 | 9 "
    puts ""
    puts "----------------------------------"
    self.turn
  end

  def turn
    
    turns = 0 # On va incrémenter le nombre de tour. Il y a un total de 8 tours dans un jeu de Morpion

    while turns < 9 # On répère le tour des jours jusqu'à ce que personne ne puisse jouer.

      @players.each{ |player| # On itère sur l'array des joueurs créé plus haut.
      @board.display_board # On affiche le board pour que le joueur puisse prendre sa décision.
      puts "------------- Tour n°#{(turns + 1)} -------------"
      puts "#{player.name}, à toi de jouer ! (1 - 9)"
      place = gets.chomp.to_i

        # while @board.est_dispo?(place) == false # Si la place est déjà occupé on relance la demande.
        #   puts                                  # ce while est dans le précédent au cas ou le joueur veut rentrer autre chose qu'un Integer.
        #   puts "La position renseigné est déjà occupée"
        #   puts "Veuillez en choisir une nouvelle"
        #   place = gets.chomp.to_i
        # end
        until place > 0 && place < 10 && @board.est_dispo?(place)

        #while @board.est_dispo?(place) == false # Si la place est déjà occupé on relance la demande.
          puts                                  # ce while est dans le précédent au cas ou le joueur veut rentrer autre chose qu'un Integer.
          puts "Mauvaise case ! Réessaie pour voir"
          place = gets.chomp.to_i
        end

        

      @info_player = [player, player.value_player, place]
      @board.play(@info_player) # le @info_player est l'array que l'on envoie dans la méthode play de la Class Board.

        if @board.victory? # A chaque tour on vérifie si le joueur a gagné
          puts "----------------------------------"
          puts ""
          puts "          #{player.name} a gagné !         "
          puts ""
          puts "----------------------------------"
          break # on sort de la boucle each si c'est le joueur a gagné.
        end

      turns += 1 # On incrémente turns ici

      if turns == 9 # on sort de la boucle each si turns arrive à 9 et on annonce le draw.
        @board.display_board
        puts "---------------------------------"
        puts " " 
        puts "            Ex-aequo !           "
        puts " "
        puts "---------------------------------"
        puts "Voulez vous refaire une partie? (O or N)"
        answer = gets.chomp
        if answer == "O"
          Game.new.go
        else
          puts "Au revoir!"
        end
        break
      end

      }

        if @board.victory? # on vérifie une nouvelle fois si il y a victoire
          @board.display_board
          puts "---------------------------------"
          puts " " 
          puts "            Victoire !           "
          puts " "
          puts "---------------------------------"
          puts "Voulez vous refaire une partie? (O or N)"
          answer = gets.chomp
          if answer == "O"
            Game.new.go
          else
            puts "Au revoir!"
          break
          end # Si c'est le cas on sort de la boucle while
        end

    end

  end

end


