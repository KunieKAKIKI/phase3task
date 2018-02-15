class PictureMailer < ApplicationMailer
  def report_mail(picture)
    @picture = picture
      mail to: @picture.user.email, subject: "写真の投稿を受け付けました"
  end
end
