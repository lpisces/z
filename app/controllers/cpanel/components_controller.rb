class Cpanel::ComponentsController < CpanelController
  before_action :set_cpanel_component, only: [:show, :edit, :update, :destroy]

  # GET /cpanel/components
  # GET /cpanel/components.json
  def index
    @cpanel_components = Cpanel::Component.all
  end

  # GET /cpanel/components/1
  # GET /cpanel/components/1.json
  def show
  end

  # GET /cpanel/components/new
  def new
    @cpanel_component = Cpanel::Component.new
  end

  # GET /cpanel/components/1/edit
  def edit
  end

  # POST /cpanel/components
  # POST /cpanel/components.json
  def create
    @cpanel_component = Cpanel::Component.new(cpanel_component_params)

    respond_to do |format|
      if @cpanel_component.save
        format.html { redirect_to @cpanel_component, notice: 'Component was successfully created.' }
        format.json { render :show, status: :created, location: @cpanel_component }
      else
        format.html { render :new }
        format.json { render json: @cpanel_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpanel/components/1
  # PATCH/PUT /cpanel/components/1.json
  def update
    respond_to do |format|
      if @cpanel_component.update(cpanel_component_params)
        format.html { redirect_to @cpanel_component, notice: 'Component was successfully updated.' }
        format.json { render :show, status: :ok, location: @cpanel_component }
      else
        format.html { render :edit }
        format.json { render json: @cpanel_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpanel/components/1
  # DELETE /cpanel/components/1.json
  def destroy
    @cpanel_component.destroy
    respond_to do |format|
      format.html { redirect_to cpanel_components_url, notice: 'Component was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpanel_component
      @cpanel_component = Cpanel::Component.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpanel_component_params
      params.require(:cpanel_component).permit(:component, :sub, :status, :controller, :action)
    end
end
