Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264FC5908DD;
	Tue,  8 Sep 2026 18:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890625; cv=none; b=t3Z/TeCTJQsj3SwzHWLk2ak92EIQZD3tvhDVd1hlyyERGhRVn2Eeb2DjlRUIszMrxStIr/7/iOeXR/p3iUGnKUN6YHeyLk+uk3+DXkPwQ1rnWhQ36HuMJuCrhD2OP62LbC5jDdp7J5brTBDT6OHHTZ35qegJdmDPmkY1GKmi1x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890625; c=relaxed/simple;
	bh=g8gaWVtpR0N2D+c50/zh69oZ3JLwsmCAyGVWni76RhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6qSBnR5152SEvstzU1eQxdI4elKODiVyaBteL6cV7tGPKlrSiPGrA1y8mTQHU51O7juLoDEPob9jxW6dJ9epJ9/T3ljIK/eWE4tccV7/BzFgkFY20/Z8XK8BzI63Te6Yl9l93MjMSdr7O8ERrxsB9DvjSrM0ci+TdicLHFYCbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9PBGEno; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9PBGEno"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8761D1F00A3A;
	Tue,  8 Sep 2026 18:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890624;
	bh=iKTjKW+fOiZeD1KxQV7HvuEp3nfVuLzMeXDXviM50ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G9PBGEnox/B03RmcJTj6GOEOJ2qkVvUWF6CPbvaoFkOQD331PQK04+RDNJo0fE5FF
	 c8MKgTTz+UkvhA8PmZp9qDmKwHz/rqHV10ijX7hSOb6ftmOl2BSxtlkbEr9AuazGoZ
	 QpTBwffg5VcgqgjDtFqIfoAG8cneHxb+H86oGbiuB8iG5MXAdPS00ASSmDE4fQSnZZ
	 vX8F66RjHA8Z0eH4yX3Aw0afG76YgGuJ7DuvTELDCIcpk3NEs6tjGqC3PWAQwSz2fT
	 y8eo6bPtm5EuHJkpSkSFdJxCdbCZ24MpbqEu3jm2b8j0kRJ4I3gC0f4rw25K2J7IXj
	 lm5V3NxKOQwhw==
Date: Tue, 8 Sep 2026 19:03:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nikita Travkin <nikitos.tr@gmail.com>,
	Alexey Min <alexeymin@minlexx.ru>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH RFC 1/3] dt-bindings: leds: aw2013: Add aw2027 compatible
 and rename to aw20xx
Message-ID: <20260908-sample-onshore-a2cf8af658b4@spud>
References: <20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org>
 <20260907-aw2013-aw20xx-rename-v1-1-c9a7df12a701@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xN1OfmFunrnmuw20"
Content-Disposition: inline
In-Reply-To: <20260907-aw2013-aw20xx-rename-v1-1-c9a7df12a701@postmarketos.org>

--xN1OfmFunrnmuw20
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 04:47:51PM -0700, Paul Sajna wrote:
> Document the awinic,aw2027, which is very similar to aw2013.
> Rename the driver to support all of the 20xx series.
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  .../bindings/leds/{leds-aw2013.yaml =3D> leds-aw20xx.yaml}       | 10 ++=
++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Do=
cumentation/devicetree/bindings/leds/leds-aw20xx.yaml
> similarity index 91%
> rename from Documentation/devicetree/bindings/leds/leds-aw2013.yaml
> rename to Documentation/devicetree/bindings/leds/leds-aw20xx.yaml
> index 26238446f2bd..f20b5344e3e1 100644
> --- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-aw20xx.yaml

Please retain a filename matching a compatible. IOW, leave this alone.
pw-bot: changes-requested

The rest of this is fine, but please note in your commit message what
makes this device different to the existing one.

Thanks,
Conor.

> @@ -1,21 +1,23 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
> +$id: http://devicetree.org/schemas/leds/leds-aw20xx.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: AWINIC AW2013 3-channel LED Driver
> +title: AWINIC AW20XX 3-channel LED Driver
> =20
>  maintainers:
>    - Nikita Travkin <nikitos.tr@gmail.com>
> =20
>  description: |
> -  The AW2013 is a 3-channel LED driver with I2C interface. It can control
> +  The AW20XX is a 3-channel LED driver with I2C interface. It can control
>    LED brightness with PWM output.
> =20
>  properties:
>    compatible:
> -    const: awinic,aw2013
> +    enum:
> +      - awinic,aw2013
> +      - awinic,aw2027
> =20
>    reg:
>      maxItems: 1
>=20
> --=20
> 2.55.0
>=20

--xN1OfmFunrnmuw20
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBN+wAKCRB4tDGHoIJi
0mihAQDYRW3Dc+tmgQeM9ZVjwjmMEmIKNmrerr12ozj7zbw/VwEA1Bn5tdnnzeDt
Nry9qwkRP7pEKTIM3vQgS8iE5Gnb6g0=
=tgWJ
-----END PGP SIGNATURE-----

--xN1OfmFunrnmuw20--
