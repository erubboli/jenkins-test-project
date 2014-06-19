require 'rails_helper'

RSpec.describe UntestedModel, :type => :model do
  let(:untested) {FactoryGirl.create(:untested_model)}

  it "has a tested method" do
    expect(untested.this_is_tested).to be(true)
  end
end
