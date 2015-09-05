class Card
  attr_reader :value
  attr_accessor :hide

  def initialize(card)
    @value = card
    @hide = true
  end

  def reveal
    @hide = false
  end

  def flip_back
    @hide = true
  end

  def to_s
    if @hide
      ""
    else
      "#{@value}"
    end
  end

  def ==(card)
    if self.value == card.value
      true
    else
      false
    end
  end
end
