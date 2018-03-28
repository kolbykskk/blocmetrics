class RegisteredApplicationsController < ApplicationController

  before_action :authenticate_user!

  def index
    @applications = current_user.RegisteredApplications.all
  end

  def show
    @application = RegisteredApplication.find(params[:id])
    @events = @application.events.group_by(&:name)
  end

  def new
    @application = RegisteredApplication.new
  end

  def create
    @application = current_user.RegisteredApplications.build(application_params)

    if @application.save
      flash[:notice] = "Successfully registered application."
      redirect_to registered_applications_path
    else
      render :new
    end
  end

  def destroy
    @application = current_user.RegisteredApplications.find(params[:id])

    if @application.destroy
      redirect_to registered_applications_path
    else
      flash[:alert] = "Application could not be deleted."
      redirect_to @application
    end
  end

  private
  def application_params
    params.require(:registered_application).permit(:name, :URL)
  end
end
