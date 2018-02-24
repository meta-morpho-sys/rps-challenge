def register_and_submit
  visit '/'
  fill_in :player_1_name, with: 'Genghis Khan'
  fill_in :player_2_name, with: 'Attila'
  click_button 'Submit'
end
