From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] DT: leds: Add Qualcomm Light Pulse Generator binding
Date: Thu, 30 Mar 2017 00:13:27 +0200
Message-ID: <20170329221327.GA7977@amd>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323055435.29197-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:36130 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932255AbdC2WNb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Mar 2017 18:13:31 -0400
Content-Disposition: inline
In-Reply-To: <20170323055435.29197-2-bjorn.andersson@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +- qcom,pattern:
> +	Usage: optional
> +	Value type: <u16-list>
> +	Definition: list of 16 bit duty cycle values to make up the pattern to
> +		    be programmed into the LUT. Values should be in the range
> +		    [0,512).
> +
> +- qcom,pattern-length-ms:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: duration, in milliseconds, of the ramp generator running
> +		    one pass over the defined pattern
> +
> +- qcom,pattern-pause-lo-ms:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: duration, in milliseconds, for the ramp generator to pause
> +		    before iterating over the pattern
> +
> +- qcom,pattern-pause-hi-ms:
> +	Usage: optional
> +	Value type: <u32>
> +	Definition: duration, in milliseconds, for the ramp generator to pause
> +		    after iterating over the pattern
> +
> +- qcom,pattern-ping-pong:
> +	Usage: optional
> +	Value type: <boolean>
> +	Definition: denotes that the ramp generator should reverse direction
> +		    when reaching the end of the pattern, instead of wrapping
> +		    to the beginning
> +
> +- qcom,pattern-oneshot:
> +	Usage: optional
> +	Value type: <boolean>
> +	Definition: denotes that the ramp generator should stop after a single
> +		    pass over the pattern
> +
> +- qcom,pattern-reverse:
> +	Usage: optional
> +	Value type: <boolean>
> +	Definition: denotes that the ramp generator should operate backwards
> +		    over the pattern

I'd not do this. While we _may_ want to specify default trigger and
default blinking behaviour, we should do it in a way that is common
for all the drivers.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljcMYcACgkQMOfwapXb+vIlvACfelqjrDDsbHb7an3NGXwK9B6k
I5oAniaVToc03OcG9dmUSJ2lLKIsyy0Y
=g6j4
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
