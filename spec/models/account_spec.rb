require 'rails_helper'

describe Account do
    subject { Account.new(structure: "1.01", name: "account 1", universe: Universe.new) }

    it "should validate the default account (subject)" do
        expect(subject.valid?).to be true
    end

    it "should require structure" do
        subject.structure = ""
        expect_invalid_with_key(:structure)
    end

    it "should require name" do
        subject.name = ""
        expect_invalid_with_key(:name)
    end

    it "should require universe" do
        subject.universe = nil
        expect_invalid_with_key(:universe)
    end

    it "should limit structure length" do
        subject.structure = "1" * 256
        expect_invalid_with_key(:structure)
    end

    it "should limit name length" do
        subject.name = "1" * 256
        expect_invalid_with_key(:name)
    end

    it "should not accept structure with letters" do
        subject.structure = "x.x"
        expect_invalid_with_key(:structure)
    end

    def expect_invalid_with_key(symbol)
        expect(subject.valid?).to be false
        expect(subject.errors.messages.key?(symbol)).to be true
        expect(subject.errors.messages.length).to be 1
    end

    it 'should concatenate structure and name' do
        expect(subject.structure_and_name).to eq '1.01 account 1'
    end
end

#todo use factory_bot
#todo agrupar por required fields, lengths, others