class Paste < ActiveRecord::Base
  validates :title, :presence => true
end
