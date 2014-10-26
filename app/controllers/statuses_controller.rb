class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  def poststatus
    @createstatus= Status.create(:user_id=>params[:user_id],:text=>params[:status][:text])
  end
  
  def index
    @statuses = Status.all
  end

  def show
  end

  def new
    @status = Status.new
  end

  def edit
  end

  def create
    @status = Status.new(status_params)   
    
    respond_to do |format|
      if @status.save
        format.html { redirect_to @status, notice: 'Status was successfully created.' }
        format.json { render :show, status: :created, location: @status}
      else
        format.html { render :new }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
        respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
        format.json { render :show, status: :ok, location: @status}
      else
        format.html { render :edit }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @status.destroy
    respong_to do |format|
      format.html { redirect_to statuses_url, notice: 'Status was successfully destroyed.'}
      format.json { head :no_content }
  end
  end

  private
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
      params.require(:status).permit(:text, :user_id)
    end
end
