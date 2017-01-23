class FactsController < ApplicationController
  # before_action :set_fact, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource only: [:edit, :update, :destroy]

  # GET /facts
  # GET /facts.json
  def index
    @user = current_user
    @facts = Fact.all
  end

  # GET /facts/1
  # GET /facts/1.json
  def show
    @user = current_user
    @fact = Fact.find(params[:id])
  end

  # GET /facts/new
  def new
    @user = current_user
    @fact = Fact.new
  end

  # GET /facts/1/edit
  def edit
    @user = current_user
  end

  # POST /facts
  # POST /facts.json
  def create
    @user = current_user
    @fact = @user.facts.build(fact_params)

    if @fact.save
      redirect_to @fact
    else
      render 'new'
    end
  end

  # PATCH/PUT /facts/1
  # PATCH/PUT /facts/1.json
  def update
    respond_to do |format|
      if @fact.update(fact_params)
        format.html { redirect_to @fact, notice: 'Fact was successfully updated.' }
        format.json { render :show, status: :ok, location: @fact }
      else
        format.html { render :edit }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facts/1
  # DELETE /facts/1.json
  def destroy
    @fact.destroy
    respond_to do |format|
      format.html { redirect_to facts_url, notice: 'Fact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fact
      @fact = Fact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fact_params
      params.require(:fact).permit(:content)
    end
end
