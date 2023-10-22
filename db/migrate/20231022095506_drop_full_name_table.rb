class DropFullNameTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :full_names
  end
end
