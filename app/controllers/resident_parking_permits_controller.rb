class ResidentParkingPermitsController < ApplicationController
  before_action :current_user_must_be_resident_parking_permit_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_resident_parking_permit_user
    resident_parking_permit = ResidentParkingPermit.find(params[:id])

    unless current_user == resident_parking_permit.resident
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @v = current_user.visitor_parking_permits.ransack(params[:v])
      @visitor_parking_permits = @v.result(:distinct => true).includes(:resident, :loans).page(params[:page]).per(10)

    @r = current_user.resident_parking_permits.ransack(params[:r])
      @resident_parking_permits = @r.result(:distinct => true).includes(:resident, :resident_vehicle).page(params[:page]).per(10)

    render("visitor_parking_permits/index.html.erb")
  end

  def show
    @resident_parking_permit = ResidentParkingPermit.find(params[:id])

    render("resident_parking_permits/show.html.erb")
  end

  def new
    @resident_parking_permit = ResidentParkingPermit.new

    render("resident_parking_permits/new.html.erb")
  end

  def create
    @resident_parking_permit = ResidentParkingPermit.new
 
    @resident_parking_permit.resident_id = params[:resident_id]
    @resident_parking_permit.vehicle_id = params[:vehicle_id]
    @resident_parking_permit.valid_date = params[:valid_date]
    @resident_parking_permit.expiration_date = params[:expiration_date]
    @resident_parking_permit.activation_code = params[:activation_code]

    save_status = @resident_parking_permit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/resident_parking_permits/new", "/create_resident_parking_permit"
        redirect_to("/parking_permits")
      else
        redirect_back(:fallback_location => "/", :notice => "Resident parking permit activated successfully.")
      end
    else
      render("resident_parking_permits/new.html.erb")
    end
  end

  def edit
    @resident_parking_permit = ResidentParkingPermit.find(params[:id])

    render("resident_parking_permits/edit.html.erb")
  end

  def update
    @resident_parking_permit = ResidentParkingPermit.find(params[:id])
    @resident_parking_permit.vehicle_id = params[:vehicle_id]
    @resident_parking_permit.valid_date = params[:valid_date]
    @resident_parking_permit.expiration_date = params[:expiration_date]
    @resident_parking_permit.activation_code = params[:activation_code]

    save_status = @resident_parking_permit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/resident_parking_permits/#{@resident_parking_permit.id}/edit", "/update_resident_parking_permit"
        redirect_to("/resident_parking_permits/#{@resident_parking_permit.id}", :notice => "Resident parking permit activated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Resident parking permit activated successfully.")
      end
    else
      render("resident_parking_permits/edit.html.erb")
    end
  end

  def destroy
    @resident_parking_permit = ResidentParkingPermit.find(params[:id])

    @resident_parking_permit.destroy

    if URI(request.referer).path == "/resident_parking_permits/#{@resident_parking_permit.id}"
      redirect_to("/", :notice => "Resident parking permit deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Resident parking permit deleted.")
    end
  end
end
