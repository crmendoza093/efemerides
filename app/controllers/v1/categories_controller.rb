module V1
  class CategoriesController < ApplicationController
    before_action :category, only: %i[show update]

    def show
      render json: @category
    end

    def index
      render json: Category.all
    end

    def create
      @category = Category.new(category_params)
      @category.save!
      render json: @category, status: :created
    end

    def update
      @category.update(category_params)
      @category.event&.archived! if archived?
      @category.save!

      render json: @category
    end

    private

    def category
      @category ||= Category.find(params[:id])
    end

    def category_params
      params.permit(:name, :status)
    end

    def unprocessable_entity
      render json: @category.errors, status: __method__
    end

    def archived?
      params[:status] == 'archived'
    end
  end
end
