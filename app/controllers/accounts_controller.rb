class AccountsController < ApplicationController
    def index
        @accounts = Account.includes(:universe).order(structure: :asc)
    end

    def new
        @account = Account.new
    end

    def create
        @account = Account.new(account_params)
        if @account.save
            redirect_to @account
        else
            render 'new'
        end
    end

    def show
        @account = Account.includes(:universe).find(params[:id])
    end

    def edit
        @account = Account.includes(:universe).find(params[:id])
    end

    def update
        @account = Account.find(params[:id])
        if @account.update(account_params)
            redirect_to @account
        else
            render 'update'
        end
    end

    def destroy
        @account = Account.destroy(params[:id])
        #TODO if?
        render 'index'
    end

    private
    def account_params
        params.require(:account).permit(:structure, :name, :universe_id)
    end
end
