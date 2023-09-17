class HospitalSerializer < ActiveModel::Serializer
  attributes :id,:name,:location,:user_id,:image
  def image 
    object.image.url
  end
end
