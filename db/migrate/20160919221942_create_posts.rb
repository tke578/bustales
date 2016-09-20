class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.integer 	:credential_id
  		t.string 	:caption_id
  		t.text 		:caption_text
  		t.string 	:caption_created_at
  		t.text 		:post_link
  		t.text 		:post_tags
  		t.float 	:location_latitude
  		t.float 	:location_logitude
  		t.string 	:location_id
  		t.text 		:location_address
  		t.string	:location_name
  		t.text 		:video_url
  		t.text    	:image_url
  	end

  end
end
