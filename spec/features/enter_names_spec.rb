feature 'Register players name' do
  scenario 'submitting and seeing name' do
    visit '/'
    fill_in :player_1_name, with: 'Genghis Khan'
    fill_in :player_2_name, with: 'Attila'
    click_button 'Submit'
    expect(page).to have_content 'Welcome, Genghis Khan and Attila'
  end
end
