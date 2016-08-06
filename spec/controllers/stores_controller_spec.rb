RSpec.describe StoresController, type: :controller do

    describe "stores methods" do

    let!(:default_user) { create(:default_user) }
    let!(:default_store) { create(:default_store) }
    let!(:valid_token) { JsonWebToken::encode(user_id: default_user.id) }

    context "without being authenticated" do

      def check_not_authorized(response)
        expect(response.status).to eq 401
        body = JSON.parse(response.body)
        expect(body.keys).to contain_exactly("error")
        expect(body["error"]).to eq "Not Authorized"
      end

      it "should return an error 'Not Authorized'" do
        # GET /stores
        get :index
        check_not_authorized(response)
        # SHOW /stores/1
        get :index, params: { id: default_store.id }
        check_not_authorized(response)
        # POST /stores
        post :create, params: { store: { name: "name", address: "address" } }
        check_not_authorized(response)
        # PATCH /stores/1
        patch :update, params: { id: default_store.id, store: { name: "name", address: "address" } }
        check_not_authorized(response)
        # PUT /stores/1
        put :update, params: { id: default_store.id, store: { name: "name", address: "address" } }
        check_not_authorized(response)
        # DELETE /stores/1
        delete :destroy, params: { id: default_store.id }
        check_not_authorized(response)
      end

    end

    context "with authentication" do

      it 'should return a result' do
        request.headers['Authorization'] = valid_token

        # GET /stores
        get :index
        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        expect(body.has_key?("data")).to be_truthy
        expect(body["data"].count).to eq 1

        # SHOW /stores/1
        get :index, params: { id: default_store.id }
        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        attrs = body["data"][0]["attributes"]
        expect(attrs["name"]).to eq default_store.name
        expect(attrs["address"]).to eq default_store.address
        report_text = "Test"
        default_store.visits.create!(report: report_text, user: default_user)
        get :index, params: { id: default_store.id }
        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        visits = body["data"][0]["attributes"]["visits"]
        expect(visits.count).to eq 1
        expect(visits[0]["report"]).to eq report_text

      end

    end

  end

end
