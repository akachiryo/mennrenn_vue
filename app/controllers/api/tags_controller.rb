class Api::TagsController < ApplicationController
  def index
    def index
      tags = Tag.all
      render json: tags, each_serializer: TagSerializer
    end
  end
end
