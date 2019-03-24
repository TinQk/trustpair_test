class AddUniqueConstraints < ActiveRecord::Migration[5.2]
  def change
    add_index(:positions, [:emplois, :niveau, :specialite, :type_de_contrat, :collectivite, :annee], name: 'index', unique:true)
  end
end
