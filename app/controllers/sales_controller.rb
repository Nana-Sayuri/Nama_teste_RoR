class SalesController < ApplicationController

  def new
    @sale = Sale.new(sale_params)
  end
    
  def show
  end

  private
  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:buyer, :description, :unity_price, :quantity, :address, :supplier)
  end
end




#rails tutorial comment_controller belongs_to articles

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end