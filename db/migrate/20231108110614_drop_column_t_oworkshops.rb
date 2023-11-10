class DropColumnTOworkshops < ActiveRecord::Migration[7.0]
  def change
    remove_column :workshops, :strat_time
  end
end
