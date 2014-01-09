class Users::RegistrationController < Devise::RegistrationController
   def create
      if verify_recaptcha
        super
      else
        build_resource(sign_up_params)
        clean_up_passwords(resource)
        flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."      
        flash.delete :recaptcha_error
        render :new
      end
    end
  # def new
  #   super
  # end

  # def create
  #   super
  # end
end
