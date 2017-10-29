require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Pets" do
  get "/pets" do
    example "Listing pets" do
      do_request

      status.should == 204
    end
  end
end