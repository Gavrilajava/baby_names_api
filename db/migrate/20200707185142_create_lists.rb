class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :alphanumeric

      t.timestamps
    end
  end
end
