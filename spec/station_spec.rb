require 'station.rb'
require 'oyster_card.rb'

describe Station do
  subject(:station) { described_class.new("Victoria", 1)}

  it "has a zone" do
    expect(subject.zone).to eq 1
   end

  it "has a name" do
    expect(subject.name).to eq "Victoria"
  end
end
