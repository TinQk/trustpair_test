# frozen_string_literal: true

class Position < ApplicationRecord
  validates :emplois, presence: true
  validates :niveau, presence: true
  validates :type_de_contrat, presence: true
  validates :collectivite, presence: true
  validates :annee, presence: true

  def self.import_csv(csv)
    positions = []
    CSV.foreach(csv, headers: true, col_sep: ";") do |row|
      # header downcase and convert "é" to "e" to match db
      h = row.to_h.deep_transform_keys { |key| key.downcase.unicode_normalize(:nfkd).encode('ASCII', replace: '') }
      positions << Position.new(h)
    end
    # gem 'activerecord-import'
    Position.import(positions, on_duplicate_key_ignore: true)
  end
end
