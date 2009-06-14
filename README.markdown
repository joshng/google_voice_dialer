Background
----------

When I was using GrandCentral, I became accustomed to dialing my phone via QuickSilver (using a tool called Vocito (http://code.google.com/p/vocito/), which apparently died quietly with the absorbtion of GC by GOOG).  Since I've switched to Google Voice, __I CAN'T DO THIS ANY MORE__.

Now I seethe just a little every time I want to make a call.  Must rectify.  This lib is the first step; I hope to figure out the QuickSilver integration next.


Simple dialer for Google Voice in ruby
--------------------------------------

A ruby class for authenticating and dialing with Google Voice (assuming you have an account).

Currently involves scraping the GV Inbox page for the necessary auth-token.

This is shady practice; it's working right now, but might stop without warning
because GV has not released an official public API (yet?).

Dependencies
------------

Thanks to the slick [mechanize](http://mechanize.rubyforge.org/mechanize/) gem, this project was very very easy.

    $ sudo gem install mechanize


Example usage
-------------

    dialer = GoogleVoiceDialer.new('myname@gmail.com', 'password')
    dialer.dial(my_number, their_number)
    dialer.dial(my_number, another_number)
    dialer.logout	  # if you feel like it

Command-line
------------

The script also supports being run from the command-line; this could be integrated with your preferred non-ruby-based mechanism for looking up numbers:

    $ google_voice_dialer.rb <email> <password> <local-number> <remote-number>

Like this (number formats don't matter, as long as they appear as a single argument -- no spaces):

    $ google_voice_dialer.rb myname@gmail.com password 206-555-1212 2065551234

