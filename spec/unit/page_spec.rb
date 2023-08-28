require "capybara"
require 'capybara/dsl'
require 'selenium-webdriver'

include Capybara::DSL
Capybara.register_driver :selenium do |app|
end
describe "Example age render until test" do 
    it "it should show explore logo" do
    visit('/')
    expect(page.has_selector? 'a.logo').to be true
    end
end