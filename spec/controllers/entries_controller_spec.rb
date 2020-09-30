require 'rails_helper'

describe EntriesController do
    describe 'GET index' do
        it 'should assign @entries' do
            u = Universe.create(name: 'universe1')
            ok |= u.save()
            a = Account.create(structure: '1', name: 'account1', universe_id: u.id)
            ok |= a.save()
            c = CostCenter.create(structure: '1', name: 'center1', universe_id: u.id)
            ok |= c.save()
            e = Entry.create(date: Date.today.midnight, value: 100.00, memo: 'a memo', account_id: a.id, cost_center_id: c.id, universe_id: u.id)
            ok |= e.save()
            get :index
            expect(ok).to be true
            expect(assigns(:entries)).to eq([e])
        end

        it "renders the index template" do
            get :index
            expect(response).to render_template("index") #from where did response come?
        end
    end

    #TODO refactor entry creation (factory_bot?)
    #TODO create
    #TODO show
    #TODO edit
    #TODO update
    #TODO destroy
end

#expect(assigns(:widget)).to be_a_new(Widget)
#expect(response).to render_template(:new)
#expect(response).to redirect_to(location)
#expect(response).to have_http_status(:created)