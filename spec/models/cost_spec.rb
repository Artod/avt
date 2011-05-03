require 'spec_helper'

describe Cost do
  # before(:each) do
  # end

  it "should be empty" do
    @prices = Cost.find_minimal_prices(nil, {})
    @prices.should be_empty
  end
end