require 'rubygems'
require 'mechanize'

# example:
#
# dialer = GoogleVoiceDialer.new('myname@gmail.com', 'password')
# dialer.dial(my_number, their_number)
# dialer.dial(my_number, another_number)
# dialer.logout	  # if you feel like it
class GoogleVoiceDialer
  def initialize(email, pass)
    @email, @pass = email, pass
  end

  def login
    agent = WWW::Mechanize.new

    agent.post("https://www.google.com/accounts/ServiceLoginAuth?service=grandcentral",
	 :Email => @email, :Passwd => @pass)
    page = agent.get('http://www.google.com/voice/')

    # @gv_number = page.root.to_s[/\{'raw': '\+(\d{11})'/, 1]
    # @auth_token = response_text[/'_rnr_se': '(.+?)'/, 1] or raise "Unable to parse auth-token"
    @auth_token = page.forms.find {|f| f.has_field?('_rnr_se') }.field_with(:name => '_rnr_se').value
    @agent = agent
    self
  end

  def logged_in?
    @agent
  end

  def dial(local_number, remote_number)
    login unless logged_in?
    @agent.post('https://www.google.com/voice/call/connect/',
	 :forwardingNumber => '+1' << local_number.gsub(/\D/, ''),
	 :outgoingNumber => remote_number.gsub(/\D/, ''),
	 :_rnr_se => @auth_token)
    self
  end

  def logout
    if @agent
      @agent.get("https://www.google.com/voice/account/signout")
      @agent = nil
    end
    self
  end
end