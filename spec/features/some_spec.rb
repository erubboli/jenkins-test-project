require 'rails_helper'

describe "a test", :type => :feature do
  it "works" do
    visit "/"
    expect(page).to have_content("hello world")
  end
end
