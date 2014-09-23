class Cpanel::UsersController < CpanelController
  include Pundit
  before_action :set_cpanel_user, only: [:show, :edit, :update, :destroy]

  # GET /cpanel/users
  # GET /cpanel/users.json
  def index
    @cpanel_users = Cpanel::User.all
  end

  # GET /cpanel/users/1
  # GET /cpanel/users/1.json
  def show
  end

  # GET /cpanel/users/new
  def new
    @cpanel_user = Cpanel::User.new
  end

  # GET /cpanel/users/1/edit
  def edit
  end

  # POST /cpanel/users
  # POST /cpanel/users.json
  def create
    @cpanel_user = Cpanel::User.new(cpanel_user_params)

    respond_to do |format|
      if @cpanel_user.save
        format.html { redirect_to @cpanel_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @cpanel_user }
      else
        format.html { render :new }
        format.json { render json: @cpanel_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpanel/users/1
  # PATCH/PUT /cpanel/users/1.json
  def update
    respond_to do |format|
	  #params[:cpanel_user][:groups] = params[:cpanel_user][:groups].join(",")
      if @cpanel_user.update(cpanel_user_params)
        @cpanel_user.groups.delete_all
        params[:cpanel_user][:group_ids].each do |g|
          @cpanel_user.groups.push Group.find(g) if !Group.find_by_id(g).nil?
        end
        @cpanel_user.save
        format.html { redirect_to @cpanel_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @cpanel_user }
      else
        format.html { render :edit }
        format.json { render json: @cpanel_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpanel/users/1
  # DELETE /cpanel/users/1.json
  def destroy
    @cpanel_user.destroy
    respond_to do |format|
      format.html { redirect_to cpanel_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpanel_user
      @cpanel_user = Cpanel::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpanel_user_params
      #params[:cpanel_user]
      params.require(:cpanel_user).permit(:nick, :email, :username, :group_ids)
    end
end
