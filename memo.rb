require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp
  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl+Dを押します"
  CSV.open("#{file_name}.csv", "w") do |f|
    f << readlines(chomp: true)
  end
elsif memo_type == 2
  puts "読み込むファイル名を拡張子を除いて入力してください"
  file_name = gets.chomp
    CSV.foreach("#{file_name}.csv") do |f|
      puts f
    end
  puts "-----------------------------"
  puts "以上が読み込んだファイルの内容です。"
  puts "以下、読み込んだファイルを編集してください"
  puts "完了したらCtrl+Dを押します"
    CSV.open("#{file_name}.csv", "a") do |f|
      f << readlines(chomp: true)
    end
else
  puts "1または2を入力してください。"
end

