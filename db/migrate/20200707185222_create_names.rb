class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.string :name
      t.integer :list_id

      t.timestamps
    end
  end
end
