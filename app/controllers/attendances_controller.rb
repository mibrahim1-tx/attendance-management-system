# frozen_string_literal: true

class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.present_users if current_user.present?
  end

  def new
    @attendance = Attendance.new
    @sub_types = { 'Admin' => 'admin', 'HR' => 'hr', 'Employee' => 'employee' }
  end

  def create
    @attendance = current_user.attendances.new(attendance_params)
    if @attendance.save
      redirect_to attendances_path
    else
      render :new
    end
  end

  def absent_members
    @absent_users = Attendance.absent_users
  end

  def absent_new
    @user_roles = { 'Admin' => 'admin', 'HR' => 'hr', 'Employee' => 'employee' }
    @sub_types = { 'Leave' => 'leave', 'Holiday' => 'holiday' }
  end

  def absent_create
    @absent = current_user.attendances.new(absent_params)
    redirect_to absent_members_path if @absent.save
  end

  private

  def attendance_params
    params.require(:attendance).permit(:check_in_time, :check_out_time, :sub_type)
  end

  def absent_params
    params.require(:attendance).permit(:main_type, :sub_type, :reason,
                                       :paid, :leave_on, :leave_duration)
  end
end
