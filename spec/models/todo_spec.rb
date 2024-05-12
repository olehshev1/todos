# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe Todo do
    subject{ create(:todo) }
    describe 'has fields' do
      it { expect(subject).to respond_to(:name) }
    end

    describe 'has associations' do
      context 'belongs_to list' do
        subject { described_class.reflect_on_association(:list) }
        it { expect(subject.macro).to eq :belongs_to }
      end
    end

    describe 'has associations' do
      context 'belongs_to status' do
        subject { described_class.reflect_on_association(:status) }
        it { expect(subject.macro).to eq :belongs_to }
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
