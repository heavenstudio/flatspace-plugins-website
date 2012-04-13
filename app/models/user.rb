class User
  include Mongoid::Document
  field :name,        type: String
  field :facebook_id, type: String
  
  validates_presence_of :name, :facebook_id
  
  def self.find_by_facebook_id(facebook_id)
    where(facebook_id: facebook_id).first
  end
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.facebook_id = auth["uid"]
      user.name        = auth["info"]["name"]
    end
  end
end
