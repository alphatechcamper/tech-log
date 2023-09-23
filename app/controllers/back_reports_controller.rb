class BackReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_report, only: [:edit, :update, :destroy, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @back_reports = BackReport.includes(:user).order('created_at DESC')
  end

  def new
    @report = OutputReport.new
  end

  def create
    @report = OutputReport.new(report_params)
    if @report.save

      redirect_to output_reports_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to output_reports_path
    else
      render :edit
    end
  end

  def destroy
    report = OutputReport.find(params[:id])
    @report.destroy
    redirect_to output_reports_path
  end

  def show
    @report = OutputReport.find(params[:id])
  end

  def search
    @reports = Outputreport.search(params[:keyword])
  end

  private

  def back_report_params
    params.require(:back_report).permit(:study_hours, :successes, :improvements, :learning_tips)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end
