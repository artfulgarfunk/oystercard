require 'station.rb'
require 'oyster_card.rb'

describe Journey do
  let (:entry_station) {double :aldgate}
  let (:exit_station) {double :victoria}


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
        subject.start(:entry_station)
        subject.finish(:exit_station)
        expect(subject.fare).to eq Journey::MIN_FARE
      end

      it "returns the penalty fare (6) if there was no exit station" do
        subject.start(:entry_station)
        expect(subject.fare).to eq Journey::PENALTY
      end

      it "returns the penalty fare (6) if there was no entry station" do
        subject.finish(:exit_station)
        expect(subject.fare).to eq Journey::PENALTY
      end

    end

    describe "#complete?" do

      it "returns journey as complete if touched in and touched out" do
        subject.start(:entry_station)
        subject.finish(:exit_station)
        expect(subject).to be_complete
      end

      it "returns journey as not complete if neither touched in nor touched out" do
        subject.start(:entry_station)
        expect(subject).not_to be_complete
      end

    end


end
