require 'rails_helper'

describe Universe do
    subject { Universe.new(name: "universe 1") }

    it "should validate the default universe (subject)" do
        expect(subject.valid?).to be true
    end

    it "should require name" do
        subject.name = ""
        expect_invalid_with_key(:name)
    end

    it "should limit name length" do
        subject.name = "1" * 256
        expect_invalid_with_key(:name)
    end
end

def expect_invalid_with_key(symbol)
    expect(subject.valid?).to be false
    expect(subject.errors.messages.key?(symbol)).to be true
    expect(subject.errors.messages.length).to be 1
end
#todo use factory_bot