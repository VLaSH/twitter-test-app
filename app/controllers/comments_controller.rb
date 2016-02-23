class CommentsController < ApplicationController
  before_action :require_user
  expose(:comment, attributes: :comment_attributes)

  def index
    @comments = Comment.where(
      tweet_id: params[:tweet_id]
    ).order('created_at desc').page(params[:page])
  end

  def create
    render status: :unprocessable_entity unless comment.save
  end

  def update
    return render status: :unprocessable_entity unless comment.save

    respond_with_bip(comment)
  end

  def destroy
    comment.destroy
  end

  private

  def comment_attributes
    params.require(:comment).permit(:body, :user_id, :tweet_id)
  end
end
