class Plugin
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title,       type: String
  field :description, type: String
  belongs_to :user
  
  validates_presence_of :title, :description, :user
end
