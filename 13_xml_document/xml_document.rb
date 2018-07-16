class XmlDocument

  attr_accessor :indent, :indent_level
  def initialize(indent = false)
    @indent = indent
    @indent_level = 0
  end

  def method_missing(method_name, *args, &block) 
    attributes = args[0] || {}
    tag_string = ""
    tag_string << add_indent
    tag_string << "<#{method_name}"
    attributes.each do |key, value|
      tag_string << " #{key}='#{value}'"
    end

    if block
      tag_string << ">"
      tag_string << "\n" if indent
      increment_indent
      tag_string << yield
      decrement_indent
      tag_string << add_indent
      tag_string << "</#{method_name}>"
      tag_string << "\n" if indent
    else
      tag_string << "/>"
      tag_string << "\n" if indent
    end
    tag_string
  end

  private

  def add_indent
    indent ? ("  " * indent_level) : ""
  end
  
  def increment_indent
    @indent_level += 1
  end

  def decrement_indent
    @indent_level -= 1
  end
end
