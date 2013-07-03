class SlowLogsController < ApplicationController
  before_filter :set_tag_list

  def set_tag_list
    @tags = SlowLog.group("server").count
  end

  def index
    @q = SlowLog.search(params[:q])
    @slow_logs = @q.result.order("id DESC").page(params[:page])

    respond_to do |format|
      format.js if request.xhr?
      format.html
      format.json { render json: @slow_logs }
    end
  end

  def show
    @slow_log = SlowLog.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @slow_log }
    end
  end

  def new
    @slow_log = SlowLog.new

    respond_to do |format|
      format.html
      format.json { render json: @slow_log }
    end
  end

  def edit
    @slow_log = SlowLog.find(params[:id])
  end

  def create
    @slow_log = SlowLog.new(params[:slow_log])

    respond_to do |format|
      if @slow_log.save
        format.html { redirect_to @slow_log, notice: 'Slow log was successfully created.' }
        format.json { render json: @slow_log, status: :created, location: @slow_log }
      else
        format.html { render action: "new" }
        format.json { render json: @slow_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @slow_log = SlowLog.find(params[:id])

    respond_to do |format|
      if @slow_log.update_attributes(params[:slow_log])
        format.html { redirect_to @slow_log, notice: 'Slow log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @slow_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @slow_log = SlowLog.find(params[:id])
    @slow_log.destroy

    respond_to do |format|
      format.html { redirect_to slow_logs_url }
      format.json { head :no_content }
    end
  end

  def stock
    return redirect_to '/404.html' unless request.xhr?
    @slow_log = SlowLog.find(params[:id])

    if @slow_log.is_stocked?
      @slow_log.is_stocked = false
    else
      @slow_log.is_stocked = true
    end
    @slow_log.updated_at = Time.now

    respond_to do |format|
      if @slow_log.save
        format.js { @slow_log }
        format.json { @slow_log }
      else
        format.js { render :action => "alert/error" }
        format.json { render json: @slow_log.errors, status: :unprocessable_entity }
      end
    end
  end

end
