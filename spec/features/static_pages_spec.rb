require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do

  feature "visit home page" do

    it "should load the home page successfully" do
      visit root_path
      expect(page).to have_http_status(:success)
      expect(page).to have_text("Welcome to Todo List App")
    end
  end
  
end
