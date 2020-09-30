class CostCentersController < ApplicationController
    def index
        @cost_centers = CostCenter.includes(:universe).order(structure: :asc).all
    end

    def new
        @cost_center = CostCenter.new
    end

    def create
        @cost_center = CostCenter.new(cost_center_params)
        if @cost_center.save
            redirect_to @cost_center
        else
            render 'new'
        end
    end

    def show
        @cost_center = CostCenter.includes(:universe).find(params[:id])
    end

    def edit
        @cost_center = CostCenter.includes(:universe).find(params[:id])
    end

    def update
        @cost_center = CostCenter.find(params[:id])
        if @cost_center.update(cost_center_params)
            redirect_to @cost_center
        else
            render 'update'
        end
    end

    def destroy
        @cost_center = CostCenter.destroy(params[:id])
        #TODO if?
        render 'index'
    end

    private
    def cost_center_params
        params.require(:cost_center).permit(:structure, :name, :universe_id)
    end
end
