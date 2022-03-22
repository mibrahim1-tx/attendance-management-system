# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @attendances = current_user.attendances.all.paginate(page: params[:page], per_page: 10)
  end

  def checked_in
    @attendance = current_user.attendances.where(created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day)
    if @attendance.present?
      if @attendance.try(:first).check_in_time.nil?
        @attendance.first.update(check_in_time: DateTime.now,
                                 checked_in: true)
      end
    else
      current_user.attendances.create(check_in_time: DateTime.now)
    end
    redirect_to root_path
  end

  def checked_out
    @attendance = current_user.attendances.where(created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day)
    if @attendance.present?
      @attendance.update(check_out_time: DateTime.now, check_out: true) if @attendance.last.check_out_time.nil?
    else
      current_user.attendances.create(check_out_time: DateTime.now)
    end

    redirect_to root_path
  end
end
