# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::AccessesController, type: :controller do
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
    subject { -> { post :create, params: params } }
    context 'with valid attributes' do
      let(:params) { {access: {name: 'Access1'}} }

      it 'create new access Access.count+1 be valid' do
        is_expected.to change(Access, :count).by(1)
      end

      it 'create new access redirect to accesses_path be valid' do
        post :create, params: params
        is_expected.to redirect_to(admin_accesses_path)
      end
    end

    context 'with invalid attributes' do
      let(:params) { {access: {name: ''}} }

      it 'does not create new access Access.count+1 be not valid' do
        is_expected.to change(Access, :count).by(0)
      end

      it 'does not create new access render_template new be valid' do
        post :create, params: params
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    let(:access) { create(:access) }
    subject { put :update, params: params }
    context 'with valid attributes' do
      let(:params) { {id: access.to_param, access: {name: 'Access1'}} }
      it 'it update access redirect admin_accesses_path be valid ' do
        is_expected.to redirect_to(admin_accesses_path)
      end
    end

    context 'with invalid attributes' do
      let(:params) { { id: access.to_param, access: {name: ''} } }
      it 'it update  access render_template edit be valid' do
        is_expected.to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:access) { create(:access) }
    context 'with valid attributes' do
      it 'destroy access Access.count-1 be valid' do
        params = {id: access.to_param}
        expect do
          delete :destroy, params: params
        end.to change(Access, :count).by(-1)
      end

      context 'with valid attributes' do
        it 'destroy access redirect to accesses_path be valid' do
          delete :destroy, params: {id: access.to_param}
          is_expected.to redirect_to(admin_accesses_path)
        end
      end
    end
  end
end
