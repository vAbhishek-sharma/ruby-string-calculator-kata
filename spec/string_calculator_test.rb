require 'rspec'
require "string_calculator"
RSpec.describe StringCalculator do
  subject(:calc) {described_class.new}
  describe "#add" do
    it 'first test' do
    end

    it "return 0 if empty string" do
      expect(calc.add("")).to eq 0
    end

    it "returns splits two strings and return addition of both" do
      expect(calc.add("1,2")).to eq 3
      expect(calc.add("1,3")).to eq 4
      expect(calc.add("7,4")).to eq 11
    end

    it "return the number itself if the number itself" do
      expect(calc.add("1")).to eq 1
      expect(calc.add("13")).to eq 13
      expect(calc.add("22")).to eq 22
    end

    it "return the total even if the number newline char is in the string" do
      expect(calc.add("\n1,22")).to eq 23
      expect(calc.add("1\n,\n5,22")).to eq 28
    end

    it "return exception with number if the number is negative" do
      expect { calc.add("1\n,\n5,-22") }.to raise_error(ArgumentError, "negatives not allowed, number: -22")

    end
  end

  describe "#parse_str" do
    it "first test" do
    end

    it "returns the input string and return sanitized string" do
      expect(calc.parse_str("\n1,22")).to eq "1,22"
      expect(calc.parse_str("1\n,\n5,22")).to eq "1,5,22"
      expect(calc.parse_str("1\n,\n5,\n22\n")).to eq "1,5,22"
    end
  end

  describe "#parse_delimiter" do
    it "returns parsed arrays with custom delimiter when start of the string contains with pattner //[delimiter] has been passed based on delimiter value" do
      expect(calc.parse_delimiter("//;1;22")).to eq ["1","22"]
      expect(calc.parse_delimiter("//|1|22")).to eq ["1","22"]
      expect(calc.parse_delimiter("//]1]22]22")).to eq ["1","22","22"]
      expect(calc.parse_delimiter("///1/22/23")).to eq ["1","22", "23"]
    end
  end


end
