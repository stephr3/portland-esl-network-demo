class SitesController < ApplicationController
  def index
    if params[:center].present?
      @center = params[:center]
      if (@center.is_number?) and (0 < @center.length) and (@center.length < 6)
        lat = Geocoder.search(@center).first.coordinates.first
        lng = Geocoder.search(@center).first.coordinates.last
        @center_on = "{lat: #{lat}, lng: #{lng}}"
        @zoom = 13
      else
        flash[:alert] = "Please enter a valid zip code."
        @center_on = "{lat: 45.543897, lng: -122.655977}"
        @zoom = 9
      end
    else
      @center_on = "{lat: 45.543897, lng: -122.655977}"
      @zoom = 9
    end

    if params[:site_type].present?
      if params[:site_type] == 'church'
        @layer = "layer_churches"
      elsif params[:site_type] == 'college'
        @layer = "layer_colleges"
      elsif params[:site_type] == 'business'
        @layer = "layer_businesses"
      elsif params[:site_type] == 'library'
        @layer = "layer_libraries"
      elsif params[:site_type] == 'public_school'
        @layer = "layer_schools"
      elsif params[:site_type] == 'social_service'
        @layer = "layer_services"
      else
        @layer = "layer_all"
      end
    else
      @layer = "layer_all"
    end

    if params[:region].present?
      if params[:region] == 'all'
        response = RestClient.get("https://www.googleapis.com/fusiontables/v1/query?sql=SELECT+*+FROM+1ns0L3nnMDTnIwnbrMwwO30ZDoQK-6b_yQRqNYY8+ORDER+BY+Name+ASC&key=#{ENV['GOOGLE_API_KEY']}")
        json_response = JSON.parse(response)
        @sites = json_response["rows"]
        render :all_regions
      elsif params[:region] == 'north_northeast'
        render :north_northeast
      elsif params[:region] == 'south_southeast'
        render :south_southeast
      elsif params[:region] == 'southwest'
        render :southwest
      elsif params[:region] == 'downtown'
        render :downtown
      elsif params[:region] == 'gresham'
        render :gresham
      elsif params[:region] == 'washington_county'
        render :washington_county
      elsif params[:region] == 'clark_county'
        render :clark_county
      elsif params[:region] == 'other_areas'
        render :other_areas
      else
        render :index
      end
    end
  end
end
