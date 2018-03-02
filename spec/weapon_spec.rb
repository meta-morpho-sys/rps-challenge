require 'weapon'

describe Weapon do
  let(:rock) { Weapon.new 'rock' }
  let(:scissors) { Weapon.new 'scissors' }
  let(:paper) { Weapon.new 'paper' }

  context 'win' do
    example 'rock to scissors' do
      expect(rock <=> scissors).to eq 1
    end

    example 'paper to rock' do
      expect(paper <=> rock).to eq 1
    end

    example 'scissors to paper' do
      expect(scissors <=> paper).to eq 1
    end
  end

  context 'lose' do
    example 'scissors to rock' do
      expect(scissors <=> rock).to eq(-1)
    end

    example 'paper to scissors' do
      expect(paper <=> scissors).to eq(-1)
    end

    example 'rock to paper' do
      expect(rock <=> paper).to eq(-1)
    end
  end

  context 'draw' do
    # rubocop:disable Lint/UselessComparison
    example 'scissors to scissors' do
      expect(scissors <=> scissors).to eq 0
    end

    example 'paper to paper' do
      expect(paper <=> paper).to eq 0
    end

    example 'rock to rock' do
      expect(rock <=> rock).to eq 0
    end
    # rubocop:enable Lint/UselessComparison
  end

end
