require 'rails_helper'

describe House::Blue do
  it_behaves_like 'every house' do
    let(:cost)  { 40 }
    let(:fee)   { 80 }
    let(:color) { 'blue' }
  end
end
