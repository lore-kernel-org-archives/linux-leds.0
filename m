From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH V5 3/8] backlight: qcom-wled: Add new properties for
 PMI8998
Date: Mon, 27 Aug 2018 12:01:43 +0200
Message-ID: <20180827100143.GE31905@amd>
References: <1535106467-17843-1-git-send-email-kgunda@codeaurora.org>
 <1535106467-17843-4-git-send-email-kgunda@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0900442710=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1535106467-17843-4-git-send-email-kgunda@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-arm-msm@vger.kernel.org, lee.jones@linaro.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--===============0900442710==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Content-Disposition: inline


--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri 2018-08-24 15:57:42, Kiran Gunda wrote:
> Update the bindings with the new properties used for
> PMI8998.

> Changes from V3:
>     - Removed the default values.

Why?

> +- qcom,current-limit-microamp
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   uA; per-string current limit; value from 0 to 30000 with
> +		      2500 uA step.
> =20
>  - qcom,current-boost-limit
>  	Usage:        optional
>  	Value type:   <u32>
>  	Definition:   mA; boost current limit.
>  		      For pm8941: one of: 105, 385, 525, 805, 980, 1260, 1400,
> -		      1680. Default: 805 mA
> +		      1680.
>  		      For pmi8998: one of: 105, 280, 450, 620, 970, 1150, 1300,
> -		      1500. Default: 970 mA
> +		      1500.
>

I'd say that optional properties should list default values...?

>  - qcom,ovp
>  	Usage:        optional
>  	Value type:   <u32>
>  	Definition:   V; Over-voltage protection limit; one of:
> -		      27, 29, 32, 35. default: 29V
> +		      27, 29, 32, 35.
>  		      This property is supported only for PM8941.
>

Same here.

> +- qcom,ovp-millivolt
> +	Usage:        optional
> +	Value type:   <u32>
> +	Definition:   mV; Over-voltage protection limit;
> +		      For pmi8998: one of 18100, 19600, 29600, 31100
> +		      If this property is not specified for PM8941, it
> +		      falls back to "qcom,ovp" property.
> +

"voltage-limit-millivolt"? "ovp" is not really well known acronym.
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAluDzAcACgkQMOfwapXb+vIp1gCfb3HRiCG01VfOcS0fmSAkZALF
eMsAoJ9WOxCqP7mQKiPdgicGXubmhmzN
=Ap6I
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--

--===============0900442710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0900442710==--
