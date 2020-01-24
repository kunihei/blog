class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :list_plan, only: [:index, :list_index]
  before_action :Guard_clause, only: [:show,]

  # GET /plans
  # GET /plans.json
  def index
  end

  def list_index
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.create(plan_params)
    redirect_to plans_path
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    if @plan.update(plan_params)
      redirect_to plans_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    redirect_to plans_path, notice:"削除しました"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def list_plan
      @plans = Plan.includes(:user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:title, :content, :image, :start_time).merge(user_id: current_user.id)
    end

    def month_plans_params
      params.require(:plan).permit!
    end

    def Guard_clause
      if @plan.user_id != current_user.id
        flash[:alert]= 'ユーザーが違います'
        redirect_to root_path
      end
    end
end
