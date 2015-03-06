require 'rails_helper'

describe House::Manager do
  let(:first_player)  { FactoryGirl.build_stubbed(:player) }
  let(:second_player) { FactoryGirl.build_stubbed(:player) }
  let(:data) { [
    { color: 'blue', player_id: first_player.id },
    { color: 'red', player_id: second_player.id },
  ]}
  let(:house_manager) { described_class.new(data) }

  subject { house_manager }

  describe '#initialize' do

    it 'initializes houses hash with house objects' do
      expect(subject.houses.size).to eq(2)
      expect(subject.houses.first).to be_a(House::Blue)
      expect(subject.houses.last).to be_a(House::Red)
    end
  end

  describe '#to_hash' do
    it 'returns hash with houses attributes' do
      expect(subject.to_hash).to eq(data)
    end
  end

  describe '#fee' do
    context 'when without opponent houses' do
      let(:data) { [{ color: 'red', player_id: first_player.id } ]}

      it 'returns 0 fee' do
        expect(subject.fee(first_player)).to eq(0)
      end
    end

    context 'when opponent has one red house' do
      it 'returns fee' do
        expect(subject.fee(first_player)).to eq(40)
      end
    end
  end

  describe '#can_build?' do
    subject { house_manager.can_build?(first_player, color) }

    context 'when opponent has house with the same color' do
      let(:color) { 'red' }

      it 'returns false' do
        expect(subject).to be false
      end
    end

    context 'when not enoght money' do
      let(:first_player)  { FactoryGirl.build_stubbed(:player, cash: 1) }
      let(:color) { 'red' }

      it 'returns false' do
        expect(subject).to be false
      end
    end

    context 'when no opponents builds and player has enough cash' do
      let(:first_player)  { FactoryGirl.build_stubbed(:player, cash: 100) }
      let(:color) { 'blue' }

      it 'returns false' do
        expect(subject).to be true
      end
    end
  end

  describe '#build' do
    let(:color) { 'red' }

    it 'calls can_build?' do
      expect_any_instance_of(described_class).to receive(:can_build?).with(first_player, color)
      subject.build(first_player, color)
    end

    context 'when can build' do
      before { expect_any_instance_of(described_class).to receive(:can_build?).and_return(true) }

      it 'add new house of chosen color to houses array' do
        expect do
          subject.build(first_player, color)
        end.to change{subject.houses}
      end
    end

    context 'when cannot build' do
      before { expect_any_instance_of(described_class).to receive(:can_build?).and_return(false) }

      it 'does not add new house to houses array' do
        expect do
          subject.build(first_player, color)
        end.to_not change{subject.houses}
      end

      it 'returns false' do
        expect(subject.build(first_player, color)).to be false
      end
    end
  end

  describe '#houses_with_color' do
    let(:color) { 'red' }
    subject { house_manager.houses_with_color(color) }

    it 'returns only houses with specified color' do
      expect(subject.size).to eq(1)
      expect(subject.first).to be_a(House::Red)
    end
  end

  describe '#houses_not_owned_by' do
    subject { house_manager.houses_not_owned_by(first_player) }

    it 'returns only other player houses' do
      expect(subject.size).to eq(1)
      expect(subject.first.player_id).to eq(second_player.id)
    end
  end
end
