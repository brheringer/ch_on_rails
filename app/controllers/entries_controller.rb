class EntriesController < ApplicationController
    def index
        @entries = Entry.includes(:account, :cost_center, :universe).all().order(date: :desc)
    end

    def new
        @entry = Entry.new
    end

    def create
        @entry = Entry.create(entry_params)
        if @entry.save
            redirect_to @entry
        else
            render 'new'
        end
    end

    def show
        @entry = load_eagerly(params[:id])
    end

    def edit
        @entry = load_eagerly(params[:id])
    end

    def update
        @entry = Entry.find(params[:id])
        if @entry.update(entry_params)
            redirect_to @entry
        else
            render 'edit'
        end
    end

    def destroy
        if Entry.destroy(params[:id])
            render 'index'
        else
            render 'show'
        end
    end

    def load_eagerly(id)
        entry = Entry.includes(:account, :cost_center, :universe).find(id)
        return entry
    end

    def entry_params
        params.require(@entry).permit(:date, :value, :memo, :account_id, :cost_center_id, :universe_id)
    end
end
