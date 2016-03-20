require 'rails_helper'

RSpec.describe ChargesController, regressor: true do
  # Routes (REST)
  it { should route(:post, '/charges').to('charges#create', {}) }
  it { should route(:get, '/charges/new').to ('charges#new', {}) }

  # Callbacks (Before)
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }

  #Callbacks (After)
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
end