shared_examples("REST controller") do
  #cleaner code
  subject(:instance)   {subject.class.name.downcase.to_sym}
  subject(:collection) {subject.class.name.downcase.pluralize.to_sym}
  subject(:assigned)   {assigns(instance)}
  let(:error_message)  {"Couldn't find #{subject.class.name} with id=invalid"}

  #generate models for each test
  subject {@subject}

  before(:each) do
    request.accept = "application/json"
    @object_title_method ||="name"
  end

  describe "GET index" do
    it "returns a list (200)" do
      get :index, @params
      expect(response.status).to eq(200)
      expect(assigns(collection).count).to eq(@index.count)
    end
  end

  describe "GET show" do
    it "finds a record (200)" do
      get :show, @params.merge(:id => subject.id)
      expect(response.status).to eq(200)
      expect(assigned).to be_persisted
    end
  end

  describe "POST create" do
    it "persists a new record (201)" do
      post :create, @params.merge(instance => @built_subject.attributes.merge(@extra_item_params||{}))
      expect(response.status).to eq(201)
      expect(assigned).to be_persisted
    end

    it "does not persist an invalid record (422)" do
      post :create, @params.merge(instance => @invalid_subject.attributes)
      expect(response.status).to eq(422)
      expect(assigned).not_to be_persisted
    end
  end

  describe "PUT update" do

    it "returns an updated record" do
      put :update, @params.merge(instance => subject.attributes, :id => subject.id)
      expect(assigned.send(@object_title_method)).to eq(subject.send(@object_title_method))
    end

    it "does not update a record with invalid data (422)" do
      put :update, @params.merge(instance => @invalid_subject.attributes, :id => subject.id)
      expect(response.status).to eq(422)
      expect(subject.class.name.constantize.find(subject.id)).to be_valid
    end
  end

  describe "PUT destroy" do
    it "removes a record (204)" do
      put :destroy, @params.merge({:id => subject.id ,:method => :delete})
      expect(response.status).to eq(204)
      expect(assigned).not_to be_persisted
    end

  end
end
