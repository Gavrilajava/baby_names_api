class AddCrossedToNames < ActiveRecord::Migration[6.0]
  def change
    add_column :names, :crossed, :boolean, default: false
  end
end
