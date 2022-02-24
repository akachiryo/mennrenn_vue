class Api::V1::TagsController < ApplicationController
  def index
    tags = Tag.all
    render json: tags, each_serializer: TagSerializer, adapter: :json
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy!
    
    tags = Tag.all
    render json: tags, each_serializer: TagSerializer
  end
end
