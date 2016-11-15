class Station

  attr_reader :name, :zone

  def initialize(name = "Liverpool St", zone = 1)
    @name = name
    @zone = zone
  end

end
