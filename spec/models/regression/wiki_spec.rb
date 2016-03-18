require 'rails_helper'

RSpec.describe Wiki, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :user }
  
  it { is_expected.to have_many :collaborators }
  it { is_expected.to have_many :users }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :body }
  it { is_expected.to have_db_column :private }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["user_id"] }
  it { is_expected.to have_db_index ["id"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end