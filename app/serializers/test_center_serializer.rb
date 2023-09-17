class TestCenterSerializer < ActiveModel::Serializer
  attributes :id,:name,:hospital_id,:location,:image
  def image 
    object.image.url
  end
end
