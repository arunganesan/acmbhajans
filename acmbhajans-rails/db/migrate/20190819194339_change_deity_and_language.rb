class ChangeDeityAndLanguage < ActiveRecord::Migration[5.1]
  def change
    change_column :bhajans, :deity, :reference
    change_column :bhajans, :language, :reference
  end
end
