feature 'while playing the game' do
  before do
    register_and_play
  end

  scenario 'presented choices of throws Rock, Paper, or Scissors' do
    expect(page).to have_button 'rock'
    expect(page).to have_button 'paper'
    expect(page).to have_button 'scissors'
  end

  scenario 'choose weapon "Rock" and get confirmation' do
    click_button 'rock'
    expect(page).to have_content 'You chose rock!'
  end

  scenario 'choose weapon "Scissors" and get confirmation' do
    click_button 'scissors'
    expect(page).to have_content 'You chose scissors!'
  end

  scenario 'choose weapon "Paper" and get confirmation' do
    click_button 'paper'
    expect(page).to have_content 'You chose paper!'
  end
end
