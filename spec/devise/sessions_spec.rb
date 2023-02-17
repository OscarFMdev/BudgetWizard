require 'rack_session_access/capybara'

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let!(:user) { create(:user, confirmed_at: Time.current) }

  describe 'GET /login' do
    it 'renders the login page' do
      get new_user_session_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('Log in')
    end
  end

  describe 'POST /login' do
    context 'with valid credentials' do
      it 'redirects to the root path' do
        post user_session_path, params: { user: { email: user.email, password: user.password } }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid credentials' do
      it 'renders the login page with an error message' do
        post user_session_path, params: { user: { email: user.email, password: 'invalid' } }
        expect(response).to have_http_status(200)
        expect(response.body).to include('Invalid Email or password')
      end
    end
  end
end
