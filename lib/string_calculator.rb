class StringCalculator
  def add(str)
    return 0 if str.empty?
    total = 0
    negative_nums = []

    sanitized_string =  parse_str(str)
    str_arr = parse_delimiter(sanitized_string)

    str_arr.each do |number|
      num = number.to_i
      next if num > 1000

      if num < 0
        negative_nums << num
        next
      end
      total += num
    end


    if negative_nums.any?
      error = ArgumentError.new("negatives not allowed, number: #{negative_nums.join(',')}")
      raise error
    end

    return total
  end

  def parse_str(str_to_sanitize)
    str_to_sanitize.gsub("\n", "")
  end

  def parse_delimiter(str)
    spec = str[2..] || ""

    delimiter =
      if spec.start_with?("[") && (close = spec.index("]"))
        spec[1...close]
      elsif !spec.empty?
        spec[0]
      else
        delimiter
      end
    str = str.gsub(%r{\A(?://(?:\[[^\]]+\])+|//.)}, '')
    str.split(Regexp.union(delimiter))
  end

end
