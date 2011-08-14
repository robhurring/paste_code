class Paste < ActiveRecord::Base
  validates :title, :code, :presence => true
  validates :language, :presence => true, :inclusion => Languages.map(&:second)
  validates :public, :inclusion => [true, false]
  
  attr_accessible :title, :language, :code
  
  scope :public, where(:public => true)
  scope :private, where(:public => false)
  
  before_create :create_token, :unless => :public?

private

  def create_token
    write_attribute :token, ActiveSupport::SecureRandom.hex(5)
  end
end
