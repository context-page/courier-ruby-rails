module CourierRails
  class Railtie < Rails::Railtie
    initializer "courier_rails.add_delivery_method" do
      ActiveSupport.on_load :action_mailer do
        ActionMailer::Base.add_delivery_method :courier, CourierRails::DeliveryMethod, return_response: true
      end
    end

    initializer "courier_rails.extend_with_data_options" do
      ActiveSupport.on_load :action_mailer do
        ActionMailer::Base.send :include, CourierRails::DataOptions
      end
    end
  end
end