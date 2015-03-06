require 'rails_helper'

describe BoardBuilder do
  describe '#build' do
    subject { described_class.new.build }

    it { is_expected.to be_a(Board) }
    it { is_expected.not_to be_persisted }

    describe 'tiles' do
      subject { described_class.new.build.tiles }

      it { is_expected.to have_attributes(size: 30) }
      it { is_expected.to all(be_a(Tile)) }

      it 'should have start tile at 0' do
        expect(subject[0]).to be_a(Tile::Start)
      end

      it 'should have jail tile at 13' do
        expect(subject[13]).to be_a(Tile::Jail)
      end

      it 'should have 28 street tiles' do
        expect(subject.select { |t| t.class == Tile::Street}.size).to eq(28)
      end
    end
  end
end
