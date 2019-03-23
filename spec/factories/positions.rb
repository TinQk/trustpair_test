# frozen_string_literal: true

FactoryBot.define do
  factory :position do
    emplois { 'EBOUEURS' }
    niveau { 'EBOUEUR' }
    type_de_contrat { 'TEMPS COMPLET' }
    collectivite { 'COMMUNE' }
    annee { '2013' }
    nombre_d_hommes { 0 }
    nombre_de_femmes { 3 }
  end
end
