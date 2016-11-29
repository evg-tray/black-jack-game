class Card
  def initialize(face, suit)
    @face = face
    @suit = suit
    @points = points
  end

  def points
    return 11 if @face == 'A'
    return 10 if %w(K Q J).include?(@face)
    @face
  end

  def to_s
    "#{@face} #{@suit}"
  end
end
