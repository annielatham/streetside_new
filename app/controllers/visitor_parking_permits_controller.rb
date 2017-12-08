class VisitorParkingPermitsController < ApplicationController
  before_action :current_user_must_be_visitor_parking_permit_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_visitor_parking_permit_user
    visitor_parking_permit = VisitorParkingPermit.find(params[:id])

    unless current_user == visitor_parking_permit.resident
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
    @loan = Loan.new
    @visitor_parking_permit = VisitorParkingPermit.find(params[:id])

    render("visitor_parking_permits/show.html.erb")
  end

  def new
    @visitor_parking_permit = VisitorParkingPermit.new

    render("visitor_parking_permits/new.html.erb")
  end

  def create
    @visitor_parking_permit = VisitorParkingPermit.new

    @visitor_parking_permit.resident_id = params[:resident_id]
    @visitor_parking_permit.valid_date = params[:valid_date]
    @visitor_parking_permit.expiration_date = params[:expiration_date]
    @visitor_parking_permit.activation_code = params[:activation_code]

    save_status = @visitor_parking_permit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/visitor_parking_permits/new", "/create_visitor_parking_permit"
        redirect_to("/parking_permits")
      else
        redirect_back(:fallback_location => "/", :notice => "Visitor parking permit created successfully.")
      end
    else
      render("visitor_parking_permits/new.html.erb")
    end
  end

  def edit
    @visitor_parking_permit = VisitorParkingPermit.find(params[:id])

    render("visitor_parking_permits/edit.html.erb")
  end

  def update
    @visitor_parking_permit = VisitorParkingPermit.find(params[:id])
    @visitor_parking_permit.valid_date = params[:valid_date]
    @visitor_parking_permit.expiration_date = params[:expiration_date]
    @visitor_parking_permit.activation_code = params[:activation_code]

    save_status = @visitor_parking_permit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/visitor_parking_permits/#{@visitor_parking_permit.id}/edit", "/update_visitor_parking_permit"
        redirect_to("/visitor_parking_permits/#{@visitor_parking_permit.id}", :notice => "Visitor parking permit updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Visitor parking permit updated successfully.")
      end
    else
      render("visitor_parking_permits/edit.html.erb")
    end
  end

  def destroy
    @visitor_parking_permit = VisitorParkingPermit.find(params[:id])

    @visitor_parking_permit.destroy

    if URI(request.referer).path == "/visitor_parking_permits/#{@visitor_parking_permit.id}"
      redirect_to("/", :notice => "Visitor parking permit deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Visitor parking permit deleted.")
    end
  end
end
