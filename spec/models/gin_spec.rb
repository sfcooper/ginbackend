require 'rails_helper'

RSpec.describe Gin, type: :model do
    context 'validations' do
        it { should validate_presence_of(:gin_name) }
        it { should validate_presence_of(:snippet) }
        it { should validate_presence_of(:description) }
      end
      context 'associations' do
        it { should belong_to(:distillery) }
      end
end