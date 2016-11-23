class PostsController < ApplicationController

   def index
    render :json => Post.all, status: 200
  end

  def create
    post = Post.create(post_params)

    if post.valid?
      render :json => post, status: 201
    else
      render :json => {error: "Post validation failed"}, status: 400
    end
  end

  def show
    post = Post.find(params[:id])

    render :json => post, status: 200
  end

  def edit
    post = Post.find(params[:id])

    render :json => post, status: 200
  end

  def update
    post = Post.find(params[:id])

    if post.update_attributes(post_params)
      render :json => {success: "Post updated successfully"}, status: 204
    else
      render :json => {error: "Failed to update Post"}, status: 400
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      render :json => {success: "Post deleted successfully"}, status: 204
    else
      render :json => {error: "Post deletion failed"}, status: 400
    end
  end

  private

  def post_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: %w(title text-body user))
  end



end
