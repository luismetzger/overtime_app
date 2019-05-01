@user = User.create!(email: "test@example.com", first_name: "John", last_name: "Doe", password: "asdf123", password_confirmation: "asdf123")

p "1 user created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

p "100 Posts have been created!"