require "station"

describe Station do
  subject(:station) {described_class.new}

  it "should have a default name" do
    expect(station.name).to eq "station"
  end

  it "should have a default zone" do
    expect(station.zone).to eq 1
  end

end
