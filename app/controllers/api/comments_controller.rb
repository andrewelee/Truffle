class Api::CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    product = Product.find(comment_params[:product_id])
    comment = product.comments.new(comment_params)
    comment.user_id = current_user.id

    comment.save! unless comment_params[:text].blank?
    render partial: "api/comments/comment.json", locals: { comment: comment }
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:product_id, :text)
  end
end