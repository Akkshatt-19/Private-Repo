class AppointmentSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:hospital_id,:test_center_id,:description,:created_at,:status,:image
  def image 
    object.image.url
  end
end
