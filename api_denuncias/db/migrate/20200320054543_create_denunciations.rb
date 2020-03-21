class CreateDenunciations < ActiveRecord::Migration[6.0]
  def change
    create_table :denunciations do |t|
      t.string :descricao
      t.string :status
      t.string :latitude
      t.string :longitude
      t.references :user, null: false, foreign_key: true
      t.text :medida_adotada

      t.timestamps
    end
  end
end
