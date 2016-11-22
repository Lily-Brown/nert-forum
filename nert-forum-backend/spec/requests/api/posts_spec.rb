require "rails_helper"

describe "Post API Tests" do

  before(:each) do
    @user = User.create(email: "test@test.com", name: "Test", password: "password")
    @post = Post.create(title: "Post Title", text_body: "This is the body of my Post.", user_id: @user.id)
  end

  it "post#index: GET /posts should return 200" do
    get "/posts"

    expect(response).to have_http_status(200)
  end

  it "post#create: POST /posts should return 201" do 
    post "/posts", params: {
      data: {
        attributes: {
          title: "Post Title",
          text_body: "This is the body of my Post.",
          user_id: @user.id
        }
      }
    }

    expect(response).to have_http_status(201)
  end

  it "post#create: POST /posts should return 400 for bad request" do
    post "/posts", params: {
      data: {
        attributes: {
          title: "Post Title"
        }
      }
    }

    expect(response).to have_http_status(400)
  end

  it "post#show: GET /posts/:id should return 200" do
    get "/posts/#{@post.id}"

    expect(response).to have_http_status(200)
  end

  it "post#update: PUT /posts/:id/ should return 204" do

    put "/posts/#{@post.id}", params: {
      data: {
        attributes: {
          title: "Post Title",
          text_body: "This is the body of my Post."
        }
      }
    }

    expect(response).to have_http_status(204)
  end

  it "post#destroy: DELETE /posts/:id should return 200" do

    delete "/posts/#{@post.id}"

    expect(response).to have_http_status(200)
  end
  
end
