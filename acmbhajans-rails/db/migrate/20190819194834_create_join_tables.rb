class CreateJoinTables < ActiveRecord::Migration[5.1]
  def change
    create_table :people_ready_list, id: false do |t|
      t.bigint :people_id
      t.bigint :ready_list_id
    end

    # these are all People x Rendition join tables
    # lead - group of people
    create_table :lead_rendition, id: false do |t|
      t.bigint :lead_id
      t.bigint :rendition_as_lead_id
    end

    # backup - ''
    create_table :backup_rendition, id: false do |t|
      t.bigint :backup_id
      t.bigint :rendition_as_backup_id
    end

    # instrumentalists
    create_table :instrumentalist_rendition, id: false do |t|
      t.bigint :instrumentalist_id
      t.bigint :rendition_as_instrumentalist_id
    end

    # sound system 
    create_table :soundsystem_rendition, id: false do |t|
      t.bigint :soundsystem_id
      t.bigint :rendition_as_soundsystem_id
    end
  end
end
