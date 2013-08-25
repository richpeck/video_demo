class PublicProfilesDefault < ActiveRecord::Migration
  def change
	change_column :profiles, :public, :boolean, default: true
  end
end
