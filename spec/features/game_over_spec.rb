feature 'End of the game' do
  context 'when Player 1 reaches 30 points first' do
    before do
      register_and_play_vs_computer
      allow(Player).to receive(:points).and_return(30)
    end

    scenario 'the player wins' do
      click_button 'rock'
      expect(page).to have_content 'Genghis Khan wins!'
    end
  end
end
