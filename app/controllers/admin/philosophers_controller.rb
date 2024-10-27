class Admin::PhilosophersController < Admin::BaseController
  before_action :authenticate_user!
  before_action :ensure_admin
  
  private
  
  def ensure_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Access denied!"
    end
  end
  
  before_action :set_admin_philosopher, only: %i[ show edit update destroy ]

  # GET /admin/philosophers or /admin/philosophers.json
  def index
    @admin_philosophers = Philosopher.all
  end

  # GET /admin/philosophers/1 or /admin/philosophers/1.json
  def show
  end

  # GET /admin/philosophers/new
  def new
    @admin_philosopher = Philosopher.new
  end

  # GET /admin/philosophers/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /admin/philosophers or /admin/philosophers.json
  def create
    @admin_philosopher = Philosopher.new(admin_philosopher_params)

    respond_to do |format|
      if @admin_philosopher.save
        format.html { redirect_to admin_philosopher_url(@admin_philosopher), notice: "Philosopher was successfully created." }
        format.json { render :show, status: :created, location: @admin_philosopher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_philosopher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/philosophers/1 or /admin/philosophers/1.json
  def update
    respond_to do |format|
      if @admin_philosopher.update(admin_philosopher_params)
        format.html { redirect_to admin_philosopher_url(@admin_philosopher), notice: "Philosopher was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_philosopher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_philosopher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/philosophers/1 or /admin/philosophers/1.json
  def destroy
    @admin_philosopher.destroy

    respond_to do |format|
      format.html { redirect_to admin_philosophers_url, notice: "Philosopher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_philosopher
      @admin_philosopher = Philosopher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_philosopher_params
      params.fetch(:admin_philosopher, {})
    end
end
