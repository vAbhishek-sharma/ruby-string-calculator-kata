class StringCalculator
  def add(str)
    return 0 if str.empty?
    str_arr =  parse_str(str).split(',')
    total = 0
    str_arr.each do |number|
      total += number.to_i
    end
    return total
  end

  def parse_str(str_to_sanitize)
    str_to_sanitize.gsub("\n", "")
  end
end
