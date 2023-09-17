class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy,:update_status]
  before_action :check_patient, only: [:appoint_test_centers]
  def index
    appointments = Appointment.all
    render json: appointments
  end
  
  def show
    render json: @appointment
  end
  
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    if(@current_user.patient? || @current_user.health_worker?)
      @appointment.destroy
      render json: {message: "Appointment Successfully Cancelled"}
    else
      render json: { errors: "You are not authorized to perform this action" }, status: :unauthorized
    end
  end
  
  def appoint_test_centers
    appointment = @current_user.appointments.new(appointment_params)
    if appointment.save
      UserMailer.with(appointment: appointment).appointment_created_email.deliver_now
      render json: appointment, status: :created
    else
      render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update_status
    if (@current_user.health_worker?)
      if @appointment.update(status: params[:status])
        if(@appointment.completed?)
          UserMailer.with(appointment: @appointment).report_email.deliver_now
          render json: @appointment
        else
          render json: {message: "The patient is not cured yet,Report is to be genereated"}
        end
      else
        render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "You are not authorized to perform this action" }, status: :unauthorized
    end
  end
  
  private
  
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
  
  def appointment_params
    params.permit(:user_id, :description, :hospital_id, :test_center_id, :status, :appointment_datetime,:image)
  end
  
end