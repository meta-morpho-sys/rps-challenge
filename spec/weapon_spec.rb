require 'weapon'

describe Weapon do
  let(:rock) { Weapon.new 'rock' }
  let(:scissors) { Weapon.new 'scissors' }
  let(:paper) { Weapon.new 'paper' }

  context 'win' do
    example 'rock to scissors' do
      expect(rock.beats?(scissors)).to eq :win
    end

    example 'paper to rock' do
      expect(paper.beats?(rock)).to eq :win
    end

    example 'scissors to paper' do
      expect(scissors.beats?(paper)).to eq :win
    end
  end

  context 'lose' do
    example 'scissors to rock' do
      expect(scissors.beats?(rock)).to eq :lose
    end

    example 'paper to scissors' do
      expect(paper.beats?(scissors)).to eq :lose
    end

    example 'rock to paper' do
      expect(rock.beats?(paper)).to eq :lose
    end
  end

  context 'draw' do
    example 'scissors to scissors' do
      expect(scissors.beats?(scissors)).to eq :draw
    end

    example 'paper to paper' do
      expect(paper.beats?(paper)).to eq :draw
    end

    example 'rock to rock' do
      expect(rock.beats?(rock)).to eq :draw
    end
  end

end
