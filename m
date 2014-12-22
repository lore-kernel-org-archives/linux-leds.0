From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCHv2] DT: leds: Add flash LED devices related properties
 (fwd)
Date: Mon, 22 Dec 2014 23:27:47 +0100
Message-ID: <20141222222747.GA19786@amd>
References: <20141222114514.GA20386@amd>
 <CAK5ve-JPcYALSMEy+b_S0y5XrYzbsNbLg+ggKuMf0bLHr+k0Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK5ve-JPcYALSMEy+b_S0y5XrYzbsNbLg+ggKuMf0bLHr+k0Hg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>
List-Id: linux-leds@vger.kernel.org

On Mon 2014-12-22 10:35:20, Bryan Wu wrote:
> On Mon, Dec 22, 2014 at 3:45 AM, Pavel Machek <pavel@ucw.cz> wrote:
> >
> > Addition of a LED Flash class extension entails the need for flash LED
> > specific device tree properties. The properties being added are:
> > max-microamp, flash-max-microamp, flash-timeout-microsec.
> >
> > Signed-off-by: Pavel Machek <pavel@ucw.cz>
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> >
> > ---
> >
> > This will allow me to add device tree support for adp1653 i2c flash
> > LED driver, and allow Jacek Anaszewski to add support for more LED
> > drivers..
> >
> > Rob Herring requested to change microsec to us.
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
> > +- flash-timeout-us : timeout in microseconds after which the flash
> > +                     LED is turned off
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
> 
> Looks like you forget to update this flash-timeout-microsec to flash-timeout-us?
> And I think changing -microamp to -uamp is more consistent here.

No, we want to be consistent with regulators, as Rob agreed.

You have v3 in the mailbox.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
