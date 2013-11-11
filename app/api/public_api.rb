class PublicAPI < Grape::API

  format :json
  
  helpers do
    def current_household
      @current_household ||= Household.find(params[:household_id])
    end

    def current_bundle
      @current_bundle ||= Bundle.find(params[:bundle_id])
    end

    def current_widget
      @current_widget ||= Widget.find(params[:widget_id])
    end
  end

  resource :households do

    get do
      present Household.all, with: Entities::HouseholdEntity
    end

    params do
      requires :name, type: String
    end
    post do
      household = Household.create! name: params[:name]
      present household, with: Entities::HouseholdEntity
    end

    route_param :household_id do
      get do
        present current_household, with: Entities::HouseholdEntity
      end

      resource :bundles do
        get do
          present current_household.bundles, with: Entities::BundleEntity
        end

        params do
          requires :name, type: String
        end
        post do
          bundle = Bundle.create! name: params[:name], household: current_household
          present bundle, with: Entities::BundleEntity
        end

        route_param :bundle_id do
          get do
            present current_bundle, with: Entities::BundleEntity
          end

          params do
            optional :name, type: String
          end
          post do
            present current_bundle.update_attributes params, with: Entities::BundleEntity
          end


          resource :widgets do
            get do
              present current_bundle.widgets, with: Entities::WidgetEntity
            end

            params do
              requires :name, type: String
              optional :quantity, type: Integer
              optional :budget, type: Integer
            end
            post do
              widget = Widget.create! name: params[:name], bundle: current_bundle, quantity: params[:quantity], budget: params[:budget]
              present widget, with: Entities::WidgetEntity
            end


            route_param :widget_id do
              get do
                present current_widget, with: Entities::WidgetEntity
              end

              params do
                optional :name, type: String
                optional :quantity, type: Integer
                optional :budget, type: Integer
              end
              post do
                present current_widget.update_attributes params, with: Entities::WidgetEntity
              end

              delete do
                current_widget.delete
              end

              post :collected do
                current_widget.collect!
                present current_widget, with: Entities::WidgetEntity
              end
            end
          end
        end
      end

      resource :members do
        get do
          present current_household.users, with: Entities::UserEntity
        end
      end
    
    end
  end

end