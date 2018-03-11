feature 'Playing the game' do
  scenario 'by choosing "Rock" and winning' do
    register_and_play_vs_computer
    allow_any_instance_of(Array).to receive(:sample).and_return(:scissors)
    click_button 'rock'
    expect(page).to have_content 'The result is ....... You win!'
  end

  scenario 'by choosing "Rock" and losing' do
    register_and_play_vs_computer
    allow_any_instance_of(Array).to receive(:sample).and_return(:paper)
    click_button 'rock'
    expect(page).to have_content 'The result is ....... You lose!'
  end

  scenario 'by choosing "Rock" and making a draw' do
    register_and_play_vs_computer
    allow_any_instance_of(Array).to receive(:sample).and_return 'rock'
    click_button 'rock'
    expect(page).to have_content "It's a draw"
  end

  scenario 'you can play many times' do
    register_and_play_vs_computer
    click_button 'rock'
    expect(page).to have_link 'Play again'
  end
end
