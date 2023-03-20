require_relative "../chess_champion.rb"

RSpec.describe PlayerCollection do

  describe "find_champions" do
    before {
      players.each do |player|
        Player.create player
      end
    }

    let(:players) { 
      [["Clarinda Botsford", 29, 4271], 
       ["Akiko Miller", 49, 4141], 
       ["Eldridge Olson", 99, 15337], 
       ["Zita Emmerich", 87, 14022], 
       ["Colton Rau", 18, 3252], 
       ["Ona Haag", 26, 4031], 
       ["Gaye Schiller", 95, 5811], 
       ["Shirlene Lemke", 6, 1067], 
       ["Eddie Kassulke", 33, 6017], 
       ["Roselia Schuster", 40, 7307]]
    }

    it "should find the champions" do
      expect(Player.collection.find_champions.flatten.map(&:name)).to eq([
        "Shirlene Lemke",
        "Colton Rau",
        "Ona Haag",
        "Clarinda Botsford",
        "Eddie Kassulke",
        "Roselia Schuster", 
        "Zita Emmerich",
        "Eldridge Olson"
      ])
    end
  end

end
