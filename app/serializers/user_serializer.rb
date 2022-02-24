class UserSerializer < ActiveModel::Serializer

  include Rails.application.routes.url_helpers
  attributes :id, 
             :name,
             :email,
             :introduction,
             :admin,
             :avatar_url

  def avatar_url
    if object.avatar.attached?
      url_for(object.avatar)
    else
    'https://placehold.jp/300x300.png'
    end
  end
  
end
