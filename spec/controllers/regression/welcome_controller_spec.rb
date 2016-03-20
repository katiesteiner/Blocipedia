require 'rails_helper'

RSpec.describe WelcomeController, regressor: true do
  # Routes (REST)
  it { should route(:get, '/').to('welcome#index', {}) }
  it { should route(:get, '/about').to('welcome#about', {}) }

  # Callbacks (Before)
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }

  #Callbacks (After)
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
end
