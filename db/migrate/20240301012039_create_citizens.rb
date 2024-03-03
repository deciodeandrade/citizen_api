class CreateCitizens < ActiveRecord::Migration[7.0]
  def change
    create_table :citizens do |t|
      t.string :full_name
      t.string :cpf
      t.string :cns
      t.string :email
      t.date :birth_date
      t.string :phone
      t.string :status, default: 'active', null: false

      t.timestamps
    end
  end
end
