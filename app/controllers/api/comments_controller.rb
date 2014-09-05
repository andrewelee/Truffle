class Api::CommentsController < ApplicationController

  def create
    product = Product.find(comment_params[:product_id])
    comment = product.comments.new(comment_params)
    comment.user_id = current_user.id

    comment.save! unless comment_params[:text].blank?
    redirect_to product_url(product)
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    redirect_to product_url(comment.product_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:product_id, :text)
  end
end