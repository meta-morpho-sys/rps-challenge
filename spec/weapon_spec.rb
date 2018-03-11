require 'weapon'

describe Weapon do
  let(:rock) { Weapon::ROCK }
  let(:scissors) { Weapon::SCISSORS }
  let(:paper) { Weapon::PAPER }

  example '3 wins' do
    expect(Weapon.compare(rock, scissors)).to eq 1
    expect(Weapon.compare(paper, rock)).to eq 1
    expect(Weapon.compare(scissors, paper)).to eq 1
  end

  example '3 losses' do
    expect(Weapon.compare(scissors, rock)).to eq(-1)
    expect(Weapon.compare(paper, scissors)).to eq(-1)
    expect(Weapon.compare(rock, paper)).to eq(-1)
  end

  example '3 draws' do
    expect(Weapon.compare(scissors, scissors)).to eq 0
    expect(Weapon.compare(paper, paper)).to eq 0
    expect(Weapon.compare(rock, rock)).to eq 0
  end

  example 'random weapon' do
    allow_any_instance_of(Array).to receive(:sample).and_return 'rock'
    expect(Weapon.random).to eq 'rock'
  end
end
