require "rails_helper"

describe "User API Tests" do

  before(:each) do
    @user = User.create(email: "test@test.com", name: "Test", password: "password")
  end

  it "user#index: GET /users should return 200" do
    get "/users"

    expect(response).to have_http_status(200)
  end

  it "user#create: POST /users should return 201" do 
    post "/users", params: {
      data: {
        attributes: {
          email: "test1@test.com",
          name: "Test",
          password: "password"
        }
      }
    }

    expect(response).to have_http_status(201)
  end

  it "user#create: POST /users should return 400 for bad request" do
    post "/users", params: {
      data: {
        attributes: {
          email: "test@test.com",
          name: "Test"
        }
      }
    }

    expect(response).to have_http_status(400)
  end

  it "user#show: GET /users/:id should return 200" do
    get "/users/#{@user.id}"

    expect(response).to have_http_status(200)
  end

  it "user#update: PUT /users/:id/ should return 204" do

    put "/users/#{@user.id}", params: {
      data: {
        attributes: {
          email: "test@test.com",
          name: "Test",
          password: "password"
        }
      }
    }

    expect(response).to have_http_status(204)
  end

  it "user#destroy: DELETE /users/:id should return 200" do

    delete "/users/#{@user.id}"

    expect(response).to have_http_status(200)
  end
  
end
