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

    if params[:name].present?
      @name = params[:name]
      response = RestClient.get("https://www.googleapis.com/fusiontables/v1/query?sql=SELECT+*+FROM+1ns0L3nnMDTnIwnbrMwwO30ZDoQK-6b_yQRqNYY8+WHERE+Name+CONTAINS+IGNORING+CASE+'#{@name}'+ORDER+BY+Name+ASC&key=#{ENV['GOOGLE_API_KEY']}")
      json_response = JSON.parse(response)
      @sites = json_response["rows"]
      render :search_results
    end

    if params[:region].present?
      if params[:region] == 'all'
        response = RestClient.get("https://www.googleapis.com/fusiontables/v1/query?sql=SELECT+*+FROM+1ns0L3nnMDTnIwnbrMwwO30ZDoQK-6b_yQRqNYY8+WHERE+'Class Happening Now?'+=+'Yes'+ORDER+BY+Name+ASC&key=#{ENV['GOOGLE_API_KEY']}")
        json_response = JSON.parse(response)
        @sites = json_response["rows"]
        render :all_regions
      elsif params[:region] == 'north_northeast'
        response = RestClient.get("https://www.googleapis.com/fusiontables/v1/query?sql=SELECT+*+FROM+1ns0L3nnMDTnIwnbrMwwO30ZDoQK-6b_yQRqNYY8+WHERE+'Class Happening Now?'+=+'Yes'+AND+'Region'+=+'North/Northeast'+ORDER+BY+Name+ASC&key=#{ENV['GOOGLE_API_KEY']}")
        json_response = JSON.parse(response)
        @sites = json_response["rows"]
        render :north_northeast
      elsif params[:region] == 'south_southeast'
        response = RestClient.get("https://www.googleapis.com/fusiontables/v1/query?sql=SELECT+*+FROM+1ns0L3nnMDTnIwnbrMwwO30ZDoQK-6b_yQRqNYY8+WHERE+'Class Happening Now?'+=+'Yes'+AND+'Region'+=+'South/Southeast'+ORDER+BY+Name+ASC&key=#{ENV['GOOGLE_API_KEY']}")
        json_response = JSON.parse(response)
        @sites = json_response["rows"]
        render :south_southeast
      elsif params[:region] == 'southwest'
        response = RestClient.get("https://www.googleapis.com/fusiontables/v1/query?sql=SELECT+*+FROM+1ns0L3nnMDTnIwnbrMwwO30ZDoQK-6b_yQRqNYY8+WHERE+'Class Happening Now?'+=+'Yes'+AND+'Region'+=+'Southwest'+ORDER+BY+Name+ASC&key=#{ENV['GOOGLE_API_KEY']}")
        json_response = JSON.parse(response)
        @sites = json_response["rows"]
        render :southwest
      elsif params[:region] == 'downtown'
        response = RestClient.get("https://www.googleapis.com/fusiontables/v1/query?sql=SELECT+*+FROM+1ns0L3nnMDTnIwnbrMwwO30ZDoQK-6b_yQRqNYY8+WHERE+'Class Happening Now?'+=+'Yes'+AND+'Region'+=+'Downtown'+ORDER+BY+Name+ASC&key=#{ENV['GOOGLE_API_KEY']}")
        json_response = JSON.parse(response)
        @sites = json_response["rows"]
        render :downtown
      elsif params[:region] == 'gresham'
        response = RestClient.get("https://www.googleapis.com/fusiontables/v1/query?sql=SELECT+*+FROM+1ns0L3nnMDTnIwnbrMwwO30ZDoQK-6b_yQRqNYY8+WHERE+'Class Happening Now?'+=+'Yes'+AND+'Region'+=+'Gresham'+ORDER+BY+Name+ASC&key=#{ENV['GOOGLE_API_KEY']}")
        json_response = JSON.parse(response)
        @sites = json_response["rows"]
        render :gresham
      elsif params[:region] == 'washington_county'
        response = RestClient.get("https://www.googleapis.com/fusiontables/v1/query?sql=SELECT+*+FROM+1ns0L3nnMDTnIwnbrMwwO30ZDoQK-6b_yQRqNYY8+WHERE+'Class Happening Now?'+=+'Yes'+AND+'Region'+=+'Washington County'+ORDER+BY+Name+ASC&key=#{ENV['GOOGLE_API_KEY']}")
        json_response = JSON.parse(response)
        @sites = json_response["rows"]
        render :washington_county
      elsif params[:region] == 'clark_county'
        response = RestClient.get("https://www.googleapis.com/fusiontables/v1/query?sql=SELECT+*+FROM+1ns0L3nnMDTnIwnbrMwwO30ZDoQK-6b_yQRqNYY8+WHERE+'Class Happening Now?'+=+'Yes'+AND+'Region'+=+'Clark County'+ORDER+BY+Name+ASC&key=#{ENV['GOOGLE_API_KEY']}")
        json_response = JSON.parse(response)
        @sites = json_response["rows"]
        render :clark_county
      elsif params[:region] == 'other_areas'
        response = RestClient.get("https://www.googleapis.com/fusiontables/v1/query?sql=SELECT+*+FROM+1ns0L3nnMDTnIwnbrMwwO30ZDoQK-6b_yQRqNYY8+WHERE+'Class Happening Now?'+=+'Yes'+AND+'Region'+=+'Other Areas'+ORDER+BY+Name+ASC&key=#{ENV['GOOGLE_API_KEY']}")
        json_response = JSON.parse(response)
        @sites = json_response["rows"]
        render :other_areas
      else
        render :index
      end
    end
  end
end
