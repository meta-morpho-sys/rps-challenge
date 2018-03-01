require 'weapon'

describe Weapon do
  let(:rock) { Weapon.new 'rock' }
  let(:scissors) { Weapon.new 'scissors' }

  example 'beats a weaker weapon' do
    expect(rock.beats?(scissors)).to eq :win
  end
end
