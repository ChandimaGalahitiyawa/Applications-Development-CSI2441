class QuotesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_quote, only: %i[show edit update destroy]
  before_action :authorize_quote_owner_or_admin, only: [:edit, :update, :destroy]


  # GET /quotes or /quotes.json
  def index
    if user_signed_in?
      @quotes = Quote.where("is_public = ? OR user_id = ?", true, current_user.id).last(10)
    else
      @quotes = Quote.where(is_public: true).last(10)
    end
  end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes or /quotes.json
  def create
    @quote = current_user.quotes.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    if current_user
      @quotes = Quote.where("text LIKE ?", "%#{params[:query]}%")
    else
      @quotes = Quote.where("text LIKE ? AND is_public = ?", "%#{params[:query]}%", true)
    end
  end

  def authorize_quote_owner_or_admin
    unless current_user.admin? || current_user == @quote.user
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to quotes_url
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:text, :user_id, :philosopher_id, :publication_year, :comment, :is_public, :visibility, category_ids: [])
    end
end