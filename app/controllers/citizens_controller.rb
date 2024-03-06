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
      CitizenMailer.registration_notification(@citizen).deliver_now
      #send_sms_notification(@citizen)

      render json: @citizen, status: :created, location: @citizen
    else
      render json: @citizen.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /citizens/1
  def update
    if @citizen.update(citizen_params)
      CitizenMailer.registration_notification(@citizen).deliver_now
      #send_sms_notification(@citizen)

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

    def send_sms_notification(citizen)
      account_sid = 'YOUR_TWILIO_ACCOUNT_SID'
      auth_token = 'YOUR_TWILIO_AUTH_TOKEN'
      client = Twilio::REST::Client.new(account_sid, auth_token)
  
      message = client.messages.create(
        body: 'Seu cadastro foi atualizado/criado com sucesso!',
        from: 'YOUR_TWILIO_PHONE_NUMBER',
        to: citizen.phone
      )
    end
end
