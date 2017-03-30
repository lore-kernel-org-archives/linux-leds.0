From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Thu, 30 Mar 2017 09:43:09 +0200
Message-ID: <20170330074309.GA28533@amd>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45342 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932650AbdC3HnO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Mar 2017 03:43:14 -0400
Content-Disposition: inline
In-Reply-To: <20170330000955.GP20094@minitux>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > There is a binding for ti,lp55xx, but there's nothing I can reuse from
> > > that binding...because it's completely different hardware.
> >=20
> > Agreed, if you drop the pattern stuff from the binding, at least for no=
w.=20
>=20
> I do not have a strong preference to expose these knobs in devicetree
> and I do fear that finding some common "pattern" bindings that suits
> everyone will be very difficult.
>=20
> So I'll drop them from the binding for now.

Ok.

> > If you want driver merged quickly, I believe the best way would be to
> > leave out pattern support for now. We can merge the basic driver
> > easily to 4.12.
> >=20
>=20
> I'm not that much in a hurry and would rather see that we resolve any
> outstanding issues with the implementation of the pattern handling.

Ok, good.

> But regardless of this we still have the problem that the typical
> Qualcomm PMIC has 8 LPG-blocks and any triple could be driving a
> RGB-LED. So we would have to create some sort of in-driver-wrapper
> around any three instances exposing them as a single LED to the user.

Yes, I believe we should do the wrapping. In N900 case,=20

> I rather expose the individual channels and make sure that when we
> trigger a blink operation or enable a pattern (i.e. the two operations
> that do require synchronization) we will perform that synchronization
> under the hood.

First, we need a way to tell userspace which LEDs are synchronized,
because otherwise it will be confusing.

Second, there are more issues than just patterns with the RGB
LED. Most important is ability to set particular colors. You want to
set the RGB LED to "white", but that does not mean you can set
red=3Dgreen=3Dblue=3D1.0. You want color to look the same on LCD and on the
LED, which means coefficients for white and some kind of function for
brightness-to-PWM conversion.

> > Incremental patches sound like a good idea, yes.
> >=20
> > I'd say that testing with actual RGB LED is not a requirement... as
> > long as we design reasonable interface where the synchronizaction will
> > be easy.
> >=20
>=20
> As this relates to the board layout (which LPG-channels are hooked to a
> RGB) I think it makes sense to expose a mechanism in devicetree to
> indicate which channels should have their pattern/blink synchronized.
>=20
> We should be able to extend the LUT (the hardware that actually
> implements the pattern-walker logic) with a DT-property like:
>=20
>   qcom,synchronize-group-0 =3D <1, 2, 3>;
>   qcom,synchronize-group-1 =3D <5, 6, 7>;
>=20
> And whenever we configure a pattern involving one of the affected LEDs
> from a group we start all of them.

Yes we need some kind of grouping.

Additional complexity in the N900 case... groups can actually be
configured at run time. Original Maemo used that ability to group 6
keyboard backlight leds, and then run pattern on them. OTOH... I don't
think we _need_ to support that functionality.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljctw0ACgkQMOfwapXb+vIrMQCeIZt9fkw52hT1PppKaJg9P4+E
Eo0An1YKTHTIz7iFlaF1yVJckmImnIUA
=lvJ+
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
