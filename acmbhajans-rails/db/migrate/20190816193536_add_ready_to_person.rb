class AddReadyToPerson < ActiveRecord::Migration[5.1]
  def change
    add_reference :people, :ready, foreign_key: true
  end
end
