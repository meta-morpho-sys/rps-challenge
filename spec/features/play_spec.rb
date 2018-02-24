feature 'while playing the game' do
  before do
    register_and_play
  end

  scenario 'presented choices of throws Rock, Paper, or Scissors' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

  scenario 'can choose one option' do
    click_button 'Rock'
    expect(page).to have_content 'Yeah, you Rock!'
  end
end
