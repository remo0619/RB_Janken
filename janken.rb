jan_judge = true # 勝敗・あいこ判定フラグ

def janken(player_hand, computer_hand) # じゃんけん関数
  hands = ["グー", "チョキ", "パー"]

  puts "--------------------------------------------"
  puts "あなた: #{hands[player_hand]}を出しました。"
  puts "Ruby  : #{hands[computer_hand]}を出しました。"
  puts "--------------------------------------------"

  if player_hand == computer_hand
    return false
  elsif (player_hand == 0 && computer_hand == 1) ||
        (player_hand == 1 && computer_hand == 2) ||
        (player_hand == 2 && computer_hand == 0)
    return true
  else
    return true
  end
end

def hoi(player_direction, computer_direction) # あっちむいてホイ関数
  direction = ["上", "下", "左", "右"]

  puts "--------------------------------------------"
  puts "あなた: #{direction[player_direction]}"
  puts "Ruby  : #{direction[computer_direction]}"
  puts "--------------------------------------------"
end

loop do
  if jan_judge == true
    puts "じゃんけん..."
  else
    puts "あいこで..."
  end

  puts "0(グー) 1(チョキ) 2(パー) 3(棄権)"

  computer_hand = rand(0..2)
  player_hand = gets.to_i

  case player_hand
  when 0, 1, 2
    if jan_judge == true
      puts "ポン！"
    else
      puts "ショ！"
    end

    jan_judge = janken(player_hand, computer_hand)

    if jan_judge == true
      puts "あっちむいて〜"
      computer_direction = rand(0..3)
      player_direction = gets.to_i

      case player_direction
      when 0, 1, 2, 3
        hoi_judge = hoi(player_direction, computer_direction)

      else
        puts "規定の値(0,1,2,3)を入力しなさい"
      end
    end
  when 3
    break
  else
    puts "規定の値(0,1,2,3)を入力しなさい"
  end
end