# frozen_string_literal: true

require 'rails_helper'

describe MainController do
  describe '#check' do
    render_views
    context 'posled text' do
      before do
        params = { number: '25 625 4 6 7' }
        get :check, params: params
      end
      it 'have content' do
        expect(response.body).not_to have_content('25 625 4 6 7')
        expect(response.body).to have_content('25 625 4')
      end
    end
    context 'when number is not lucky' do
      before do
        params = { number: '25 625 4 6 7' }
        get :check, params: params
      end
      it 'page havent lucky text' do
        expect(response.body).not_to have_content('1 1 1 1 1')
        expect(response.body).to have_content('1')
        expect(response.body).to have_content('25 625 4')
      end
    end
  end
end
