def register_and_play
  visit '/'
  fill_in :player_1_name, with: 'Genghis Khan'
  find('#player2', visible: false).value
  # fill_in :player_2_name, with: 'Attila'
  click_button 'Play'
end

def register_and_play_vs_computer
  visit '/'
  fill_in :player_1_name, with: 'Genghis Khan'
  click_button 'Play'
end
