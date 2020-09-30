require 'rails_helper'

describe Entry do
    subject { Entry.new(
        date: Time.now.midnight,
        value: 100.00,
        memo: 'not required',
        account: Account.new(),
        cost_center: CostCenter.new(),
        universe: Universe.new()
    ) }

    it 'should validate the default entry (subject)' do
        expect(subject.valid?).to be true
    end

    it 'should require the date' do
        subject.date = nil
        expect_invalid_with_key(:date)
    end

    it 'should require the value' do
        subject.value = nil
        expect_invalid_with_key(:value)
    end

    it 'should NOT require the memo' do
        subject.memo = nil
        expect(subject.valid?).to be true
    end

    it 'should require the account' do
        subject.account = nil
        expect_invalid_with_key(:account)
    end

    it 'should require the cost center' do
        subject.cost_center = nil
        expect_invalid_with_key(:cost_center)
    end

    it 'should require the universe... wich is a funny sentence' do
        subject.universe = nil
        expect_invalid_with_key(:universe)
    end

    it 'should accept a negative value' do
        subject.value = -1;
        expect_invalid_with_key(:value);
    end

end

def expect_invalid_with_key(symbol)
    expect(subject.valid?).to be false
    expect(subject.errors.messages.key?(symbol)).to be true
    expect(subject.errors.messages.length).to be 1
end

#is it possible to check the relationship with tags?
#is it worthy to test CRUD?