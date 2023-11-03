class WorkshopsController < ApplicationController
  def index
    @workshops = Workshop.all
  end

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(workshop_params)
    if @workshop.save
      flash[:success] = 'Woorkshop Created'
      redirect_to workshops_path
    else
      render :new, status: :see_other
    end
  end

  def show
    @workshop = Workshop.find(params[:id])
  end

  def search
    q = params[:q]
    @workshops = Workshop.where('name LIKE ?', "%#{q}%")
  end

  private

  def workshop_params
    params.require(:workshop).permit(:name, :descrition, :start_date, :end_date, :start_time, :end_time, :total_seat,
                                     :remaining_seat, :registration_fee)
  end
end
