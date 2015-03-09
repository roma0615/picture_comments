class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def new
  end

  def create
    @comment = Comment.new
    @comment.picture_id = params[:picture_id]
    @comment.user = params[:user]
    @comment.body = params[:body]

    if @comment.save
      redirect_to "/comments/#{ @comment.id }"
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.picture_id = params[:picture_id]
    @comment.user = params[:user]
    @comment.body = params[:body]

    if @comment.save
      redirect_to "/comments/#{ @comment.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy


    redirect_to "/comments"
  end
end
