class AddManualToNames < ActiveRecord::Migration[6.0]
  def change
    add_column :names, :manual, :integer
  end
end
