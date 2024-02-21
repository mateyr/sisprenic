# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]

  def index
    @pagy, @clients = pagy_countless(Client.all, count: Client.count, items: 20)
  end

  def show; end

  def new
    @client = Client.new
  end

  def edit; end

  def create
    @client = Client.create(client_params)

    if @client.save
      redirect_to clients_path, notice: "Cliente guardado"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: "Cliente actualizado"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy

    redirect_to clients_path, notice: "Cliente eliminado", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:first_name, :middle_name, :last_name, :second_last_name, :identification,
                                   :phone_number)
  end
end
