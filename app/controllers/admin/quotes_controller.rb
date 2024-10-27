class Admin::QuotesController < Admin::BaseController
  before_action :authenticate_user!
  before_action :ensure_admin
  
  private
  
  def ensure_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Access denied!"
    end
  end
  
  before_action :set_admin_quote, only: %i[ show edit update destroy ]

  # GET /admin/quotes or /admin/quotes.json
  def index
    @admin_quotes = Quote.all
  end

  # GET /admin/quotes/1 or /admin/quotes/1.json
  def show
  end

  # GET /admin/quotes/new
  def new
    @admin_quote = Quote.new
  end

  # GET /admin/quotes/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /admin/quotes or /admin/quotes.json
  def create
    @admin_quote = Quote.new(admin_quote_params)

    respond_to do |format|
      if @admin_quote.save
        format.html { redirect_to admin_quote_url(@admin_quote), notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @admin_quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/quotes/1 or /admin/quotes/1.json
  def update
    respond_to do |format|
      if @admin_quote.update(admin_quote_params)
        format.html { redirect_to admin_quote_url(@admin_quote), notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/quotes/1 or /admin/quotes/1.json
  def destroy
    @admin_quote.destroy

    respond_to do |format|
      format.html { redirect_to admin_quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_quote
      @admin_quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_quote_params
      params.fetch(:admin_quote, {})
    end
end
