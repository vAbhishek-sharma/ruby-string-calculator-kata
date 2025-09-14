require 'rspec'
require "string_calculator"
RSpec.describe StringCalculator do
  subject(:calc) {describe_class.new}
  describe "#add" do
    it 'first test' do
    end

    it "return 0 if empty string" do
      expect(calc.add("")).to eq 0
    end
  end
end
