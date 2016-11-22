require "rails_helper"

describe "Comment API Tests" do

  before(:each) do
    @user = User.create(email: "test@test.com", name: "Test", password: "password")
    @post = Post.create(title: "Post Title", text_body: "This is the body of my Post.", user_id: @user.id)
    @comment = Comment.create(text_body: "This is the body of my Comment.", user_id: @user.id, post_id: @post.id)
  end

  it "comment#index: GET /comments should return 200" do
    get "/comments"

    expect(response).to have_http_status(200)
  end

  it "comment#create: POST /comments should return 201" do 
    post "/comments", params: {
      data: {
        attributes: {
          text_body: "This is the body of my Comment.",
          user_id: @user.id,
          post_id: @post.id
        }
      }
    }

    expect(response).to have_http_status(201)
  end

  it "comment#create: POST /comments should return 400 for bad request" do
    post "/comments", params: {
      data: {
        attributes: {
          title: "Comment Title"
        }
      }
    }

    expect(response).to have_http_status(400)
  end

  it "comment#show: GET /comments/:id should return 200" do
    get "/comments/#{@comment.id}"

    expect(response).to have_http_status(200)
  end

  it "comment#update: PUT /comments/:id/ should return 204" do

    put "/comments/#{@comment.id}", params: {
      data: {
        attributes: {
          title: "Comment Title",
          text_body: "This is the body of my Comment."
        }
      }
    }

    expect(response).to have_http_status(204)
  end

  it "comment#destroy: DELETE /comments/:id should return 204" do

    delete "/comments/#{@comment.id}"

    expect(response).to have_http_status(204)
  end
  
end
