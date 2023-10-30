class ToChangeAttType < ActiveRecord::Migration[7.0]
  def change
    change_column(:workshops, :start_time, :time)
  end
end
