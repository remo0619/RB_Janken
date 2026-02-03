jan_judge = "" # じゃんけん判定フラグ
hoi_judge = "" # あっちむいてホイ判定フラグ

def janken(player_hand, computer_hand) # じゃんけん関数
  hands = ["グー", "チョキ", "パー"]

  puts "--------------------------------------------"
  puts "あなた: #{hands[player_hand]}を出しました。"
  puts "Ruby  : #{hands[computer_hand]}を出しました。"
  puts "--------------------------------------------"

  if player_hand == computer_hand
    return "あいこ"
  elsif (player_hand == 0 && computer_hand == 1) ||
        (player_hand == 1 && computer_hand == 2) ||
        (player_hand == 2 && computer_hand == 0)
    return "勝ち"
  else
    return "負け"
  end
end

def hoi(player_direction, computer_direction) # あっちむいてホイ関数
  direction = ["上", "下", "左", "右"]

  puts "--------------------------------------------"
  puts "あなた: #{direction[player_direction]}"
  puts "Ruby  : #{direction[computer_direction]}"
  puts "--------------------------------------------"

  if player_direction == computer_direction
    return "勝負あり"
  else
    return ""
  end
end

loop do
  if !(jan_judge == "あいこ")
    puts "じゃんけん..."
  else
    puts "あいこで..."
  end

  puts "0(グー) 1(チョキ) 2(パー) 3(棄権)"

  computer_hand = rand(0..2)
  player_hand = gets.to_i

  case player_hand
  when 0, 1, 2
    if !(jan_judge == "あいこ")
      puts "ポン！"
    else
      puts "ショ！"
    end

    jan_judge = janken(player_hand, computer_hand)

    if jan_judge == "勝ち" || jan_judge == "負け"
      puts "あっちむいて〜"
      puts "0(上) 1(下) 2(左) 3(右)"
      computer_direction = rand(0..3)
      player_direction = gets.to_i

      case player_direction
      when 0, 1, 2, 3
        hoi_judge = hoi(player_direction, computer_direction)
        if hoi_judge == "勝負あり" && jan_judge == "勝ち"
          puts "あなたの勝ちです！"
          break
        elsif hoi_judge == "勝負あり" && jan_judge == "負け"
          puts "あなたの負けです！"
          break
        end
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