class AltPassword < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :password, :integer
  end
end
