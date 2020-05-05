# Preview all emails at https://0a40516caf78418495510c44a3ce42e3.vfs.cloud9.us-east-2.amazonaws.com/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at
  # https://0a40516caf78418495510c44a3ce42e3.vfs.cloud9.us-east-2.amazonaws.com/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  # Preview this email at
  # https://0a40516caf78418495510c44a3ce42e3.vfs.cloud9.us-east-2.amazonaws.com/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end
end
