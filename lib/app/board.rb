class Board

  attr_accessor :board

  def initialize
    # On créé les instances des 9 cases avec une valeur par défault étant un espace. On met un espace sinon la valeur qu'il nous balance est Nil.
    @case_1 = BoardCase.new(" ")
    @case_2 = BoardCase.new(" ")
    @case_3 = BoardCase.new(" ")
    @case_4 = BoardCase.new(" ")
    @case_5 = BoardCase.new(" ")
    @case_6 = BoardCase.new(" ")
    @case_7 = BoardCase.new(" ")
    @case_8 = BoardCase.new(" ")
    @case_9 = BoardCase.new(" ")

    # On met toutes les cases créés dans une array pour plus tard savoir la position de chacune des cases.
    @board = [@case_1, @case_2, @case_3, @case_4, @case_5, @case_6, @case_7, @case_8, @case_9]
  end

  def display_board
        # On affiche les valeurs de chaque case en fonction de leur index. Au final on prend la value de BoardCase.new(" ").
    puts 
    puts
    puts "  #{@board[0].value} | #{@board[1].value} | #{@board[2].value} "
    puts "-------------"
    puts "  #{@board[3].value} | #{@board[4].value} | #{@board[5].value} "  
    puts "-------------"
    puts "  #{@board[6].value} | #{@board[7].value} | #{@board[8].value} "
    puts 
    puts

  end

  def play(array)
    # array a cette forme : [x, x.value_player, place]
    k = array[2] # L'index 2 la place entre 1 et 9 que le joueur a indiqué.
    #if board[(k-1)].value = " " # On vérifie si la place indiqué par le joueur est bien vide. Sinon ca saute son tour.
      case
      when array[1] == "X" # On regarde qu'elle est la couleur du pion du jour, ca correspond à l'index 1 de array.
        @board[(k-1)].value = "X" # L'index d'un array commence à 0, donc on soustrait 1 à k pour que ca colle. Et on change la valeur du BoardCase.
      when array[1] == "O"
        @board[(k-1)].value = "O"
      else
      end
    #end
  end

  def est_dispo?(place)
    # Tant que la valeur de la place indiqué n'est pas un espace, on retourne false
    unless @board[(place-1)].value == " "
      return false
    else
      return true
    end
  end

  def victory?
        # Pour qu'un joueur gagne il faut qu'il y est 3 valeurs identiques (X ou O) dans certaines cases.
        # Il ne faut pas que la case soit vide aussi (c'est notre valeur par défaut).
    case
      when @case_1.value == @case_2.value && @case_1.value == @case_3.value && @case_1.value != " " && @case_2.value != " " && @case_3.value != " "
        return true
      when @case_4.value == @case_5.value && @case_4.value == @case_6.value && @case_4.value != " " && @case_5.value != " " && @case_6.value != " "
        return true
      when @case_7.value == @case_8.value && @case_7.value == @case_9.value && @case_7.value != " " && @case_8.value != " " && @case_9.value != " "
        return true
      when @case_1.value == @case_4.value && @case_1.value == @case_7.value && @case_1.value != " " && @case_4.value != " " && @case_7.value != " "
        return true
      when @case_2.value == @case_5.value && @case_2.value == @case_8.value && @case_2.value != " " && @case_5.value != " " && @case_8.value != " "
        return true
      when @case_3.value == @case_6.value && @case_3.value == @case_9.value && @case_3.value != " " && @case_6.value != " " && @case_9.value != " "
        return true
      when @case_1.value == @case_5.value && @case_1.value == @case_9.value && @case_1.value != " " && @case_5.value != " " && @case_9.value != " "
        return true
      when @case_3.value == @case_5.value && @case_3.value == @case_7.value && @case_3.value != " " && @case_5.value != " " && @case_5.value != " "
        return true
      else
        return false
    end

  end

end