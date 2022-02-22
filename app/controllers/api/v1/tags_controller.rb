class Api::V1::TagsController < ApplicationController
  def index
    tags = Tag.all
    render json: tags, each_serializer: TagSerializer, adapter: :json
  end
end
