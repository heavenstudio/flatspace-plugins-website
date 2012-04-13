class Plugin
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title,       type: String
  field :description, type: String
  
  validates_presence_of :title, :description
end
