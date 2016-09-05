require 'spec_helper'

describe Translighterate do
  it "works" do
    expect(Translighterate.highlight("Dusseldorf", "duss")).to eq "<mark>Duss</mark>eldorf"
  end

  it "ignores umlauts" do
    expect(Translighterate.highlight("Düsseldorf düsseldorf", "duss")).to eq "<mark>Düss</mark>eldorf <mark>düss</mark>eldorf"
  end

  it "preserves special characters" do
    expect(Translighterate.highlight("Yu Nakajima (中島悠)", "yu")).to eq "<mark>Yu</mark> Nakajima (中島悠)"
  end

  it "preserves special characters" do
    expect(Translighterate.highlight("中島悠 (Yu Nakajima)", "yu")).to eq "中島悠 (<mark>Yu</mark> Nakajima)"
  end

  it "matches special characters" do
    expect(Translighterate.highlight("Yu Nakajima (中島悠)", "中")).to eq "Yu Nakajima (<mark>中</mark>島悠)"
  end
end
