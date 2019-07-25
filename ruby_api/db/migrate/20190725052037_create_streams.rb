class CreateStreams < ActiveRecord::Migration[5.2]
  def change
    create_table :streams do |t|
      t.string :title
      t.text :description
      t.string :userId

      t.timestamps
    end
  end
end
