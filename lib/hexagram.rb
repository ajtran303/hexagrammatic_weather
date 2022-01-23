class Hexagram
  attr_reader :number, :name, :unicode

  def initialize(attributes)
    @number = attributes["number"]
    @name = attributes["name"]
    @unicode = attributes["unicode"]
  end
end
