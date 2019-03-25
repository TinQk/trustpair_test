# frozen_string_literal: true

class Position < ApplicationRecord
  validates :emplois, presence: true
  validates :niveau, presence: true
  validates :type_de_contrat, presence: true
  validates :collectivite, presence: true
  validates :annee, presence: true
  validates_uniqueness_of :annee, scope: [:emplois, :niveau, :specialite, :type_de_contrat, :collectivite]

  def self.import_csv(csv)
    positions = []
    CSV.foreach(csv.path, headers: true, col_sep: ";", ) do |row|
      # header downcase and convert "é" to "e" to match db
      h = row.to_h.deep_transform_keys { |key| key.parameterize.underscore.unicode_normalize(:nfkd).encode('ASCII', replace: '') }

      # key = h.values(attr)
      # add nb hommes and femmes to h from api_hash h.merge!(h2)

      positions << Position.new(h)
    end
    # gem 'activerecord-import'
    Position.import(positions, validate_uniqueness: true)
    #Position.import(positions, on_duplicate_key_ignore: true)
  end

  def self.get_api_data(csv)
    # Get an n elements array of all "emplois" from csv, without duplicate
    emplois = []
    CSV.foreach(csv, headers: true, col_sep: ";", ) do |row|
      emplois << row.to_h.values_at("Emplois")
    end
    emplois = emplois.uniq
    puts emplois

    # Make n requests to api and store them in an hash api_hash with one key by position
    api_hash = {} # {key1 => {"nombre_d_hommes" => 1; "nombre_de_femmes" => 2}, key2 => {"nombre_d_hommes" => 5; "nombre_de_femmes" => 3}}
    emplois.each do |emploi|
      puts "trying to fetch"
      puts emploi[0]
      puts emploi[0].class
      # HTTP query to get a JSON (many positions in one "emploi")
      response = HTTParty.get("https://opendata.paris.fr/api/records/1.0/search/?dataset=bilan-social-effectifs-non-titulaires-permanents&facet=annee&facet=collectivite&facet=type_de_contrat&facet=emplois&facet=niveau&refine.emplois=TECHNICIENS SUPERIEURS D'ADMINISTRATIONS PARISIENNES", format: :plain)
      #{I18n.transliterate(emploi[0])}
      # Convert JSON to hash
      puts "fetched"
      puts response
      puts response.class
      hash = JSON.parse response, symbolize_names: true
      hash.dig(:records).each do |pos_hash|
        key = pos_hash.dig(:fields, :emplois) + pos_hash.dig(:fields, :niveau) + pos_hash.dig(:fields, :specialite) + pos_hash.dig(:fields, :type_de_contrat) + pos_hash.dig(:fields, :collectivite) + pos_hash.dig(:fields, :annee)
        nb_hommes = pos_hash.dig(:fields, :nombre_d_hommes)
        nb_femmes = pos_hash.dig(:fields, :nombre_de_femmes)
        api_hash[key] = {"nombre_d_hommes" => nb_hommes, "nombre_de_femmes" => nb_femmes}
      end
    end
    puts api_hash
  end
end
