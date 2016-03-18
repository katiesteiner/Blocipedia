require 'rails_helper'

RSpec.describe WikisController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/wikis').to('wikis#index', {}) }
  it { should route(:get, '/wikis/1').to('wikis#show', {:id=>"1"}) }
  it { should route(:get, '/wikis/new').to('wikis#new', {}) }
  it { should route(:post, '/wikis').to('wikis#create', {}) } 
  it { should route(:get, '/wikis/1/edit').to('wikis#edit', {:id=>"1"}) }
  it { should route(:patch, '/wikis/1').to('wikis#update', {:id=>"1"}) } 
  it { should route(:delete, '/wikis/1').to('wikis#destroy', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end