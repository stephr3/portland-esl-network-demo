class AddUrlToVolunteerSites < ActiveRecord::Migration[5.0]
  def change
    add_column :volunteer_sites, :url, :string
  end
end
