class RodentsController < ApplicationController
  before_action :set_rodent, only: %i[ show edit update destroy ]

  # GET /rodents
  def index
    @rodents = Rodent.all
  end

  # GET /rodents/1
  def show
  end

  # GET /rodents/new
  def new
    @rodent = Rodent.new
  end

  # GET /rodents/1/edit
  def edit
  end

  # POST /rodents
  def create
    @rodent = Rodent.new(rodent_params)

    if @rodent.save
      redirect_to @rodent, notice: "Rodent was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rodents/1
  def update
    if @rodent.update(rodent_params)
      redirect_to @rodent, notice: "Rodent was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /rodents/1
  def destroy
    @rodent.destroy
    redirect_to rodents_url, notice: "Rodent was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rodent
      @rodent = Rodent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rodent_params
      params.require(:rodent).permit(:name)
    end
end
