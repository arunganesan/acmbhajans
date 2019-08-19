class ChangeDeityAndLanguageAgain < ActiveRecord::Migration[5.1]
  def change
      remove_column :bhajans, :deity
      remove_column :bhajans, :language
      
      add_reference :bhajans, :deity, foreign_key: true
      add_reference :bhajans, :language, foreign_key: true
  end
end
