class CategoriesController < ApplicationController

	PER = 20

	def show
		@category = Category.find(params[:id])

	end
end
