require 'rails_helper'

shared_examples_for 'every house' do
  let(:player) { FactoryGirl.build_stubbed(:player) }

  subject {described_class.new(player.id) }

  describe '#initialize' do
    it 'assigns player_id' do
      expect(subject.player_id).to eq(player.id)
    end
  end

  describe '#fee' do
    it 'returns fee' do
      expect(subject.fee).to eq(fee)
    end
  end

  describe '#cost' do
    it 'returns cost' do
      expect(subject.cost).to eq(cost)
    end
  end

  describe '#color' do
    it 'returns color' do
      expect(subject.color).to eq(color)
    end
  end

  describe '#to_hash' do
    it 'returns attributes hash' do
      expect(subject.to_hash).to eq({player_id: player.id, color: color })
    end
  end
end
