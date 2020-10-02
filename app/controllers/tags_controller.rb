class TagsController < ApplicationController
    def index
        @tags = Tag.order(name: :asc)
    end

    def new
        @tag = Tag.new
    end

    def create
        @tag = Tag.create(tag_params)
        if @tag.save
            redirect_to @tag
        else
            render 'new'
        end
    end

    def show
        @tag = Tag.find(params[:id])
    end

    def edit
        @tag = Tag.find(params[:id])
    end

    def update
        @tag = Tag.find(params[:id])
        if @tag.update(tag_params)
            redirect_to @tag
        else
            render 'update'
        end
    end

    def destroy
        if Tag.destroy(params[:id])
            render 'index'
        else
            render 'show'
        end
    end

    private
    def tag_params
        params.require(:tag).permit(:id, :name)
    end
end
