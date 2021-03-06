# encoding: utf-8

#--------------------------------------------------------------------
#  GIVEN
#--------------------------------------------------------------------
Given /^a pending Season exists$/ do
  @season = Fabricate :season_default_pending
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
    page.should have_content('día')
    page.should have_content('hora')
    page.should have_content('min')
    page.should have_content('seg')
  end
end

Then /^(?:|I )should see the next Game info$/ do
  within '#main.soon .game' do
    page.should have_content('Próximo juego:')
    page.should have_selector('img', alt: 'SF')
    page.should have_selector('img', alt: 'IND')
  end
end

Then /^(?:|I )should see the main Footer$/ do
  within 'footer#bottom' do
    page.should have_content('©2012.')
    page.should have_content('FutAmericano.com.')
    page.should have_content('Todos los logos y nombres son marcas registradas')
  end
end

Then /^(?:|I )should see the main Menu$/ do
  within 'header#top' do
    page.should have_selector('nav#menu')
    page.should have_content('Scoreboard')
    page.should have_content('Posiciones')
    page.should have_content('Guía de TV')
  end
end
