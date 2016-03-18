require 'rails_helper'

RSpec.describe Collaborator, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :wiki }
  it { is_expected.to belong_to :user }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :wiki_id }
  it { is_expected.to have_db_column :user_id }

  # === Database (Indexes) ===
  

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end