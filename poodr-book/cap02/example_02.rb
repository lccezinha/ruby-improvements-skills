# Evitar estruturas de dados escondidas

# Errado
class ObscuringReferences
  attr_reader :data
  def initialize(data)
    @data = data
  end
  def diameters
    data.collect do |cell|
      cell[0] + (cell[1] * 2)
    end
  end
end

ObscuringReferences.new([[622, 20], [622, 23], [559, 30], [559, 40]])

# Correto
class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @data = wheelify(data)
  end
  def diameters
    wheels.collect do |wheel|
      wheel.rim + (wheel.tire * 2)
    end
  end

  private

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect do |cell|
      Wheel.new(cell[0], cell[1])
    end
  end
end