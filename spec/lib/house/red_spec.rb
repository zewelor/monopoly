require 'rails_helper'

describe House::Red do
  it_behaves_like 'every house' do
    let(:cost)  { 20 }
    let(:fee)   { 40 }
    let(:color) { 'red' }
  end
end
