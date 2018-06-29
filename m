From: Andreas Klinger <ak@it-klinger.de>
Subject: Re: [PATCH] leds: ledtrig-morse: send out morse code
Date: Fri, 29 Jun 2018 08:41:48 +0200
Message-ID: <20180629064147.GA3219@arbeit>
References: <20180628134227.GA1719@arbeit>
 <20180628185630.GA6095@amd>
 <20180628202955.GA1534@imap.1und1.de>
 <20180628204516.GA29146@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180628204516.GA29146@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: pavel@ucw.cz, jacek.anaszewski@gmail.com, ben.whitten@gmail.com, geert+renesas@glider.be, w@1wt.eu, pombredanne@nexb.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

Pavel Machek <pavel@ucw.cz> schrieb am Thu, 28. Jun 22:45:
> On Thu 2018-06-28 22:29:57, Andreas Klinger wrote:
> > Hi Pavel,
> > 
> > Pavel Machek <pavel@ucw.cz> schrieb am Thu, 28. Jun 20:56:
> > > Hi!
> > > 
> > > > Send out a morse code by using LEDs.
> > > > 
> > > > This is useful especially on embedded systems without displays to tell the
> > > > user about error conditions and status information.
> > > > 
> > > > The trigger will be called "morse"
> > > > 
> > > > The string to be send is written into the file morse_string and sent out
> > > > with a workqueue. Supported are letters and digits.
> > > > 
> > > > With the file dot_unit the minimal time unit can be adjusted in
> > > > milliseconds.
> > > > 
> > > > Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> > > 
> > > Can we get more general "pattern" trigger? Some LEDs can do that in
> > > hardware, and it is more general than plain morse.
> > > 
> > > Ouch and it already was implemented :-). Patch is in attachment.
> > 
> > The idea of the morse trigger is so be able so send out a short error
> > code or if needed also a complete sentence. The morse code don't need
> > extra explanation to the user. Decoding can be found everywhere.
> 
> Yeah, well... I don't think decoding sentences in morse code is going
> to be much fun.
> 
> And we don't really want encoder in kernel. Just do encoding in
> userspace, and use pattern trigger to display it.
> 
> For many uses, morse code is "too geeky", and other patterns will be
> used.
> 
> Like " X    " for error 1, " X X     " for error 2, " .xX .xX " for
> charging, " .xXx. " for everything okay...
> 

The hardware i'm using is not able to adjust brightness. It can just switch the
LED on or off. That's it.

If anybody is interested i can submit a version 2 of the morse trigger with the
improvements suggested by Greg and Geert. Please let me know.

Andreas


> > With the pattern trigger one need a translation of the letters and
> > numbers into morse code. This is what the morse trigger is doing.
> > 
> > So from my perspective the pattern trigger is something different than
> > the morse one.
> 
> Well, pattern trigger is more generic, and can do everything morse
> trigger can do. Lets do that instead.
> 
> > Another question:
> > The pattern trigger is not in mainline. Do you know why?
> 
> Needs to be resubmitted, I'd say.
> 
> 								Pavel
> 
> > > +++ b/Documentation/leds/ledtrig-pattern.txt
> > > @@ -0,0 +1,86 @@
> > > +LED Pattern Trigger
> > > +===================
> > > +
> > > +This is a LED trigger allowing arbitrary pattern execution. It can do gradual
> > > +dimming. This trigger can be configured to repeat the pattern a number of
> > > +times or indefinitely. This is intended as a way of communication for embedded
> > > +systems with no screen.
> > > +
> > > +The trigger can be activated from user space on LED class devices as shown
> > > +below:
> > > +
> > > +  echo pattern > trigger
> > > +
> > > +This adds the following sysfs attributes to the LED:
> > > +
> > > +  pattern - specifies the pattern. See syntax below.
> > > +
> > > +  repeat - number of times the pattern must be repeated.
> > > +	writing -1 to this file will make the pattern
> > > +	repeat indefinitely.
> > > +
> > > +The pattern will be restarted each time a new value is written to
> > > +the pattern or repeat attribute. When dimming, the LED brightness
> > > +is set every 50 ms.
> > > +
> > > +pattern syntax:
> > > +The pattern is specified in the pattern attribute with an array of comma-
> > > +separated "brightness/length in miliseconds" values. The two components
> > > +of each value are to be separated by a space.
> > > +
> > > +For example, assuming the driven LED supports
> > > +intensity value from 0 to 255:
> > > +
> > > +  echo 0 1000, 255 2000 > pattern
> > > +
> > > +Or:
> > > +
> > > +  echo 0 1000, 255 2000, > pattern
> > > +
> > > +Will make the LED go gradually from zero-intensity to max (255) intensity
> > > +in 1000 milliseconds, then back to zero intensity in 2000 milliseconds:
> > > +
> > > +LED brightness
> > > +    ^
> > > +255-|       / \            / \            /
> > > +    |      /    \         /    \         /
> > > +    |     /       \      /       \      /
> > > +    |    /          \   /          \   /
> > > +  0-|   /             \/             \/
> > > +    +---0----1----2----3----4----5----6------------> time (s)
> > > +
> > > +
> > > +
> > > +To make the LED go instantly from one brigntess value to another,
> > > +use zero-time lengths. For example:
> > > +
> > > +  echo 0 1000, 0 0, 255 2000, 255 0 > pattern
> > > +
> > > +Will make the LED stay off for one second, then stay at max brightness
> > > +for two seconds:
> > > +
> > > +LED brightness
> > > +    ^
> > > +255-|        +---------+    +---------+
> > > +    |        |         |    |         |
> > > +    |        |         |    |         |
> > > +    |        |         |    |         |
> > > +  0-|   -----+         +----+         +----
> > > +    +---0----1----2----3----4----5----6------------> time (s)
> > > +
> 
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
