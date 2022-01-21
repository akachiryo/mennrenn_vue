class UserSerializer < ActiveModel::Serializer

  include Rails.application.routes.url_helpers
  attributes :id, 
             :name,
             :email,
             :introduction,
             :avatar_url

  def avatar_url
    if object.avatar.attached?
      url_for(object.avatar)
    else
    'https://placehold.jp/300x300.png'
    end
  end
end
