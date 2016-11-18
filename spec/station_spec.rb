require './lib/station.rb'

describe Station do

let(:hammersmith) { described_class.new("Hammersmith", "Zone 2")}


  it "will be able to show the station name" do
    expect(hammersmith.name).to eq("Hammersmith")
  end

  it "will be able to show the station's zone" do
    expect(hammersmith.zone).to eq("Zone 2")
  end


end
