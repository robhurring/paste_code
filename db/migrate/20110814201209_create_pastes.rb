class CreatePastes < ActiveRecord::Migration
  def change
    create_table :pastes do |t|
      t.string :title
      t.boolean :public
      t.string :language
      t.text :code

      t.timestamps
    end
  end
end
