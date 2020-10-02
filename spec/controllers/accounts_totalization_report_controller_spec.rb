require 'rails_helper'

describe AccountsTotalizationReportController do
    before(:all) { setup_database }

    it 'should work... TODO' do
        get :index
        expect(assigns(:totalization)).to eq([e])
    end
end

def setup_database
    u1 = Universe.create(name: 'universe1')
    ok = u1.save
    a1 = Account.create(structure: '1', name: 'account1', universe_id: u1.id)
    a101 = Account.create(structure: '1.01', name: 'account101', universe_id: u1.id)
    a102 = Account.create(structure: '1.02', name: 'account102', universe_id: u1.id)
    a2 = Account.create(structure: '2', name: 'account2', universe_id: u1.id)
    a201 = Account.create(structure: '2.01', name: 'account201', universe_id: u1.id)
    c1 = CostCenter.create(structure: '1', name: 'center1', universe_id: u1.id)
    ok |= a1.save && a101.save && a102.save && a2.save && a201.save && c1.save

    e1 = Entry.create(date: Date.today.midnight, value: 1.00, memo: 'a memo', account_id: a101.id, cost_center_id: c1.id, universe_id: u1.id)
    e2 = Entry.create(date: Date.today.midnight, value: 10.00, memo: 'a memo', account_id: a102.id, cost_center_id: c1.id, universe_id: u1.id)
    e3 = Entry.create(date: Date.today.midnight, value: 100.00, memo: 'a memo', account_id: a201.id, cost_center_id: c1.id, universe_id: u1.id)
    ok |= e1.save && e2.save && e3.save
    
    expect(ok).to eq true
end

#expect(response).to render_template("index") #from where did response come?