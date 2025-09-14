class StringCalculator
  def add(str)
    return 0 if str.empty?
    str_arr =  str.split(',')
    total = 0
    str_arr.each do |number|
      total += number.to_i
    end
    return total
  end

  def parse_str()

  end
end
