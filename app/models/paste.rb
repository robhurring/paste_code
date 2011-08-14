class Paste < ActiveRecord::Base
  validates :title, :code, :presence => true
  validates :language, :presence => true, :inclusion => Languages.map(&:second)
  validates :public, :inclusion => [true, false]
  
  attr_accessible :title, :language, :code
end
