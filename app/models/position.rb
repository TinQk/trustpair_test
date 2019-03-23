# frozen_string_literal: true

class Position < ApplicationRecord
  validates :emplois, presence: true
  validates :niveau, presence: true
  validates :type_de_contrat, presence: true
  validates :collectivite, presence: true
  validates :annee, presence: true
end
