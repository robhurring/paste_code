class AddTokenToPastes < ActiveRecord::Migration
  def change
    add_column :pastes, :token, :string, :after => :public
  end
end
