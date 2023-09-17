class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role, :image
  def image 
    object.image.url
  end  
end
