class ShowCalc
  def self.calculate(expression)
    expression.gsub!(/\s+/, '') # スペースを削除
    if expression.include?('@')
      num1, num2 = expression.split('@').map(&:to_i)
    else
      return "不正な演算子です"
    end

    return "見せ算の眼: 0 (0は幽霊で、全員が逃げるため眼は0になります)" if num1 == 0 || num2 == 0

    result, reason = if num1 == num2
                       [0, "数字と数字が一緒だった場合は見た目が一緒なので、恥ずかしくなって立ち去るため眼は0になります"]
                     elsif [2, 5].include?(num1) && [2, 5].include?(num2)
                       [1.1, "2と5はデジタルで書くと似ているが実際に書くと流石に違うので、11になってからびっくりしてスマホを落として小数点になり眼は1.1になります"]
                     elsif [9, 6].include?(num1) && [9, 6].include?(num2)
                       [11, "俺か？となってお互い近づいていくので、11になります"]
                     elsif num1.to_s.include?('4') && num2.to_s.include?('4')
                       [11, "両方の数字に4が含まれるため、唐揚げ好き同士で意気投合し、眼は11になります"]
                     elsif (num1.to_f / num2).abs >= 100 || (num2.to_f / num1).abs >= 100
                       smaller, larger = [num1, num2].minmax
                       [larger - smaller * 17, "小さい方はもう逃げられないので、腹を括って、逃げられへんと思って大群に立ち向かってばーって突っ込んでいって頑張って1人あたり17人倒すためです"]
                     else
                       [nil, "関係性未定義です。ここから先は大学で研究しましょう"]
                     end

    if result.nil?
      larger_number = [num1, num2].max
      "見せ算の眼: #{larger_number} (大きい数字の方が強く、小さい数字は怖がって逃げるため眼は#{larger_number}になります)"
    else
      "見せ算の眼: #{result} (#{reason})"
    end
  end
end

def start_showcalc
  loop do
    puts '見せ算を開始しますか？ 0: 終了, 1: 開始'
    choice = gets.chomp
    break if choice == '0'

    if choice == '1'
      puts '見せ算の式を入力してください。'
      input = gets.chomp
      puts ShowCalc.calculate(input)
    else
      puts "無効な入力です。"
    end
  end
end

start_showcalc
