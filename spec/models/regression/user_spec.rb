require 'rails_helper'

RSpec.describe User, regressor: true do

  # === Relations ===
  
  
  it { is_expected.to have_many :wikis }
  it { is_expected.to have_many :collaborators }
  it { is_expected.to have_many :wiki_collaborators }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :encrypted_password }
  it { is_expected.to have_db_column :reset_password_token }
  it { is_expected.to have_db_column :reset_password_sent_at }
  it { is_expected.to have_db_column :remember_created_at }
  it { is_expected.to have_db_column :sign_in_count }
  it { is_expected.to have_db_column :current_sign_in_at }
  it { is_expected.to have_db_column :last_sign_in_at }
  it { is_expected.to have_db_column :current_sign_in_ip }
  it { is_expected.to have_db_column :last_sign_in_ip }
  it { is_expected.to have_db_column :confirmation_token }
  it { is_expected.to have_db_column :confirmed_at }
  it { is_expected.to have_db_column :confirmation_sent_at }
  it { is_expected.to have_db_column :unconfirmed_email }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :role }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["reset_password_token"] }
  it { is_expected.to have_db_index ["id"] }
  it { is_expected.to have_db_index ["email"] }

  # === Validations (Length) ===
  it { is_expected.to allow_value(Faker::Lorem.characters(8)).for :password }
  it { is_expected.not_to allow_value(Faker::Lorem.characters(7)).for :password }
  it { is_expected.to allow_value(Faker::Lorem.characters(72)).for :password }
  it { is_expected.not_to allow_value(Faker::Lorem.characters(73)).for :password }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end