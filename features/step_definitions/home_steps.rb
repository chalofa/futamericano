# encoding: utf-8

#--------------------------------------------------------------------
#  GIVEN
#--------------------------------------------------------------------
Given /^a pending Season exists$/ do
  @season = Fabricate :season_pending
end


#--------------------------------------------------------------------
#  WHEN
#--------------------------------------------------------------------
When /^(?:|I )(?:|am on|go to) the Home page$/ do
  visit root_path
end


#--------------------------------------------------------------------
#  THEN
#--------------------------------------------------------------------
Then /^(?:|I )should see the Soon counter$/ do
  within 'section#main.soon' do
    page.should have_content('days')
  end
end

Then /^(?:|I )should see the main Menu$/ do
  within 'header#top' do
    page.should have_selector('nav#menu')
    page.should have_content('Scoreboard')
    page.should have_content('Standings')
    page.should have_content('TV Guide')
  end
end
