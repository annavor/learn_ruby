def translate(str)
  vowels = "aeiou".split("")
  str.split(" ").reduce([]) do |words, word|
    pig_word = word.chars
    if !vowels.include?(word[0])
      n = pig_word.find_index {|x|vowels.include?(x)}
      n += 1 unless pig_word[n-1..n].join("") != "qu"
      pig_word.push(pig_word.shift(n))[1..-1]
    end
    words << pig_word.insert(-1, "ay").join("")
  end.join(" ")
end
