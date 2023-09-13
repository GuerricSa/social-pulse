class ReportsController < ApplicationController

  def index
    @reports = policy_scope(Report)
  end

  def new
    @report = Report.new
    @defendant = User.find(params[:user_id]) 
    @user = User.find(params[:user_id])
    authorize @report
  end

  def create
    @report = Report.new(report_params)
    @report.defendant_id = params[:user_id]
    @report.reporter_id = current_user.id
    @report.save

    redirect_to root_path
    authorize @report
  end

  private

  def report_params
    params.require(:report).permit(:status, :content, :defendant_id, :reporter_id) 
  end

end
