Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EB14195BB;
	Thu,  9 Jul 2026 18:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783620233; cv=none; b=joDEpkUiD0VFn3lbu7+hWS1jn5hFJE+pDlr2ni8cbloj8avwhSS4mkv58y+kRhrSbXOilC768yBpw0pjiMwkvIsu5HWzbG+FjqBiyP3cXBcl0gY0k+bsZTiJOzmWbeOnai2Mtoaac6RwGgSzQ6DRCYLVThVeAJWBmvJ4zM8Kvvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783620233; c=relaxed/simple;
	bh=4gt/DtEbA+N6ETtW9fXQMTK7/FqYplXc9rzTb7mC/OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a59JBXE2feXCBQ8NiJNEF7MmAHrJLRuf7AIsjw31cKL7VfFWTmJy6CwL83gpLZaS/6q5MgR0O1YcuXl/llpawt3HxYxdcW/3cFJ4EpCo9vDrm02fUti4d4ga7K364VfBtOyd/Sq84avpphUuZ6U7njPshSAuCx6L/o1EUdjFB3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5x82ZRF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5x82ZRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C201F000E9;
	Thu,  9 Jul 2026 18:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783620231;
	bh=Gl3mdu01+YhSNina+Rf2K+m8lgx/CpuAdVmfkE0g9Uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T5x82ZRFx/+jd0n0a/6VDdNTEACrCIrQmkwZp/9jzcC0LuaCtGcLQmrzpNwvExtU/
	 jEgKimy2naDK6Ak7Crg8Nvb8AiCFjc85eb9ZjBlHUM6wZmIf1mu8U7XR4BjPWjod9A
	 /z3hTkSoFD5KclhgyxvLMSgUAtqhXEibBg//p7JRTQjqOkW3tXr9h381Juw6ZKWvSB
	 Q1pkh2bRnt8/lZWEzmExsKSRzoOO+qEsTnD+WiJ9vyAf3uPJGdeAb9lC+js7yz0oLo
	 Oia9IxrPp6DvYUISsxExvIbyC0P3dtVwrdZqCn76HB4XAGO/YxVJc/kH0lhocUuSv5
	 jrJUoP9rYimyA==
Date: Thu, 9 Jul 2026 19:03:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: leds-group-multicolor: Introduce
 default-intensity
Message-ID: <20260709-outsell-undamaged-6c8045d6115f@spud>
References: <20260708224652.106632-1-wahrenst@gmx.net>
 <20260708224652.106632-2-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cMIjV14YmPuG/d5f"
Content-Disposition: inline
In-Reply-To: <20260708224652.106632-2-wahrenst@gmx.net>

--cMIjV14YmPuG/d5f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 12:46:51AM +0200, Stefan Wahren wrote:
> Currently it's not possible to specify the initial color of a LED group
> during boot. So introduce a new property similar to default-brightness,
> which specifies the intensity of each LED in the group.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../devicetree/bindings/leds/leds-group-multicolor.yaml    | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor=
=2Eyaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> index 5c9cfa39396b..18b722b807ba 100644
> --- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> @@ -19,6 +19,12 @@ properties:
> =20
>    leds: true
> =20
> +  default-intensity:
> +    description:
> +      Intensity to be set for each individual LED. Used only during
> +      initialization. If the property is not set then max intensity is u=
sed.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

Hmm, there's already a property proposed and applied for this:
https://lore.kernel.org/linux-leds/20260605-multicolor-default-v2-1-ed07271=
df6b0@pengutronix.de/
It only supports a single value, I suspect you'll have to rework this so
as not to conflict with existing property?
leds-group-multicolour imports the common leds properties after all.
Probably the one in common.yaml needs to become an array?

> +
>  required:
>    - leds
> =20
> @@ -56,6 +62,7 @@ examples:
>          color =3D <LED_COLOR_ID_RGB>;
>          function =3D LED_FUNCTION_INDICATOR;
>          leds =3D <&led0>, <&led1>, <&led2>;
> +        default-intensity =3D <1 0 0>;
>      };
> =20
>  ...
> --=20
> 2.43.0
>=20

--cMIjV14YmPuG/d5f
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/igwAKCRB4tDGHoIJi
0kYvAQDFqW0granAQsEhZOoMpPAZ5c+XR6miwCiQip2Plg32FgEAll9FCkvOHIQ+
1XcfbmM057Nfx+7JZO0CESBxAGjoywE=
=tmFt
-----END PGP SIGNATURE-----

--cMIjV14YmPuG/d5f--
