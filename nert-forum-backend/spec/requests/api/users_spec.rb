require "rails_helper"

describe "User API Tests" do

  before(:each) do
    @user = User.create(email: "test@test.com", name: "Test", password: "password")
  end

  it "GET /users should return 200" do
    get "/users"

    expect(response).to have_http_status(200)
  end

  it "POST /users should return 201" do 
    post "/users", params: {
      user: {
        email: "test@test.com",
        name: "Test",
        password: "password"
      }
    }

    expect(response).to have_http_status(201)
  end

  it "POST /users should return 400 for bad request" do
    post "/users", params: {
      user: {
        email: "test@test.com",
        name: "Test"
      }
    }

    expect(response).to have_http_status(400)
  end

  context 'when user is logged in && current_user' do # TODO: Fix 302 errors

    before(:each) do # TODO: fix validation for this test, ONLY WORKS WHEN BEFORE_ACTION COMMENTED OUT
        current_user = @user
    end

    it "GET /users/:id/edit should return 200" do
      
      get "/users/#{@user.id}/edit"

      expect(response).to have_http_status(200)
    end

    it "PUT /users/:id/edit should return 204" do

      put "/users/#{@user.id}", params: {
        user: {
          email: "test@test.com",
          name: "Test",
          password: "password"
        }
      }

      expect(response).to have_http_status(204)
    end

    it "DELETE /users/:id should return 200" do

      delete "/users/#{@user.id}"

      expect(response).to have_http_status(200)
    end

  end

  
end
