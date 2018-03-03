feature 'while playing the game' do
  before do
    register_and_play
  end

  scenario 'presented choices of throws Rock, Paper, or Scissors' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

  scenario 'choose weapon "Rock" and get confirmation' do
    click_button 'Rock'
    expect(page).to have_content 'You chose Rock!'
  end

  scenario 'choose weapon "Scissors" and get confirmation' do
    click_button 'Scissors'
    expect(page).to have_content 'You chose Scissors!'
  end

  scenario 'choose weapon "Paper" and get confirmation' do
    click_button 'Paper'
    expect(page).to have_content 'You chose Paper!'
  end
end
