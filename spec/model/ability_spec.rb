require 'rails_helper'
RSpec.describe RailsAdmin::MainController, type: :controller do
    routes { RailsAdmin::Engine.routes }
   
    describe '#my_custom' do
      subject { get :my_custom, { model_name: 'user', id: user.id } }
   
      it "should respond with 200" do
        expect(response.code).to eq("200")
      end
    end
   end