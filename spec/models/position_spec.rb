# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Position, type: :model do
  subject do
    build(:position)
  end

  describe 'it is creatable' do
    let(:position) { create(:position) }

    it { expect(position.id).not_to be_nil }
    it { expect(position.emplois).not_to be_nil }
    it { expect(position.niveau).not_to be_nil }
    it { expect(position.specialite).not_to be_nil }
    it { expect(position.type_de_contrat).not_to be_nil }
    it { expect(position.collectivite).not_to be_nil }
    it { expect(position.annee).not_to be_nil }
    it { expect(position.nombre_d_hommes).not_to be_nil }
    it { expect(position.nombre_de_femmes).not_to be_nil }
  end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:emplois).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:niveau).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:type_de_contrat).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:collectivite).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:annee).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:nombre_d_hommes).of_type(:integer) }
    it { is_expected.to have_db_column(:nombre_de_femmes).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:emplois) }
    it { is_expected.to validate_presence_of(:niveau) }
    it { is_expected.to validate_presence_of(:type_de_contrat) }
    it { is_expected.to validate_presence_of(:collectivite) }
    it { is_expected.to validate_presence_of(:annee) }
  end
end
