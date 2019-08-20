class CreateJoinTables < ActiveRecord::Migration[5.1]
  def change
    create_table :people_ready_list, id: false do |t|
      t.bigint :people_id
      t.bigint :ready_list_id
    end
  end
end
