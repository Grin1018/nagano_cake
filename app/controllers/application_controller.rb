class ApplicationController < ActionController::Base
   def after_sign_in_path_for(resource)
    customer_path(current_customer.id) # ログイン後に遷移するpathを設定
    end
    def after_sign_out_path_for(resource)
    root_path
    end
end
