require "firebase_admin"
require "json"
require "googleauth"

class FirebaseService
  def self.client
    credentials = JSON.parse(File.read(Rails.root.join("config", "firebase", "serviceAccountKey.json")))
    FirebaseAdmin::Firestore.new(credentials)
  end

  def self.get_user(uid)
    client.doc("users/#{uid}").get
  end

  def self.create_user(uid, email, display_name)
    client.doc("users/#{uid}").set({
      email: email,
      display_name: display_name,
      xp: 0,
      level: 1,
      stats: {}
    })
  end

  def self.update_user_xp(uid, xp)
    user_ref = client.doc("users/#{uid}")
    user_data = user_ref.get.data
    new_xp = user_data["xp"] + xp
    user_ref.update({ xp: new_xp })
  end
end
