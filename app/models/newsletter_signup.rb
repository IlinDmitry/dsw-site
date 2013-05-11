class NewsletterSignup < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  after_create :subscribe_via_mailchimp

  def subscribe_via_mailchimp(list_id = ENV['NEWSLETTER_LIST_ID'])
    Gibbon.new.list_subscribe({:id => list_id, :email_address => self.email, :merge_vars => {:FNAME => self.first_name, :LNAME => self.last_name}})
  end

end
