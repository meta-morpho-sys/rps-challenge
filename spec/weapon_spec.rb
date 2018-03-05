require 'weapon'

describe Weapon do
  let(:rock) { Weapon.new 'rock' }
  let(:scissors) { Weapon.new 'scissors' }
  let(:paper) { Weapon.new 'paper' }

  context 'win' do
    example 'rock to scissors' do
      expect(rock.beats?(scissors)).to eq 1
    end

    example 'paper to rock' do
      expect(paper.beats?(rock)).to eq 1
    end

    example 'scissors to paper' do
      expect(scissors.beats?(paper)).to eq 1
    end
  end

  context 'lose' do
    example 'scissors to rock' do
      expect(scissors.beats?(rock)).to eq(-1)
    end

    example 'paper to scissors' do
      expect(paper.beats?(scissors)).to eq(-1)
    end

    example 'rock to paper' do
      expect(rock.beats?(paper)).to eq(-1)
    end
  end

  context 'draw' do
    example 'scissors to scissors' do
      expect(scissors.beats?(scissors)).to eq 0
    end

    example 'paper to paper' do
      expect(paper.beats?(paper)).to eq 0
    end

    example 'rock to rock' do
      expect(rock.beats?(rock)).to eq 0
    end
  end
end
