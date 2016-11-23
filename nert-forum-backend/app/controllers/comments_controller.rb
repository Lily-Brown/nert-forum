class CommentsController < ApplicationController

  def index
    render :json => Comment.all, status: 200
  end

  def create
    comment = Comment.create(comment_params)

    if comment.valid?
      render :json => comment, status: 201
    else
      render :json => {error: "Comment validation failed"}, status: 400
    end
  end

  def show
    comment = Comment.find(params[:id])

    render :json => comment, status: 200
  end

  def edit
    comment = Comment.find(params[:id])

    render :json => comment, status: 200
  end

  def update
    comment = Comment.find(params[:id])

    if comment.update_attributes(comment_params)
      render :json => {success: "Comment updated successfully"}, status: 204
    else
      render :json => {error: "Failed to update Comment"}, status: 400
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      render :json => {success: "Comment deleted successfully"}, status: 204
    else
      render :json => {error: "Comment deletion failed"}, status: 400
    end
  end

  private

  def comment_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:text_body, :user_id, :post_id])
  end

end
