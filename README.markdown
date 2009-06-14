A Story
---------

It didn't take me long to become hard-wired to use QuickSilver to dial my phone via GrandCentral (using a tool called Vocito, which apparently died quietly with the absorbtion of GC by GOOG).  Now since I've switched to Google Voice, __I CAN'T DO THIS ANY MORE__.

This makes me go slightly loopy every time I want to make a call, so I must rectify.


Simple dialer for Google Voice in ruby
--------------------------------------

Dials your phone programmatically (assuming you have a google-voice account).

Currently involves scraping the GV Inbox page for the necessary auth-token.

This is shady practice; it's working right now, but might stop without warning
because GV has not released an official public API.

Dependencies
------------

Thanks to the very cool [mechanize](http://mechanize.rubyforge.org/mechanize/) gem, this project was very very easy.

    sudo gem install mechanize

Example usage:

    dialer = GoogleVoiceDialer.new('myname@gmail.com', 'password')
    dialer.dial(my_number, their_number)
    dialer.dial(my_number, another_number)
    dialer.logout	  # if you feel like it

