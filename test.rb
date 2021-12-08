# 勝敗回数を記録
@result = [0, 0]

def battle
    # お互いの手
    cards = ["g", "c", "p"]
    cpu = cards.sample
    puts "じゃんけん（g, c, pから選択してください）"
    hands = {g: "グー", c:"チョキ", p:"パー"}
    user = gets.chomp
    puts "CPU… #{hands[cpu.to_sym]}"
    puts "あなた… #{hands[user.to_sym]}"

    # 勝敗
    if user == cpu
        puts "あいこ"
        return true
    elsif  (user == "グー" && cpu == "チョキ") || (user == "チョキ" && cpu == "パー") || (user == "パー" && cpu == "グー")
        puts "あなたの勝ち"
        @result[0] += 1
        puts "#{@result[0]}勝#{@result[1]}敗"
        return false
    else 
        puts "あなたの負け"
        @result[1] += 1
        puts "#{@result[0]}勝#{@result[1]}敗"
        return false
    end
end

def jyanken
    # あいこ時の繰り返し処理
    while battle do
        battle
    end
end

# ゲームの進行と結果表示
puts "何本勝負？(数字を入力してください 1 or 3 or 5)"
num = gets.chomp
case num
when "1"
    puts "1本勝負を選びました。"
    1.times do
        puts jyanken
    end
    if @result[0] >= 1
        puts "結果 #{@result[0]}勝#{@result[1]}であなたの勝ち"
    else
        puts "結果 #{@result[0]}勝#{@result[1]}であなたの負け"
    end
when "3"
    puts "3本勝負を選びました。"
    3.times do
        puts jyanken
    end
    if @result[0] >= 2
        puts "結果 #{@result[0]}勝#{@result[1]}であなたの勝ち"
    else
        puts "結果 #{@result[0]}勝#{@result[1]}であなたの負け"
    end
    
when "5"
    puts "5本勝負を選びました。"
    5.times do
        puts jyanken
    end
    if @result[0] >= 3
        puts "結果 #{@result[0]}勝#{@result[1]}であなたの勝ち"
    else
        puts "結果 #{@result[0]}勝#{@result[1]}であなたの負け"
    end
else
    puts "回数は1, 3, 5の中から選んでください。"
end