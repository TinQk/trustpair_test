class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :emplois, null: false
      t.string :niveau, null: false
      t.string :type_de_contrat, null: false
      t.string :collectivite, null: false
      t.string :annee, null: false
      t.integer :nombre_d_hommes
      t.integer :nombre_de_femmes

      t.timestamps
    end
  end
end
