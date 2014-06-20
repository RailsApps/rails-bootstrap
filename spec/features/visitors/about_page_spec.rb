# Feature: 'About' page
#   As a visitor
#   I want to visit an 'about' page
#   So I can learn more about the website
feature 'About page' do

  # Scenario: Visit the 'about' page
  #   Given I am a visitor
  #   When I visit the 'about' page
  #   Then I see "About the Website"
  scenario 'Visit the about page' do
    visit 'pages/about'
    expect(page).to have_content 'About the Website'
  end

end
