class Paste < ActiveRecord::Base
  validates :title, :code, :public, :presence => true
  validates :language, :presence => true, :inclusion => Languages.map(&:second)
  
  attr_accessible :title, :language, :code
end
