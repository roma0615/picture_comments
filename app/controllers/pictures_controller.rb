class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find_by(id: params[:id])
    @comments = Comment.where(picture_id: @picture.id)
  end

  def new
  end

  def create
    @picture = Picture.new
    @picture.url = params[:url]
    @picture.caption = params[:caption]

    if @picture.save
      redirect_to "/pictures/#{ @picture.id }"
    else
      render 'new'
    end
  end

  def edit
    @picture = Picture.find_by(id: params[:id])
  end

  def update
    @picture = Picture.find_by(id: params[:id])
    @picture.url = params[:url]
    @picture.caption = params[:caption]

    if @picture.save
      redirect_to "/pictures/#{ @picture.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @picture = Picture.find_by(id: params[:id])
    @picture.destroy


    redirect_to "/pictures"
  end
end
