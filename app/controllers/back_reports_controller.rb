class BackReportsController < ApplicationController
  before_action :authenticate_user! # ログイン済みのユーザーのみアクセス可能にする例

  def index
    @back_reports = current_user.back_reports
  end

  def new
    @back_report = current_user.back_reports.build
  end

  def create
    @back_report = current_user.back_reports.build(back_report_params)
    if @back_report.save
      redirect_to back_reports_path, notice: "振り返りレポートを投稿しました。"
    else
      render :new
    end
  end

  def show
    @back_report = BackReport.find(params[:id])
  end

  def edit
    @back_report = BackReport.find(params[:id])
  end

  def update
    @back_report = BackReport.find(params[:id])
    if @back_report.update(back_report_params)
      redirect_to back_report_path(@back_report), notice: "振り返りレポートを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @back_report = BackReport.find(params[:id])
    @back_report.destroy
    redirect_to back_reports_path, notice: "振り返りレポートを削除しました。"
  end

  private

  def back_report_params
    params.require(:back_report).permit(:study_hours, :successes, :improvements, :learning_tips)
  end
end
