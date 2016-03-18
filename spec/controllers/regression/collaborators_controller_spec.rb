require 'rails_helper'

RSpec.describe CollaboratorsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:post, '/collaborators').to('collaborators#create', {}) } 
  it { should route(:delete, '/collaborators/1').to('collaborators#destroy', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end