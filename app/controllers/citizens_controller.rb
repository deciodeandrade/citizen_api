class CitizensController < ApplicationController
  before_action :set_citizen, only: %i[ show update destroy ]

  # GET /citizens
  def index
    @citizens = Citizen.all

    render json: @citizens
  end

  # GET /citizens/1
  def show
    render json: @citizen
  end

  # POST /citizens
  def create
    @citizen = Citizen.new(citizen_params)

    if @citizen.save
      render json: @citizen, status: :created, location: @citizen
    else
      render json: @citizen.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /citizens/1
  def update
    if @citizen.update(citizen_params)
      render json: @citizen
    else
      render json: @citizen.errors, status: :unprocessable_entity
    end
  end

  private
    def set_citizen
      @citizen = Citizen.find(params[:id])
    end

    def citizen_params
      params.require(:citizen).permit(:full_name, :cpf, :cns, :email, :birth_date, :phone, :status)
    end
end
