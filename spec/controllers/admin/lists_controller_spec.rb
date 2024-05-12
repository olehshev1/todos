# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::ListsController, type: :controller do
  before { sign_in create(:user) }
  it_renders_404 :edit, :update, :destroy

  describe 'GET #index' do
    subject { get :index }
    context 'renders index template' do
      it 'be valid' do
        subject
        is_expected.to have_http_status(:success)
        is_expected.to render_template('index')
      end
    end
  end

  describe 'GET #new' do
    subject { get :new }
    context 'renders new template' do
      it 'be valid' do
        subject
        is_expected.to have_http_status(:success)
        is_expected.to render_template('new')
      end
    end
  end

  describe 'POST #create' do
    let(:access) { create(:access) }
    subject { -> { post :create, params: params } }
    context 'with valid attributes' do
      let(:params) { {list: {name: 'List1', access_id: access.to_param }} }

      it 'create new list List.count+1 be valid' do
        is_expected.to change(List, :count).by(1)
      end

      it 'create new list redirect to lists_path be valid' do
        post :create, params: params
        is_expected.to redirect_to(admin_root_path)
      end
    end

    context 'with invalid attributes' do
      let(:params) { {list: {name: ''}} }

      it 'does not create new list List.count+1 be not valid' do
        is_expected.to change(List, :count).by(0)
      end

      it 'does not create new list render_template new be valid' do
        post :create, params: params
        expect(response).to render_template('new')
      end
    end
  end

end
