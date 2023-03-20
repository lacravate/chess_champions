require 'ffaker'

Player = Struct.new(:name, :age, :elo) do

  def self.collection
    @collection ||= PlayerCollection.new
  end

  def self.create(args)
    collection << new(*args)
  end

  def self.generate(number)
    1.upto(number) do |i|
      age = rand 5..100
      create [FFaker::Name.name, age, rand(age * 200)]
    end
  end

end

class PlayerCollection < Array

  def display_champions
    puts "Found the following champions :"
    beginning = Time.now.to_f
    champs = find_champions
    duration = Time.now.to_f - beginning
    champs.flatten.map {|p| puts p.name + ": elo " + p.elo.to_s + " at the age of " + p.age.to_s }
    puts "\nOut of the following collection :"
    puts Player.collection.sort_by { |p| p.age }
    puts "\nIt took #{duration} seconds to find them"
  end

  def find_champions
    youngest_scorers_in elo_by_age
  end

  private

  def elo_by_age
    each_with_object([]) do |player, by_age|
      if find_elo_in(by_age[player.age]) < player.elo
        by_age[player.age] = [player]
      elsif find_elo_in(by_age[player.age]) == player.elo
        by_age[player.age] << player
      end
    end
  end

  def youngest_scorers_in(ordered_elo)
    ordered_elo.compact.each_with_object([]) do |players, scorers|
      if scorers.empty? || find_elo_in(scorers.last) < find_elo_in(players)
        scorers << players 
      end
    end
  end

  def find_elo_in(player_list)
    # players are stored in arrays with all the same elo
    # so elo is found in elo attribute of the first element, if there is any
    # otherwise nil is gotten, cast to Integer to become 0
    (Array(player_list).first&.elo).to_i
  end

end

if ARGV.any?
  Player.generate ARGV.shift.to_i
  time = Time.now.to_f
  puts Player.collection.display_champions
end

