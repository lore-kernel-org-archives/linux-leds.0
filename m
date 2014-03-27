From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] leds: add DT support for LEDs wired to supply and
 default brightness
Date: Thu, 27 Mar 2014 23:57:52 +0100
Message-ID: <20140327225752.GD15793@pengutronix.de>
References: <E1WJUvl-0003wc-0S@rmk-PC.arm.linux.org.uk>
 <CAK5ve-+K+R=c7Lp+JaTCOcq9LYHTszQQg9Xp1fQHxqcQ2cVHHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:50958 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757179AbaC0W6a (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Mar 2014 18:58:30 -0400
Content-Disposition: inline
In-Reply-To: <CAK5ve-+K+R=c7Lp+JaTCOcq9LYHTszQQg9Xp1fQHxqcQ2cVHHw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Thu, Mar 27, 2014 at 03:28:32PM -0700, Bryan Wu wrote:
> On Fri, Feb 28, 2014 at 1:25 PM, Russell King
> <rmk+kernel@arm.linux.org.uk> wrote:
> > Some PWM outputs are wired such that the LED they're controlling is
> > connected to supply rather than ground.  Therefore, the duty cycle
> > needs to be inverted to make the LED behave as it should do.
> >
> > We also provide a way to specify the default brightness when a
> > trigger is not specified.
> >
> > Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> > ---
> >  Documentation/devicetree/bindings/leds/leds-pwm.txt |  3 +++
> >  drivers/leds/leds-pwm.c                             | 15 +++++++++=
++----
> >  2 files changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/=
Documentation/devicetree/bindings/leds/leds-pwm.txt
> > index 7297107cf832..ffcb74ab61fd 100644
> > --- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
> > +++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
> > @@ -13,6 +13,9 @@ node's name represents the name of the correspond=
ing LED.
> >    For the pwms and pwm-names property please refer to:
> >    Documentation/devicetree/bindings/pwm/pwm.txt
> >  - max-brightness : Maximum brightness possible for the LED
> > +- default-brightness : (optional) Default brightness for the LED
> > +- active-low : (optional) For PWMs where the LED is wired to suppl=
y
> > +  rather than ground.
> >  - label :  (optional)
> >    see Documentation/devicetree/bindings/leds/common.txt
> >  - linux,default-trigger :  (optional)
>=20
> Why remove "max-brightness", "label" and "linux,default-trigger" here=
?
They are not removed, they are just unchanged list items after literal
'-'s in the context of the patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
