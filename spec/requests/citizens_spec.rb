require 'rails_helper'

RSpec.describe "/citizens", type: :request do
  let(:valid_attributes) {
    FactoryBot.attributes_for(:citizen, address_attributes: attributes_for(:address))
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:citizen, email: nil, address: nil)
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Citizen.create! valid_attributes
      get citizens_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      citizen = Citizen.create! valid_attributes
      get citizen_url(citizen), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Citizen" do
        expect {
          post citizens_url,
               params: { citizen: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Citizen, :count).by(1)
      end

      it "renders a JSON response with the new citizen" do
        post citizens_url,
             params: { citizen: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Citizen" do
        expect {
          post citizens_url,
               params: { citizen: invalid_attributes }, as: :json
        }.to change(Citizen, :count).by(0)
      end

      it "renders a JSON response with errors for the new citizen" do
        post citizens_url,
             params: { citizen: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        attributes_for(:citizen, full_name: 'New name', address_attributes: attributes_for(:address))
      }

      it "updates the requested citizen" do
        citizen = Citizen.create! valid_attributes
        patch citizen_url(citizen),
              params: { citizen: new_attributes }, headers: valid_headers, as: :json
        citizen.reload
      end

      it "renders a JSON response with the citizen" do
        citizen = Citizen.create! valid_attributes
        patch citizen_url(citizen),
              params: { citizen: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the citizen" do
        citizen = Citizen.create! valid_attributes
        patch citizen_url(citizen),
              params: { citizen: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
