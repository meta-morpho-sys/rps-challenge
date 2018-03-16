feature 'Displaying points' do
  context 'at the beginning of the game' do
    before { register_and_play_vs_computer }
    scenario 'see points for Player 1' do
      expect(page).to have_content 'Genghis Khan 0 points'
    end

    scenario 'see points for Player 2' do
      expect(page).to have_content 'Computer 0 points'
    end
  end

  context 'while playing the game' do
    before do
      register_and_play_vs_computer
    end
    scenario 'points reduced randomly for player 2' do
      expect(Kernel).to receive(:rand).and_return(7)
      click_button 'Attack'
      expect(page).not_to have_content 'Alan: 60 points'
      expect(page).to have_content 'Alan: 53 points'
    end

    scenario 'points reduced randomly for player 1' do
      expect(Kernel).to receive(:rand).twice.and_return(7)
      2.times { click_button 'Attack' }
      expect(page).not_to have_content 'Yuliya: 60 points'
      expect(page).to have_content 'Yuliya: 53 points'
    end

    scenario 'when player 1 misses to hit player 2' do
      expect(Kernel).to receive(:rand).and_return(0)
      click_button 'Attack'
      expect(page).to have_content 'You missed!!!😝'
    end
  end
end
