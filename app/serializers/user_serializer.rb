class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name
  
  def name 
    "SL. #{id}. #{email}" 
  end 

end
