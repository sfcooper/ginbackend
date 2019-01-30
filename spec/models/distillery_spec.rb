require 'rails_helper'

RSpec.describe Distillery, type: :model do

    context 'associations' do
        it { should have_many(:gins) }
    end
end