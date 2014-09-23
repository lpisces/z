class Cpanel::SettingsController < CpanelController
  before_action :set_cpanel_setting, only: [:show, :edit, :update, :destroy]

  # GET /cpanel/settings
  # GET /cpanel/settings.json
  def index
    @cpanel_settings = Cpanel::Setting.all
    @cpanel_settings_group = {}
	@cpanel_settings.each do |s|
      @cpanel_settings_group[s.group] = [] if @cpanel_settings_group[s.group].nil?
      @cpanel_settings_group[s.group].push s
	end
  end

  # GET /cpanel/settings/1
  # GET /cpanel/settings/1.json
  def show
  end

  # GET /cpanel/settings/new
  def new
    @cpanel_setting = Cpanel::Setting.new
  end

  # GET /cpanel/settings/1/edit
  def edit
  end

  # POST /cpanel/settings
  # POST /cpanel/settings.json
  def create
    @cpanel_setting = Cpanel::Setting.new(cpanel_setting_params)

    respond_to do |format|
      if @cpanel_setting.save
        format.html { redirect_to @cpanel_setting, notice: 'Setting was successfully created.' }
        format.json { render :show, status: :created, location: @cpanel_setting }
      else
        format.html { render :new }
        format.json { render json: @cpanel_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpanel/settings/1
  # PATCH/PUT /cpanel/settings/1.json
  def update
    respond_to do |format|
      if @cpanel_setting.update(cpanel_setting_params)
        format.html { redirect_to @cpanel_setting, notice: 'Setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @cpanel_setting }
      else
        format.html { render :edit }
        format.json { render json: @cpanel_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpanel/settings/1
  # DELETE /cpanel/settings/1.json
  def destroy
    @cpanel_setting.destroy
    respond_to do |format|
      format.html { redirect_to cpanel_settings_url, notice: 'Setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpanel_setting
      @cpanel_setting = Cpanel::Setting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpanel_setting_params
      params.require(:cpanel_setting).permit(:key, :value, :group, :desc)
    end
end
