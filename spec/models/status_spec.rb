# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Status, type: :model do
  describe Status do
    subject{ create(:status) }
    describe 'has fields' do
      it { expect(subject).to respond_to(:name) }
    end

    describe 'has associations' do
      context 'has_many todos' do
        subject { described_class.reflect_on_association(:todos) }
        it { expect(subject.macro).to eq :has_many }
      end
    end

    describe 'name is not present' do
      before { subject.name = '' }
      it { expect(subject).to_not be_valid }
    end

    describe 'name is  present' do
      it { expect(subject).to be_valid }
    end
  end
end
