require 'rails_helper'

describe "/rodents" do

  let(:valid_attributes) {
    attributes_for(:rodent)
  }

  let(:invalid_attributes) {
    {name: ''}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Rodent.create! valid_attributes
      get rodents_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      rodent = Rodent.create! valid_attributes
      get rodent_url(rodent)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_rodent_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      rodent = Rodent.create! valid_attributes
      get edit_rodent_url(rodent)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Rodent" do
        expect {
          post rodents_url, params: { rodent: valid_attributes }
        }.to change(Rodent, :count).by(1)
      end

      it "redirects to the created rodent" do
        post rodents_url, params: { rodent: valid_attributes }
        expect(response).to redirect_to(rodent_url(Rodent.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Rodent" do
        expect {
          post rodents_url, params: { rodent: invalid_attributes }
        }.to change(Rodent, :count).by(0)
      end

      it "renders an unsuccessful response (i.e. to display the 'new' template)" do
        post rodents_url, params: { rodent: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: 'Squirrel'}
      }

      it "updates the requested rodent" do
        rodent = Rodent.create! valid_attributes
        patch rodent_url(rodent), params: { rodent: new_attributes }
        rodent.reload
        expect(rodent.name).to eq 'Squirrel'
      end

      it "redirects to the rodent" do
        rodent = Rodent.create! valid_attributes
        patch rodent_url(rodent), params: { rodent: new_attributes }
        rodent.reload
        expect(response).to redirect_to(rodent_url(rodent))
      end
    end

    context "with invalid parameters" do
      it "renders an unsuccessful response (i.e. to display the 'edit' template)" do
        rodent = Rodent.create! valid_attributes
        patch rodent_url(rodent), params: { rodent: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested rodent" do
      rodent = Rodent.create! valid_attributes
      expect {
        delete rodent_url(rodent)
      }.to change(Rodent, :count).by(-1)
    end

    it "redirects to the rodents list" do
      rodent = Rodent.create! valid_attributes
      delete rodent_url(rodent)
      expect(response).to redirect_to(rodents_url)
    end
  end
end
