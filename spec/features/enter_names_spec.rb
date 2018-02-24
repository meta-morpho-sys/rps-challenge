feature 'Register players name' do
  scenario 'submitting and seeing name' do
    register_and_submit
    expect(page).to have_content 'Welcome, Genghis Khan and Attila'
  end
end
