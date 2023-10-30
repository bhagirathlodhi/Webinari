class ChangeDataTypeTime < ActiveRecord::Migration[7.0]
  def change
    change_column(:workshops, :strat_time, :time)
    change_column(:workshops, :end_time, :time)


  end
end
