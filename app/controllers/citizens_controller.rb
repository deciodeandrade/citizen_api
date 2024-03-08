class CitizensController < ApplicationController
  before_action :set_citizen, only: %i[ show update destroy ]

  # GET /citizens
  def index
    @citizens = apply_filters(Citizen, filter_params)

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
    params.require(:citizen).permit(
      :full_name,
      :cpf,
      :cns,
      :email,
      :birth_date,
      :phone,
      :status,
      :image,
      address_attributes: [
        :id,
        :zip_code,
        :street,
        :neighborhood,
        :city,
        :state,
        :ibge_code
      ]
    )
  end

  def filter_params
    params.require(:filter).permit(
      :full_name,
      :cpf,
      :cns,
      :email,
      :status,
      :zip_code
    )
  end

  def apply_filters(model, filter_params)
    list = model.by_full_name(filter_params[:full_name])
                  .by_cpf(filter_params[:cpf])
                  .by_cns(filter_params[:cns])
                  .by_email(filter_params[:email])
                  .by_status(filter_params[:status])
                  .by_zip_code(filter_params[:zip_code])

    list
  end
end
