class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    # before ##########################################################################
    # respond_to do |format|

    #   # company
    #   unless @user.company.present?
    #     @user.errors.add(:invalid, "company")
    #   end

    #   # sei
    #   unless @user.sei.present? && @user.sei.length < 50
    #     @user.errors.add(:invalid, "sei")
    #   end

    #   # mei
    #   unless @user.mei.present? && @user.mei.length < 50
    #     @user.errors.add(:invalid, "sei")
    #   end

    #   # postal_code
    #   unless @user.postal_code =~ /¥d/
    #     @user.errors.add(:invalid, "半角数字のみ入力できます")
    #   end

    #   # mail
    #   unless @user.mail.present? && @user.mail =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #     @user.errors.add(:invalid, "mail")
    #   end

    #   # tel
    #   unless @user.tel.present? && @user.tel =~ /¥d/
    #     @user.errors.add(:invalid, "tel")
    #   end

    #   # エラーがなかったらOK
    #   unless @user.errors.present?
    #     @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
    # before ##########################################################################

    # after ##########################################################################
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    # after ##########################################################################


  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:company, :sei, :mei, :postal_code, :adress, :mail, :tel)
    end
end
