# A pattern follows these rules:

# A . in a pattern represents a place that can be filled with a capital letter A-Z
# A # in a pattern represents a place that can be filled with a digit 0-9
# A @ in a pattern represents a place that can be filled with a digit or letter 0 up to Z

class PatternGenerator
  def verify(serial_number, pattern)
    return true if serial_number.empty? && pattern.empty?

    if pattern.slice(0) == '.'
      return false unless serial_number.slice(0).match?(/[A-Z]/)
    elsif pattern.slice(0) == '#'
      return false unless serial_number.slice(0).match?(/[0-9]/)
    elsif pattern.slice(0) == '@'
      return false unless serial_number.slice(0).match?(/[A-Z0-9]/)
    else
      return false
    end

    verify(serial_number.slice(1..-1), pattern.slice(1..-1))
  end

  def generate(value, pattern, serial_number = '', times = 0)
    return serial_number if pattern.empty?

    if pattern.slice(-1) == '.'
      times = value % 26
      char = 'A'
      times.times do char.next! end

      if serial_number.empty?
        serial_number = char
      else
        serial_number.prepend(char)
      end

      generate(value /= 26, pattern.slice(0..-2), serial_number)
    elsif pattern.slice(-1) == '#'
      times = value % 10
      char = '0'
      times.times do char.next! end

      if serial_number.empty?
        serial_number = char
      else
        serial_number.prepend(char)
      end

      generate(value /= 10, pattern.slice(0..-2), serial_number)
    elsif pattern.slice(-1) == '@'
      times = value % 36

      if times <= 9
        char = '0'
        times.times do char.next! end

        if serial_number.empty?
          serial_number = char
        else
          serial_number.prepend(char)
        end
      else
        char = 'A'
        (times - 10).times do char.next! end

        if serial_number.empty?
          serial_number = char
        else
          serial_number.prepend(char)
        end
      end

      generate(value /= 36, pattern.slice(0..-2), serial_number)
    else
      return "Your pattern is invalid, you invalid!"
    end
  end

  def total_available(pattern, variations = 0)
    return variations if pattern.empty?

    variations = 1 if variations.zero?

    if pattern.slice(0) == '.'
      total_available(pattern.slice(1..-1), 26 * variations)
    elsif pattern.slice(0) == '#'
      total_available(pattern.slice(1..-1), 10 * variations)
    elsif pattern.slice(0) == '@'
      total_available(pattern.slice(1..-1), 36 * variations)
    else
      return "Your pattern is invalid, you invalid!"
    end
  end
end
