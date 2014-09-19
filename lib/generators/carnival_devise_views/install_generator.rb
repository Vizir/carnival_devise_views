module CarnivalDeviseViews
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Install Carnival devise View"
      source_root File.expand_path("../../templates", __FILE__)
      class_option :haml, :type => :boolean, :default => false, :description => "Haml views"
      class_option :sass, :type => :boolean, :default => false, :description => "Sass Css"
      argument :folder_name, :type => :string, :default => "devise"

      def copy_views
        if options.haml?
          views_directory '../../../app/views/haml/devise'
        else
          views_directory '../../../app/views/erb/devise'
        end
      end

      def copy_locale
        copy_file "../../../config/locales/pt-BR.yml", "config/locales/devise.carnival.pt-BR.yml"
        copy_file "../../../config/locales/en.yml", "config/locales/devise.carnival.en.yml"
      end


      def copy_assets
        if options.sass?
          copy_file '../../../app/assets/stylesheets/carnival_devise_views.sass', 'app/assets/stylesheets/carnival_devise_views.sass'
        else
          copy_file '../../../app/assets/stylesheets/carnival_devise_views.css', 'app/assets/stylesheets/carnival_devise_views.css'
        end
      end

      def copy_fonts
        directory  '../../../app/assets/images/', 'app/assets/images/'
      end

      private
      def views_directory source
        directory source, "app/views/#{folder_name}" do |content|
          content.gsub 'devise/shared/links', "#{folder_name}/shared/links"
        end
        
      end
    end
  end
end
