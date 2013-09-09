module Admin
  class CategoriesController < AdminController
    layout "window"

    def index
      @categories = Category.all
    end

    def remove
      @category = Category.find(params[:id])
    end

    def edit
      @category = Category.find(params[:id])
    end

    def destroy
      @category = Category.find(params[:id])
      @category.remove!
      redirect_to admin_categories_path, notice: 'Categoria deletada com sucesso!'
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admin_categories_path, notice: 'Categoria criada com sucesso!'
      else
        render :new
      end
    end

    def update
      @category = Category.find(params[:id])

      if @category.update(category_params)
        redirect_to admin_categories_path, notice: 'Categoria atualizada com sucesso!'
      else
        render :edit, id: @category.id
      end
    end

    private

    def category_params
      params.require(:category).permit(:name)
    end
  end
end