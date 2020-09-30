require 'rails_helper'

describe UniversesController do
    describe 'GET index' do
        it 'should assign @universes' do
            u = Universe.create(name: 'asdf')
            ok = u.save()
            get :index
            expect(ok).to be true
            expect(assigns(:universes)).to eq([u])
        end

        it "renders the index template" do
            get :index
            expect(response).to render_template("index") #from where did response come?
        end
    end

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