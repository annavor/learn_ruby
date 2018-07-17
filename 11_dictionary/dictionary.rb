class Dictionary
  attr_accessor :entries

  def initialize
    self.entries = {}
  end

  def add(options)
    options = { options => nil } if options.class == String
    self.entries = entries.merge(options)
  end

  def keywords
    entries.keys.sort
  end

  def include?(string)
    entries.has_key?(string)
  end

  def find(word)
    entries.select { |k,v| k.match(/#{word}/) } || {}
  end

  def printable
    strings = []
    entries.sort.each do |k,v|
      strings << "[#{k}] \"#{v}\""
    end
    strings.join("\n")
  end
end
