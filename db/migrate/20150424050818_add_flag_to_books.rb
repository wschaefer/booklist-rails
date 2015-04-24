class AddFlagToBooks < ActiveRecord::Migration
  def change
    add_column :books, :flag, :boolean, default: false
  end
end
