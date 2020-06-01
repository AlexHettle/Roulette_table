def create_table()
  roulette_numbers = Array.new
  roulette_numbers.push 0
  roulette_colors=Array.new
  roulette_colors.push "Green"
  i=1
  until i>36 do
    roulette_numbers.push i
    if i%2==0
      roulette_colors.push "red"
    else
      roulette_colors.push "black"
    end
    i+=1
  end
  return roulette_colors,roulette_numbers
end
def roll(roulette_table)
  spot_rolled=rand(0..36)
  return roulette_table[0][spot_rolled],roulette_table[1][spot_rolled]
end
def bet_on_color(roulette_table,color_picked,money_bet)
  rolled=roll(roulette_table)
  if rolled[0]==color_picked
    print "rolled ",rolled[0]," ",rolled[1]
    print "\nYou won ", money_bet, " dollars\n"
    return money_bet
  else
    print "rolled ",rolled[0]," ",rolled[1]
    print "\nYou lost ", money_bet, " dollars\n"
    return (-1*money_bet)
  end
end
def bet_on_number(roulette_table,num_picked,money_bet)
  rolled=roll(roulette_table)
  if rolled[1]==num_picked
    print "rolled ",rolled[0]," ",rolled[1]
    print "\nYou won ", money_bet*35, " dollars\n"
    return money_bet*35
  else
    print "rolled ",rolled[0]," ",rolled[1]
    print "\nYou lost ", money_bet, " dollars\n"
    return (-1*money_bet)
  end
end
def ask_for_choice()
  x=0
  while x==0
    puts "please enter C to bet on a color and N to bet on a number:"
    choice=gets
    choice ||= ''
    choice=choice.chomp
    if choice=="C"
      return 1
    end
    if choice=="N"
      return 2
    end
    puts "Invalid input."
  end
end
def enter_bet(total_money)
  x=0
  while x==0
    puts "please enter an amount to bet"
    choice=gets
    choice ||= ''
    choice=choice.chomp
    choice=choice.to_f
    if choice>0&&choice<=total_money
      return choice
    end
      puts "invalid entry"
  end
end
def enter_color()
  x=0
  while x==0
    puts "Enter B for black and R for red"
    choice=gets
    choice ||= ''
    choice=choice.chomp
    if choice=="B"
      return 1
    end
    if choice=="R"
      return 2
    end
    puts "Invalid input."
  end
end
def enter_num()
  x=0
  while x==0
    puts "please enter a number on the roulette table (1-36, enter Z for 0)"
    choice=gets
    choice ||= ''
    choice=choice.chomp
    if choice=="Z"
      return 0
    end
    choice=choice.to_i
    if choice>0&&choice<=36
      return choice
    end
    puts "invalid entry"
  end
end
def main()
  the_table=create_table()
  balance=500
  puts "Welcome to the roulette table simulation!"
  puts "You will begin with 500$. See how much you can win!"
  puts "you can keep playing until you lose all your money"
  while balance>0
    print "current balance: ",balance,"\n"
    the_choice=ask_for_choice()
    bet_amount=enter_bet(balance).round(2)
    if the_choice==1
      color_picked=enter_color()
      if color_picked==1
        color_picked="black"
      elsif color_picked==2
        color_picked="red"
      else
        color_picked="green"
      end
      balance+=bet_on_color(the_table,color_picked,bet_amount)
    else
      number_picked=enter_num()
      balance+=bet_on_number(the_table,number_picked,bet_amount)
    end
  end
  puts "Out of money! Exiting program..."
end
main()
