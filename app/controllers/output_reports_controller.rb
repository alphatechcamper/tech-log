class OutputReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_report, only: [:edit, :update, :destroy, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @reports = OutputReport.includes(:user).order('created_at DESC')
  end

  def new
    @report = OutputReport.new
  end

  def create
    @report = OutputReport.new(report_params)
    if @report.save

      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    report = OutputReport.find(params[:id])
    @report.destroy
    redirect_to posts_path
  end

  def show
    @report = OutputReport.find(params[:id])
  end

  def search
    @reports = Outputreport.search(params[:keyword])
  end

  

  private

  def report_params
    params.require(:output_report).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_report
    @report = OutputReport.find(params[:id])
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end