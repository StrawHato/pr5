class RomanConverter
  @@roman_numerals = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  def self.roman_to_int(roman)
    total = 0
    prev_value = 0

    roman.reverse.each_char do |char|
      value = @@roman_numerals[char]

      if !value
        puts "Invalid Roman numeral: #{char}"
        return nil
      end

      if value < prev_value
        total -= value
      else
        total += value
      end

      prev_value = value
    end

    total
  end

  def self.int_to_roman(num)
    if num <= 0 || num >= 4000
      puts "Number out of range (1 <= n < 4000)"
      return nil
    end

    roman_numerals = {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }

    roman_numeral = ""
    roman_numerals.each do |value, numeral|
      while num >= value
        roman_numeral += numeral
        num -= value
      end
    end

    roman_numeral
  end
end

loop do
  puts "Choose an operation (1 - convert a Roman numeral to an integer, 2 - convert an integer to a Roman numeral, 3 - exit):"
  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Enter a Roman numeral:"
    roman_input = gets.chomp
    integer = RomanConverter.roman_to_int(roman_input)
    if integer
      puts "Integer: #{integer}"
    else
      puts "Roman numeral input error."
    end
  when 2
    puts "Enter an integer:"
    num_input = gets.chomp.to_i
    roman = RomanConverter.int_to_roman(num_input)
    if roman
      puts "Roman numeral: #{roman}"
    else
      puts "Integer input error."
    end
  when 3
    puts "End"
    break
  else
    puts "Incorrect choice of operation."
  end
end
