require 'rails_helper'

describe 'Rental authorization' do
  context 'admin' do
    it 'must be admin to create rentals' do
      post rentals_path, params: {}
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end