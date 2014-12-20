From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH w/ acks] DT: leds: Add flash LED devices related
 properties
Date: Sat, 20 Dec 2014 16:02:52 +0100
Message-ID: <20141220150252.GA8777@amd>
References: <20141120131713.GC27527@amd>
 <20141203185746.GA25267@amd>
 <CAK5ve-JDOMHyu+meKgA8Xs08pio9OENg7p1zNka4NNgy5WOejg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK5ve-JDOMHyu+meKgA8Xs08pio9OENg7p1zNka4NNgy5WOejg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>
List-Id: linux-leds@vger.kernel.org

On Wed 2014-12-03 11:03:59, Bryan Wu wrote:
> On Wed, Dec 3, 2014 at 10:57 AM, Pavel Machek <pavel@ucw.cz> wrote:
> >
> > Addition of a LED Flash class extension entails the need for flash LED
> > specific device tree properties. The properties being added are:
> > max-microamp, flash-max-microamp, flash-timeout-microsec.
> >
> > Signed-off-by: Pavel Machek <pavel@ucw.cz>
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> >
> 
> Thanks a lot, let me wait for one ack from Device Tree maintainers, as
> it's a pure device tree patch.

Well, it looks like device tree maintainers don't care. But the patch
is not obviously bad, because they'd scream bloody murder by now...

> Rob, can you help to give a review and ack?

...so can we get it in, please?

								Pavel

> > This will allow me to add device tree support for adp1653 i2c flash
> > LED driver, and allow Jacek Anaszewski to add support for more LED
> > drivers..
> >
> >
> > diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> > index 2d88816..e9acbbc 100644
> > --- a/Documentation/devicetree/bindings/leds/common.txt
> > +++ b/Documentation/devicetree/bindings/leds/common.txt
> > @@ -14,6 +14,15 @@ Optional properties for child nodes:
> >       "ide-disk" - LED indicates disk activity
> >       "timer" - LED flashes at a fixed, configurable rate
> >
> > +- max-microamp : maximum intensity in microamperes of the LED
> > +                (torch LED for flash devices)
> > +- flash-max-microamp : maximum intensity in microamperes of the
> > +                       flash LED; it is mandatory if the LED should
> > +                      support the flash mode
> > +- flash-timeout-microsec : timeout in microseconds after which the flash
> > +                           LED is turned off
> > +
> > +
> >  Examples:
> >
> >  system-status {
> > @@ -21,3 +30,10 @@ system-status {
> >         linux,default-trigger = "heartbeat";
> >         ...
> >  };
> > +
> > +camera-flash {
> > +       label = "Flash";
> > +       max-microamp = <50000>;
> > +       flash-max-microamp = <320000>;
> > +       flash-timeout-microsec = <500000>;
> > +}
> >
> >
> > --
> > (english) http://www.livejournal.com/~pavelmachek
> > (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
