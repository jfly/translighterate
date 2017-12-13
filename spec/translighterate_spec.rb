require 'spec_helper'

RSpec.describe Translighterate do
  it "has a version number" do
    expect(Translighterate::VERSION).not_to be nil
  end

  it "works when no special characters are involved" do
    expect(Translighterate.highlight("Dusseldorf", "duss")).to eq "<mark>Duss</mark>eldorf"
  end

  describe "ignores diacritics" do
    it "ü" do
      expect(Translighterate.highlight("Düsseldorf düsseldorf", "duss")).to eq "<mark>Düss</mark>eldorf <mark>düss</mark>eldorf"
    end

    it "ę" do
      expect(Translighterate.highlight("pędzić", "pedzic")).to eq "<mark>pędzić</mark>"
    end

    it "ș" do
      expect(Translighterate.highlight("Chișinău", "isi")).to eq "Ch<mark>iși</mark>nău"
    end

    it "ł" do
      expect(Translighterate.highlight("Jonatan Kłosko", "klo")).to eq "Jonatan <mark>Kło</mark>sko"
    end
  end

  it "preserves special characters" do
    expect(Translighterate.highlight("Yu Nakajima (中島悠)", "yu")).to eq "<mark>Yu</mark> Nakajima (中島悠)"
    expect(Translighterate.highlight("zasięg", "something else")).to eq "zasięg"
  end

  it "matches special characters" do
    expect(Translighterate.highlight("Yu Nakajima (中島悠)", "中")).to eq "Yu Nakajima (<mark>中</mark>島悠)"
  end

  it "handles characters whose kd normalization form is multiple spacing marks" do
    expect(Translighterate.highlight("이 wins", "wins")).to eq "이 <mark>wins</mark>"
  end

  context "when a regexp is given" do
    it "highlights everything matching it" do
      expect(Translighterate.highlight("Yu Nakajima (中島悠)", /(中|(y.))/i)).to eq "<mark>Yu</mark> Nakajima (<mark>中</mark>島悠)"
    end
  end

  context "when multiple phrases are given" do
    it "highlights all of them" do
      expect(Translighterate.highlight("Yu Nakajima (中島悠)", ["中", "yu"])).to eq "<mark>Yu</mark> Nakajima (<mark>中</mark>島悠)"
    end

    it "handles strings mixed with regexps" do
      expect(Translighterate.highlight("Yu Nakajima (中島悠)", ["中", /Na.+ima/])).to eq "Yu <mark>Nakajima</mark> (<mark>中</mark>島悠)"
    end
  end
end
