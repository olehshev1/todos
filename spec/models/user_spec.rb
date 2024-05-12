# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    describe 'has associations' do
      context 'has_many lists' do
        subject { described_class.reflect_on_association(:lists) }
        it { expect(subject.macro).to eq :has_many }
      end
    end
  end
end
