require 'station.rb'
require 'oyster_card.rb'

describe Journey do

    it "returns nil by default" do
      expect(subject.entry_station).to eq nil
      expect(subject.exit_station).to eq nil
    end

    describe "#finish" do
      it "accepts an exit_station" do
        subject.finish("victoria")
        expect(subject.exit_station).to eq "victoria"
      end
    end

    describe "#start" do
      it "accepts an entry_station" do
        subject.start("clapham")
        expect(subject.entry_station).to eq "clapham"
      end
    end

    describe "#fare" do
      it "returns the minimum fare by default" do
        expect(subject.fare).to eq Journey::MIN_FARE
      end
    end

    
end
