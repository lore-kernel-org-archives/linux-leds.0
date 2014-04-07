From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/5] leds: leds-pwm: implement PWM inversion
Date: Mon, 7 Apr 2014 14:01:45 +0200
Message-ID: <20140407120143.GF26985@ulmo>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk>
 <E1WWvQI-00049e-Vl@rmk-PC.arm.linux.org.uk>
 <20140407084651.GA30127@piout.net>
 <20140407111003.GA26985@ulmo>
 <20140407113547.GB7528@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O98KdSgI27dgYlM5"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bk0-f44.google.com ([209.85.214.44]:42149 "EHLO
	mail-bk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754523AbaDGMCg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Apr 2014 08:02:36 -0400
Received: by mail-bk0-f44.google.com with SMTP id mz13so646057bkb.17
        for <linux-leds@vger.kernel.org>; Mon, 07 Apr 2014 05:02:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140407113547.GB7528@n2100.arm.linux.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org


--O98KdSgI27dgYlM5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2014 at 12:35:47PM +0100, Russell King - ARM Linux wrote:
> On Mon, Apr 07, 2014 at 01:10:05PM +0200, Thierry Reding wrote:
> > On Mon, Apr 07, 2014 at 10:46:51AM +0200, Alexandre Belloni wrote:
> > > (adding Thierry Reding)
> > >=20
> > > Hi,
> > >=20
> > > On 06/04/2014 at 23:20:18 +0100, Russell King wrote :
> > > > Some PWM outputs are wired such that the LED they're controlling is
> > > > connected to supply rather than ground.  These PWMs may not support
> > > > output inversion, or when they do, disabling the PWM may set the
> > > > PWM output low, causing a "brightness" value of zero to turn the LED
> > > > fully on.
> > > >=20
> > > > The platform data for this driver already indicates that this was
> > > > thought about, and we have the "active_low" property there already.
> > > > However, the implementation for this is missing.
> > > >=20
> > > > Add the trivial implementation for this feature.
> > > >=20
> > > > Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> > > > ---
> > > >  drivers/leds/leds-pwm.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >=20
> > > > diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> > > > index e1b4c23a409a..1d47742c551f 100644
> > > > --- a/drivers/leds/leds-pwm.c
> > > > +++ b/drivers/leds/leds-pwm.c
> > > > @@ -70,6 +70,10 @@ static void led_pwm_set(struct led_classdev *led=
_cdev,
> > > > =20
> > > >  	duty *=3D brightness;
> > > >  	do_div(duty, max);
> > > > +
> > > > +	if (led_dat->active_low)
> > > > +		duty =3D led_dat->period - duty;
> > > > +
> > > >  	led_dat->duty =3D duty;
> > > > =20
> > >=20
> > > This will conflict with my patch (which is still lacking proper revie=
w)
> > > there:
> > > http://thread.gmane.org/gmane.linux.leds/482
> > >=20
> > > I would say that it is better to hide the polarity inversion in the P=
WM
> > > driver for your specific PWM. Else we will end up with all the drivers
> > > using PWMs trying to detect whether the PWM supports inversion and if=
 it
> > > is not the case, calculating the inverted duty cycle.
> >=20
> > If the PWM hardware really does support inversion of the polarity, then
> > by all means that's what you should be using. However, and I've said
> > this a few times already, polarity inversion is not the same as
> > reversing the duty-cycle. The *effect* will be the same for LEDs and
> > backlights, but the signal is not in fact inverted.
>=20
> Sorry, for the general case, you're talking rubbish there.  The PWM layer
> does not define the starting point in the PWM cycle, so there's no precise
> definition of the exact waveform.  Therefore:
>=20
> Here's a 10% duty cycle:		~_________~_________~_________
> Here's another 10% duty cycle:		_________~_________~_________~
> which are both equally valid implementations of a 10% PWM.
>=20
> Here's a 90% duty cycle:		~~~~~~~~~_~~~~~~~~~_~~~~~~~~~_
> Here's another 90% duty cycle:		_~~~~~~~~~_~~~~~~~~~_~~~~~~~~~
> which are again both equally valid implementations of a 90% PWM.
>=20
> Here's the first 10% duty cycle,
> inverted:				_~~~~~~~~~_~~~~~~~~~_~~~~~~~~~
> which is the same as the second example of a 90% PWM signal.
>=20
> Here's the second 10% duty cycle,
> inverted:				~~~~~~~~~_~~~~~~~~~_~~~~~~~~~_
> which is the same as the first example of a 90% PWM signal.

Good, I'm glad we agree on the basics here.

> Now, if PWM did define the starting point of the wave (which it doesn't,
> or if it does, it's not documented which means we probably have loads of
> buggy drivers) then yes, there would be some grounds to object.

PWM does in fact define the starting point. And it's even documented
(see enum pwm_polarity in include/linux/pwm.h). The fact that you
thought it wasn't documented probably indicates that it's the wrong
place, so perhaps you can suggest a better location. One where you
would've looked.

The convention defined there does match the example signals that you
gave above.

> In any case, we probably already have drivers which implement both
> variants of the 10% signal, so really there's no grounds to say "a 90%
> duty cycle is not the same as an inverted 10% duty cycle signal".

Like you said, since it's documented any of the drivers that implement
it wrongly should then be considered buggy. After all the documentation
was there from the beginning (commit 0aa0869c3c9b "pwm: Add support for
configuring the PWM polarity").

One of the reasons that I insisted on having this defined rigorously is
that all the way back when I took on maintainership there was a fair bit
of discussion and somebody (unfortunately I no longer recall where or
who) did mentioned that PWMs are used to trigger processes (I vaguely
remember synchronization of multiple processes being an issue as well).
One of the points made during the discussion was that polarity was
indeed important for certain use-cases and hence the rigorous definition
of enum pwm_polarity.

There's of course the issue that there could be hardware that doesn't
allow changing the polarity but doesn't produce the signal as expected
by the "normal" polarity. The only way I can think of handling that
situation would be to allow drivers to provide a .get_polarity() and
have client drivers chicken out if they can't cope with it. Nobody's
ever had any incentive to be that rigorous, probably because all drivers
really care about is the power of the signal.

> The electronic engineer in me says you're talking rubbish too, from the
> point of view of designing stuff to produce a PWM signal.

Can you please elaborate. I don't understand what you're saying.

Thierry

--O98KdSgI27dgYlM5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTQpOnAAoJEN0jrNd/PrOhKD8P/j+5ny7Ahe8xQmELrTY6DX4n
0J2mIgN0F+sU3KSfqevwGNVDxB7hPtPUQ7WQlhPdCj2Q+ImiK8i9cGJ1mHl/AlPe
X7q/CW1rBqyBqANjCTx5cal+FCdxZlf4GqMcUOARYNk/NkDI3RaTVGCQQEuB4u25
KNLcGH+90srx7tSmcPV5wPwi70MZhr33V4Fxe65L4wKmH/Xfq1MqwFAH4qzPEnAB
b3x5XIfb0ycKrQTphVYi+kUbHgu225h2xKYOpdVrryuhzwyVI4TSnzaAg5qRn7dh
KHmWKFsLDBhnd6xxLt+wQm363BNO/D7+QZkQFakTe07rawqiuon5ZJkUGt31SY2y
B8O6+LX81iJoUdgC8W53h0ulfjDub65kfvEqF6y5jG7pyENwMCTogl0jdFz+oTj1
zZT9KEI2mRVMg6rI2wgFFo/tDBN+s6uSZdGDBTogJuEIL1WisjbiPeY37zfW5PTF
Xnt5plJ0QqSQXqtiMazakT9a/I1OkgCbqAPV1OYnNBc1xYvXq6q24oHmUH61WbcG
/7KKIKCpU6fL/Iq0H3etTf6KQJO8x4f6RzIz5/sJYqJoKr1dMe3djKBmJ0OaOogi
e4b8dOtsQWUnYaMVsRtw/bZ43jvo4QE8kSQytDKbWlQ6wwTnSOyxrPDLLioE8vyF
xSLbksSYsVRK54PigVp6
=EaZH
-----END PGP SIGNATURE-----

--O98KdSgI27dgYlM5--
