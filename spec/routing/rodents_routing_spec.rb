require "rails_helper"

describe RodentsController do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rodents").to route_to("rodents#index")
    end

    it "routes to #new" do
      expect(get: "/rodents/new").to route_to("rodents#new")
    end

    it "routes to #show" do
      expect(get: "/rodents/1").to route_to("rodents#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/rodents/1/edit").to route_to("rodents#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/rodents").to route_to("rodents#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/rodents/1").to route_to("rodents#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/rodents/1").to route_to("rodents#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/rodents/1").to route_to("rodents#destroy", id: "1")
    end
  end
end
