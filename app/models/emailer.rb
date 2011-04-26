class Emailer < ActionMailer::Base
    def contact_email(contact)
      setup_email(contact)
      @subject    += "#{contact.subject}"
     
    end

    protected
      def setup_email(contact)
        @recipients  = "info@nagpurartgallery.com"
        @from        = "#{contact.email}"
        @subject     = "Nagpur Art Gallery - Contact Us: "
        @sent_on     = Time.now
        @content_type = "text/html"
        @body[:contact] = contact
            
      end
end






