class CategoriesController < ApplicationController

	PER = 3

	def show
		@category = Category.find(params[:id])
		@reviews = @category.reviews.page(params[:page]).per(PER)

	end
end
