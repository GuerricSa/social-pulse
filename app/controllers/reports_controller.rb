class ReportsController < ApplicationController

  def index
    @reports = policy_scope(Report)
  end

  def new
    @report = Report.find(params[:user_id])
    @report = Report.new
    authorize @report
  end

  def create
    @report = Report.new
    @report.reporter_id = current_user

    authorize @report
  end

  private

  def report_params
    params.require(:report).permit(:content, :defendant_id, :reporter_id) # Remove :user_id
  end

end
