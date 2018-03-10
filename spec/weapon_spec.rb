require 'weapon'

describe Weapon do
  let(:rock) { Weapon::ROCK }
  let(:scissors) { Weapon::SCISSORS }
  let(:paper) { Weapon::PAPER }

  context 'win' do
    example 'rock to scissors' do
      expect(Weapon.compare(rock, scissors)).to eq 1
    end

    example 'paper to rock' do
      expect(Weapon.compare(paper, rock)).to eq 1
    end

    example 'scissors to paper' do
      expect(Weapon.compare(scissors, paper)).to eq 1
    end
  end

  context 'lose' do
    example 'scissors to rock' do
      expect(Weapon.compare(scissors, rock)).to eq(-1)
    end

    example 'paper to scissors' do
      expect(Weapon.compare(paper, scissors)).to eq(-1)
    end

    example 'rock to paper' do
      expect(Weapon.compare(rock, paper)).to eq(-1)
    end
  end

  context 'draw' do
    example 'scissors to scissors' do
      expect(Weapon.compare(scissors, scissors)).to eq 0
    end

    example 'paper to paper' do
      expect(Weapon.compare(paper, paper)).to eq 0
    end

    example 'rock to rock' do
      expect(Weapon.compare(rock, rock)).to eq 0
    end
  end
end
