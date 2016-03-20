require 'rails_helper'

RSpec.describe UsersController, regressor: true do
  # Routes (REST)
  it { should route(:post, '/users/1/downgrade').to('users#downgrade', {:user_id=>"1"}) }

  # Callbacks (Before)
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:authenticate_user!) }

  #Callbacks (After)
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
end
