class CreatePeopleRelated < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.boolean :coordinator
    end
  end
end
