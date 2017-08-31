From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
Date: Fri, 01 Sep 2017 08:32:16 +0930
Message-ID: <1504220536.5933.32.camel@aj.id.au>
References: <20170828001711.19662-1-andrew@aj.id.au>
         <20170828001711.19662-2-andrew@aj.id.au>
         <20170831212840.ecr2p4nra52xvzrz@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-eP7A03YBeSElujE3UVdG"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170831212840.ecr2p4nra52xvzrz@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
List-Id: linux-leds@vger.kernel.org


--=-eP7A03YBeSElujE3UVdG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, 2017-08-31 at 16:28 -0500, Rob Herring wrote:
> On Mon, Aug 28, 2017 at 09:47:10AM +0930, Andrew Jeffery wrote:
> > On Baseboard Management Controller (BMC) systems it's sometimes
> > necessary for a LED to retain its state across a BMC reset (which is
> > independent of the host system state). Add a devicetree property to
> > describe this behaviour. The property would typically be used in
> > conjunction with 'default-state =3D "keep"'.
>=C2=A0
> A bit quick on the applying of this...
>=C2=A0
> I don't understand how this works. The BMC usecase is interesting but=C2=
=A0
> that's fairly irrelevant to the binding. How do you know the GPIO state=
=C2=A0
> thru a reset?

The answer to that is a property of the system design in my opinion.

> You're doing a core reset, but not reseting the GPIO=C2=A0
> controller?

Well, in my specific case, the GPIO controller in question isn't on the SoC=
,
it's off-chip behind an I2C bus. Powering off a BMC doesn't necessarily mea=
n
removing power from its peripherals, so in this case the their state is
maintained.

Alternatively, and again in my specific (Aspeed) case, the on-SoC GPIO
controller can be selectively reset with respect to the rest of the SoC, or
individual GPIO lines can be marked as reset-tolerant. This gives the same
capability and is what you've suggested above.

>=C2=A0
> When you use 'default-state =3D "keep"' but not this property? Seems like=
=C2=A0 the
> same thing to me.

Is that not also true of retain-state-suspend?

The existing behaviour of leds-gpio was to turn the managed LEDs off in the
remove() path. To me this was unexpected behaviour, but it is what it is. M=
y
first pass at the patch (before I sent it out) was to do as you suggest and
only turn it off in the absence of 'default-state =3D "keep"'.=C2=A0=C2=A0H=
owever there
were quite a number of users of that configuration, and this could be an
unexpected change of behaviour. Given retain-state-suspend was already defi=
ned,
it seemed that the non-breaking way to get the behaviour I desired was to
introduce retain-state-shutdown.

Sure, this is dealing with problems in the driver and not describing hardwa=
re,
but at this point the behaviour is already in place and people might be rel=
ying
on it.

> Presumably the bootloader would just distinguish=C2=A0 between a
> warm and cold reset to decide whether to re-init the state.
>=C2=A0
> Finally, if we do have this property, why is it GPIO specific. You could=
=C2=A0
> just as easily have a LED controller IC and want to do the same thing.

I don't think we're precluded from making it more general even if it's
submitted as specific to leds-gpio? I don't have anything against making it
more generic. I was tossing up about doing so, but went for the specific ca=
se
first because we could make it more generic without problems. Going the oth=
er
way is harder.

Cheers,

Andrew
--=-eP7A03YBeSElujE3UVdG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZqJV4AAoJEJ0dnzgO5LT5mF4P/0egTA7vdWrGTQhuNK+zv017
ms8+ioro5fatH1hywcEUCTciyq+lIBtzMIswqcTa9WazyP0COh3k5kK30vYNrz6Q
44HOTFDKYUieohf9SMsuakcHhzYyB/+fgM60zGQ7Nbe8COtEFPutLUUjT3GvSiFt
Y/iSaP6r5/xcK0ZvcV8YKhq1ZUgN77yiSIk2r5rBwlMYFY1pj5Ue7IKvsSjlRMTs
CWe0YrGqu+KrytzzmlJToBnko2qUSumxmBKWPOD5etFPGuK3B7WfBRPGmucBr7mS
OtE6GR3iAiYYXZ+xUUFX/XWq9SohhM1V4Fl9/181HMiZnccTNfiji8xKW8+lRnOQ
e+K3k9ErwIU3ZG8FIixjjwMEwQN2URiHTQytVSaoNd8jhoI+P30Gc9wKdKQhniaH
xA/zku7+dtRBqcASWLBTUm464ZQOq214lrCVVWiOqW8ZQzZ+msc3ZfkFh/Flq9Lc
K0LxsD8E1wgOXLR//NYon0xsMtj7CHI+W9S5Z+CC5Rc9PMkHCmJPkW8VWIPvPWUp
vC687X/iN2mXSpwMZXEn6mXeB6xXrQS4qFPB7iCs89saiC9074pO5/KuTKBy3YkJ
JWjr5X85+2w6/oRS5GkFt1KPD+ynlQ0Q/75HwuZscFh2OnM/0ulcY2mHQH8TwEnf
3mcJgnsjTmZIRf7g7ZhW
=PgUn
-----END PGP SIGNATURE-----

--=-eP7A03YBeSElujE3UVdG--
