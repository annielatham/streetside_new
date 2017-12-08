class LoansController < ApplicationController
  def index
    @q = Loan.ransack(params[:q])
    @loans = @q.result(:distinct => true).includes(:vehicle, :visitor_parking_permit, :lender).page(params[:page]).per(10)

    render("loans/index.html.erb")
  end

  def show
    @loan = Loan.find(params[:id])

    render("loans/show.html.erb")
  end

  def new
    @loan = Loan.new

    render("loans/new.html.erb")
  end

  def create
    @loan = Loan.new

    @loan.vehicle_id = params[:vehicle_id]
    @loan.permit_id = params[:permit_id]
    @loan.start_time = params[:start_time]
    @loan.end_time = params[:end_time]

    save_status = @loan.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/loans/new", "/create_loan"
        redirect_to("/loans")
      else
        redirect_back(:fallback_location => "/", :notice => "Loan created successfully.")
      end
    else
      render("loans/new.html.erb")
    end
  end

  def edit
    @loan = Loan.find(params[:id])

    render("loans/edit.html.erb")
  end

  def update
    @loan = Loan.find(params[:id])

    @loan.vehicle_id = params[:vehicle_id]
    @loan.permit_id = params[:permit_id]
    @loan.start_time = params[:start_time]
    @loan.end_time = params[:end_time]

    save_status = @loan.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/loans/#{@loan.id}/edit", "/update_loan"
        redirect_to("/loans/#{@loan.id}", :notice => "Loan updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Loan updated successfully.")
      end
    else
      render("loans/edit.html.erb")
    end
  end

  def destroy
    @loan = Loan.find(params[:id])

    @loan.destroy

    if URI(request.referer).path == "/loans/#{@loan.id}"
      redirect_to("/", :notice => "Loan deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Loan deleted.")
    end
  end
end
