class BackReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_back_report, only: [:edit, :update, :destroy, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @back_reports = BackReport.includes(:user).order('created_at DESC')
  end

  def new
    @back_report = BackReport.new
  end

  def create
    @back_report = BackReport.new(back_report_params)
    if @back_report.save

      redirect_to back_reports_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @back_report.update(back_report_params)
      redirect_to back_reports_path
    else
      render :edit
    end
  end

  def destroy
    back_report = BackReport.find(params[:id])
    @back_report.destroy
    redirect_to back_reports_path
  end

  def show
    @back_report = BackReport.find(params[:id])
  end

  def search
    @back_reports = BackReport.search(params[:keyword])
  end

  private

  def back_report_params
    params.require(:back_report).permit(:study_hours, :successes,
                                        :improvements, :learning_tips).merge(user_id: current_user.id)
  end

  def set_back_report
    @back_report = BackReport.find(params[:id])
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end
