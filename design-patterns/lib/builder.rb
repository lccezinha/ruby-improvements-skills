# Creational Pattern

class BoardBuilder
  def initialize(width, height, difficulty)
    @board            = Board.new
    @board.width      = width
    @board.height     = height
    @board.difficulty = difficulty
    @board.tiles      = []
    @board.monsters   = []
  end

  def add_tiles(type, number)
    message = "create_#{type}_tiles"
    @board.tiles.concat TileFactory.send(message, number)
  end

  def add_monsters(type, number)
    message = "create_#{type}s"
    @board.monsters.concat MonsterFactory.send(message, number)
  end

  def board
    raise 'Invalid' if invalid?
    @board
  end

  private

  def invalid?
    @board.tiles.size + @board.monsters.size < @board.width * @board.height
  end
end

class Board
  attr_accessor :width, :height, :difficulty, :tiles, :monsters
end

class PlainTile; end
class TrapTile; end
class Orc; end
class Goblin; end

class TileFactory
  def self.create_plain_tiles(number)
    tiles = []
    number.times { tiles << PlainTile.new }
    tiles
  end
  def self.create_trap_tiles(number)
    tiles = []
    number.times { tiles << TrapTile.new }
    tiles
  end
end

class MonsterFactory
  def self.create_orcs(number)
    monsters = []
    number.times { monsters << Orc.new }
    monsters
  end
  def self.create_goblins(number)
    monsters = []
    number.times { monsters << Goblin.new }
    monsters
  end
end
