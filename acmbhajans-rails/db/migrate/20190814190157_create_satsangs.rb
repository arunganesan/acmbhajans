class CreateSatsangs < ActiveRecord::Migration[5.1]
  def change
    create_table :satsangs do |t|
      t.boolean :asked
      t.boolean :will_attend_practice
      t.boolean :will_attend_satsang
      t.references :practice_request, foreign_key: true
      t.references :satsang_request, foreign_key: true
      t.boolean :attended_practice
      t.boolean :attended_satsang
      t.references :practice_bhajan, foreign_key: true
      t.references :satsang_bhajan, foreign_key: true

      t.timestamps
    end
  end
end
