class StringCalculator
  def add(str)
    return 0 if str.empty?
    total = 0
    negative_nums = []

    sanitized_string =  parse_str(str)
    str_arr = parse_delimiter(sanitized_string)
    puts str_arr
    str_arr.each do |number|
      num = number.to_i
      next if num > 1000

      if num < 0
        negative_nums << num
        next
      end
      total += num
    end
    puts "total: #{total}"

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
    delimiter = [","]
    if str.start_with?("//")
      spec = str[2..] || ""

      delimiter =
      if spec.start_with?("[")
        spec.scan(/\[([^\]]+)\]/).flatten
      else
        [spec[0]]
      end
    end

    str = str.sub(%r{\A(?://(?:\[[^\]]+\])+|//.)}, '') #Removing the
    str_arr= str.split(Regexp.union(delimiter))
    str_arr
  end

end
