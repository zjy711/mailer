require "rails_helper"

RSpec.describe "routes for Emails", :type => :routing do
  it "routes /email to the emails controller" do
    expect(post("/email")).to route_to("emails#email")
  end
end