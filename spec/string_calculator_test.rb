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

    it "it splits two strings and return addition of both" do
      expect(calc.add("1,2")).to eq 3
    end
  end
end
