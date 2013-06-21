class SlowLogsController < ApplicationController
  # GET /slow_logs
  # GET /slow_logs.json
  def index
    @q = SlowLog.search(params[:q])
    @slow_logs = @q.result.order("id DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @slow_logs }
    end
  end

  # GET /slow_logs/1
  # GET /slow_logs/1.json
  def show
    @slow_log = SlowLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @slow_log }
    end
  end

  # GET /slow_logs/new
  # GET /slow_logs/new.json
  def new
    @slow_log = SlowLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @slow_log }
    end
  end

  # GET /slow_logs/1/edit
  def edit
    @slow_log = SlowLog.find(params[:id])
  end

  # POST /slow_logs
  # POST /slow_logs.json
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

  # PUT /slow_logs/1
  # PUT /slow_logs/1.json
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

  # DELETE /slow_logs/1
  # DELETE /slow_logs/1.json
  def destroy
    @slow_log = SlowLog.find(params[:id])
    @slow_log.destroy

    respond_to do |format|
      format.html { redirect_to slow_logs_url }
      format.json { head :no_content }
    end
  end
end
