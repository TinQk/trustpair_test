# frozen_string_literal: true

class AddUniqueConstraints < ActiveRecord::Migration[5.2]
  def change
    add_index(:positions, %i[emplois niveau specialite type_de_contrat collectivite annee], name: 'index', unique: true)
  end
end
