class UserMailer < ApplicationMailer
  default from: 'apegwar99@gmail.com'
  def report_email
    @r_appointment = params[:appointment]
    @r_user = User.find(@r_appointment.user_id)
    @r_hospital = Hospital.find(@r_appointment.hospital_id)
    @r_test_center = TestCenter.find(@r_appointment.test_center_id)
    mail(to:@r_user.email , subject: 'Report of the user')
  end
  
  def appointment_created_email
    @appointment = params[:appointment]
    mail(to: @appointment.user.email, subject: 'Appointment Created')
  end
  
  def user_created
    @user = params[:user]
    mail(to:@user.email,subject:'User created for Healthcare Mangement')
  end
end
