require 'spec_helper'

describe PluginsController do

  def valid_attributes
    attributes_for :plugin
  end
  
  describe "GET index" do
    it "assigns all plugins as @plugins" do
      plugin = Plugin.create! valid_attributes
      get :index, {}
      assigns(:plugins).should eq([plugin])
    end
  end

  describe "GET show" do
    it "assigns the requested plugin as @plugin" do
      plugin = Plugin.create! valid_attributes
      get :show, {:id => plugin.to_param}
      assigns(:plugin).should eq(plugin)
    end
  end

  describe "GET new" do
    it "assigns a new plugin as @plugin" do
      get :new, {}
      assigns(:plugin).should be_a_new(Plugin)
    end
  end

  describe "GET edit" do
    it "assigns the requested plugin as @plugin" do
      plugin = Plugin.create! valid_attributes
      get :edit, {:id => plugin.to_param}
      assigns(:plugin).should eq(plugin)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Plugin" do
        expect {
          post :create, {:plugin => valid_attributes}
        }.to change(Plugin, :count).by(1)
      end

      it "assigns a newly created plugin as @plugin" do
        post :create, {:plugin => valid_attributes}
        assigns(:plugin).should be_a(Plugin)
        assigns(:plugin).should be_persisted
      end

      it "redirects to the created plugin" do
        post :create, {:plugin => valid_attributes}
        response.should redirect_to(Plugin.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved plugin as @plugin" do
        # Trigger the behavior that occurs when invalid params are submitted
        Plugin.any_instance.stub(:save).and_return(false)
        post :create, {:plugin => {}}
        assigns(:plugin).should be_a_new(Plugin)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Plugin.any_instance.stub(:save).and_return(false)
        post :create, {:plugin => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested plugin" do
        plugin = Plugin.create! valid_attributes
        # Assuming there are no other plugins in the database, this
        # specifies that the Plugin created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Plugin.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => plugin.to_param, :plugin => {'these' => 'params'}}
      end

      it "assigns the requested plugin as @plugin" do
        plugin = Plugin.create! valid_attributes
        put :update, {:id => plugin.to_param, :plugin => valid_attributes}
        assigns(:plugin).should eq(plugin)
      end

      it "redirects to the plugin" do
        plugin = Plugin.create! valid_attributes
        put :update, {:id => plugin.to_param, :plugin => valid_attributes}
        response.should redirect_to(plugin)
      end
    end

    describe "with invalid params" do
      it "assigns the plugin as @plugin" do
        plugin = Plugin.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Plugin.any_instance.stub(:save).and_return(false)
        put :update, {:id => plugin.to_param, :plugin => {}}
        assigns(:plugin).should eq(plugin)
      end

      it "re-renders the 'edit' template" do
        plugin = Plugin.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Plugin.any_instance.stub(:save).and_return(false)
        put :update, {:id => plugin.to_param, :plugin => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested plugin" do
      plugin = Plugin.create! valid_attributes
      expect {
        delete :destroy, {:id => plugin.to_param}
      }.to change(Plugin, :count).by(-1)
    end

    it "redirects to the plugins list" do
      plugin = Plugin.create! valid_attributes
      delete :destroy, {:id => plugin.to_param}
      response.should redirect_to(plugins_url)
    end
  end

end
