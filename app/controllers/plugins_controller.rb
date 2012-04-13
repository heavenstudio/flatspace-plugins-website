class PluginsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @plugins = Plugin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plugins }
    end
  end

  def show
    @plugin = Plugin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plugin }
    end
  end

  def new
    @plugin = Plugin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plugin }
    end
  end

  def edit
    @plugin = Plugin.find(params[:id])
  end

  def create
    @plugin = Plugin.new(params[:plugin])

    respond_to do |format|
      if @plugin.save
        format.html { redirect_to @plugin, notice: 'Plugin was successfully created.' }
        format.json { render json: @plugin, status: :created, location: @plugin }
      else
        format.html { render action: "new" }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @plugin = Plugin.find(params[:id])

    respond_to do |format|
      if @plugin.update_attributes(params[:plugin])
        format.html { redirect_to @plugin, notice: 'Plugin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @plugin = Plugin.find(params[:id])
    @plugin.destroy

    respond_to do |format|
      format.html { redirect_to plugins_url }
      format.json { head :no_content }
    end
  end
end
