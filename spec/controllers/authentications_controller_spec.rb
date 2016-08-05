RSpec.describe AuthenticationsController, type: :controller do

  describe "POST register" do

    let!(:default_user) { create(:default_user) }

    context "with already taken username" do

      it "should return an error" do
        post :register, params: {
            authentication: {
              username: default_user.username,
              password: default_user.password
            },
        }
        expect(response.status).to eq 401
        body = JSON.parse(response.body)
        expect(body.keys).to contain_exactly("error")
        expect(body["error"]).not_to eq false
        expect(body["error"].keys).to contain_exactly("user_authentication")
        expect(body["error"]["user_authentication"]).to eq ["username is already taken"]
      end

    end

    context "with new credentials" do

      it "should not return an error" do
        post :register, params: {
          authentication: {
            username: "_",
            password: "_"
          }
        }
        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        expect(body.keys).to contain_exactly("auth_token")
        user_hash = JsonWebToken.decode(body["auth_token"])
        expect(user_hash).not_to eq nil
        expect(user_hash.keys).to contain_exactly("user_id", "exp")
      end

    end

  end

  describe "POST login" do

    let!(:default_user) { create(:default_user) }

    context "with invalid params" do

      it "should return an error" do
        post :login, params: {
            authentication: {
              username: "_",
              password: "_"
            },
        }
        expect(response.status).to eq 401

        body = JSON.parse(response.body)
        expect(body.keys).to contain_exactly("error")
        expect(body["error"]).not_to eq false
        expect(body["error"].keys).to contain_exactly("user_authentication")
        expect(body["error"]["user_authentication"]).to eq ["invalid credentials"]
      end

    end

    context "with valid credentials" do

      it "should not return an error" do
        post :login, params: {
          authentication: {
            username: default_user.username,
            password: default_user.password
          }
        }
        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        expect(body.keys).to contain_exactly("auth_token")
        user_hash = JsonWebToken.decode(body["auth_token"])
        expect(user_hash).not_to eq nil
        expect(user_hash.keys).to contain_exactly("user_id", "exp")
      end

    end

  end

end
