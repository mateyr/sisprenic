# frozen_string_literal: true

class LoansController < ApplicationController
  before_action :set_loan, only: %i[show edit update destroy]

  def index
    @pagy, @loans = pagy_countless(Loan.all, count: Loan.count, items: 20)
  end

  def show; end

  def new
    @loan = Loan.new
    @loan.interest_rates.build
  end

  def edit; end

  def create
    @loan = Loan.create(loan_params)

    if @loan.save
      redirect_to loans_path, notice: "Prestamo guardado"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @loan.update(loan_params)
      redirect_to loans_path, notice: "Prestamo actualizado"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @loan.destroy

    redirect_to loans_path, notice: "Prestamo eliminado", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:capital, :term, :start_date, :end_date, :payment_frequency, :status, :interest_type,
                                 :additional_note, :client_id, interest_rates_attributes: %i[loan_id value])
  end
end
