require 'rails_helper'

describe Account do
    subject { Account.new(structure: "1.01", name: "account 1", universe: Universe.new) }

    it "should validate the default account (subject)" do
        expect(subject.valid?).to be true
    end

    it "should require structure" do
        subject.structure = ""
        expect(subject.valid?).to be false
    end

    it "should require name" do
        subject.name = ""
        expect(subject.valid?).to be false
    end

    it "should require universe" do
        subject.universe = nil
        expect(subject.valid?).to be false
        expect(subject.errors.messages.key?(:universe)).to be true
        expect(subject.errors.messages.length).to be 1
    end

    it "should limit structure length" do
        subject.structure = "1" * 256
        expect(subject.valid?).to be false
        expect(subject.errors.messages.key?(:structure)).to be true
        expect(subject.errors.messages.length).to be 1
    end

    it "should limit name length" do
        subject.name = "1" * 256
        expect(subject.valid?).to be false
        expect(subject.errors.messages.key?(:name)).to be true
        expect(subject.errors.messages.length).to be 1
    end

    it "should not accept structure with letters" do
        subject.structure = "x.x"
        expect(subject.valid?).to be false
        expect(subject.errors.messages.key?(:structure)).to be true
        expect(subject.errors.messages.length).to be 1
    end

end

#todo use factory_bot
#todo agrupar por required fields, lengths, others
#todo refactor (DRY)