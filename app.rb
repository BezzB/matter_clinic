class MorseCode
    MORSE_CODE = {
    ".-" => "A", "-..." => "B", "-.-." => "C", "-.." => "D", "." => "E",
    "..-." => "F", "--." => "G", "...." => "H", ".." => "I", ".---" => "J",
    "-.-" => "K", ".-.." => "L", "--" => "M", "-." => "N", "---" => "O",
    ".--." => "P", "--.-" => "Q", ".-." => "R", "..." => "S", "-" => "T",
    "..-" => "U", "...-" => "V", ".--" => "W", "-..-" => "X", "-.--" => "Y",
    "--.." => "Z", "-----" => "0", ".----" => "1", "..---" => "2", "...--" => "3",
    "....-" => "4", "....." => "5", "-...." => "6", "--..." => "7", "---.." => "8",
    "----." => "9"
  }
  def decode_char(morse_code)
    MORSE_CODE[morse_code]
  end
  def decode_word(morse_word)
    return morse_word.split(" ").map { |char| decode_char(char) }.join
  end
  def decode_msg(morse_msg)
   return morse_msg.split("   ").map {|word| decode_char(word) }.join(" ")
  end
end

# Create an instance of the MorseCode class
morse_code_decoder = MorseCode.new()

# Decode the message from the old bottle
message_in_bottle = "-- -.--   -. .- -- ."
decoded_message = morse_code_decoder.decode_msg(message_in_bottle)
puts decoded_message