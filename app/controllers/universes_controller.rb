class UniversesController < ApplicationController
    def index
        @universes = Universe.all
    end

    def new
        @universe = Universe.new
    end

    def create
        @universe = Universe.new(universe_params)
        if @universe.save
            redirect_to @universe
        else
            render 'new'
        end
    end

    def show
        @universe = Universe.find(params[:id])
    end

    def edit
        @universe = Universe.find(params[:id])
    end

    def update
        @universe = Universe.find(params[:id])
        if @universe.update(universe_params)
            redirect_to @universe
        else
            render 'udpate'
        end
    end

    def destroy
        Universe.destroy(params[:id])
        #TODO if?
        render 'index'
    end

    private
    def universe_params
        params.require(:universe).permit(:name)
    end
end
