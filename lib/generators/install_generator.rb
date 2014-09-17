module CarnivalDeviseViews
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Install Carnival devise View"

      def copy_views
        if options.haml?
          directory '../../../app/views/haml/devise', 'app/views/devise'
        else
          directory '../../../app/views/haml/devise', 'app/views/devise'
        end
      end

      def copy_locale
        copy_file "../../../config/locales/pt-BR.yml", "config/locales/devise.safeguard.pt-BR.yml"
        copy_file "../../../config/locales/en.yml", "config/locales/devise.safeguard.en.yml"
      end


      def copy_assets
        if options.sass?
          copy_file '../../../app/assets/stylesheets/carnival_devise_views.sass', 'app/assets/stylesheets/carnival_devise_views.sass'
        else
          copy_file '../../../app/assets/stylesheets/carnival_devise_views.css', 'app/assets/stylesheets/carnival_devise_views.css'
        end
      end
    end
  end
end
