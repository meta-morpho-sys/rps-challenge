feature 'Register players name' do
  scenario 'submitting and seeing name' do
    register_and_play
    expect(page).to have_content 'Welcome, Genghis Khan'
  end
end
