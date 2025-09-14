class StringCalculator
  def add(str)
    return 0 if str.empty?
    sanitized_string =  parse_str(str)
    str_arr = parse_delimiter(sanitized_string)
    total = 0
    str_arr.each do |number|
      total += number.to_i
    end
    return total
  end

  def parse_str(str_to_sanitize)
    sanitized_str = str_to_sanitize.gsub("\n", "")
  end

  def parse_delimiter(str)
    delimiter = ","
    if str.start_with?('//')
      delimiter = str[2]
      str = str[3..]
      str.split(delimiter)
    else
      str.split(delimiter)
    end
  end
end
