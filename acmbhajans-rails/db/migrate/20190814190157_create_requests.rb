class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.boolean :will_attend_practice
      t.boolean :will_attend_satsang
      t.boolean :attended_practice
      t.boolean :attended_satsang
      t.date :weekend

      t.references :person, foreign_key: true
      
      t.references :practice_request, foreign_key: {to_table: :bhajans}
      t.references :satsang_request, foreign_key: {to_table: :bhajans}

      t.string :practice_note
      t.string :satsang_note
    end
  end
end
