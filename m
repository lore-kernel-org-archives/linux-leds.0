Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36347604E;
	Wed,  7 Oct 2026 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369060; cv=none; b=idJAhioMupXIbunF8RaOYJr/68JSqomZc73a2vbvX79uvB3C7HtKWXsAvXFnw5JZLjU+9d8tZIUm+sjD8f71A6qNlMrBCmEfJztmySG6Nb2Tgd2TyfeGNihl7r5O0jq4smarycxkQpc+4pHVe4zG8P5a9WkVaxzGrSIi2u4mEys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369060; c=relaxed/simple;
	bh=OnAEGVP5i/cMSbQnRO123wE6Sw0W4vq9egppWpZslTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmvtEJPgB7yfIKvuo9j/O0B7q9xeK9qQotFLWAx8WWGuI/eTzbvAsUA2HdkXFi9hJjgqWbpPWOo5eMU8bL98zeNS3Mp20EVdvz0tiZkIRu0yT6sPgBkpvZSy/ysZdpDH4JFSnhSjhJH4fwLfnX4zfJiNiBswCfD7ZpF0h88hUPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2YTdCBK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2YTdCBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE361F0089B;
	Wed,  7 Oct 2026 10:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369042;
	bh=P5LPj1NW6rnNh9kPL9LQzoHJmXTwfZST/nzVnxiMQ7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T2YTdCBKgHdH9/bq+OLhUr78800G65r1+KnVdq4OdydO2+wUHcVWUQSJeSi8ADsV5
	 pbaRDSxCbZzbiqNfRy6rLMS5WYmV54KoJDCBfsOAmyksc5QFsxuZp10wiAN+xZsxES
	 yt4kovqS0ax2rPc8NE424GvF8pmeVaCuG4+t9pYaef/zKWd01/gptYUPgBgR6wP+Un
	 HNeuKIazfb8/Kio4xWfQuH+U4XNVesVLpqRN2UKr/Tz+6Wlck+Y4y6LPB3iW6ucygo
	 x8gWSQ8rw+Os2TKSPYLf7QuckrpDHbwaCymaUiVL/6K41LUOIOIp5Pbn0NTSgEUjXp
	 u4K4DQrOpWR6w==
Date: Wed, 7 Oct 2026 11:30:37 +0100
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
Subject: Re: [PATCH v2 1/7] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
Message-ID: <20261007-d8dfc11bbafa58dc5de32a29@squawk>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-1-108ecbdf2775@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="97/KKRKBlksTlc+D"
Content-Disposition: inline
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-1-108ecbdf2775@postmarketos.org>

--97/KKRKBlksTlc+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2026 at 08:46:02PM -0700, Paul Sajna wrote:
> Very similar chip from the same family to be added

Please explain what actually differs between this and the existing
device that prevents use of a fallback.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  Documentation/devicetree/bindings/leds/leds-aw2013.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Do=
cumentation/devicetree/bindings/leds/leds-aw2013.yaml
> index 26238446f2bd..1ad165cfe34a 100644
> --- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: AWINIC AW2013 3-channel LED Driver
> +title: AWINIC AW2013/AW2027 3-channel LED Driver
> =20
>  maintainers:
>    - Nikita Travkin <nikitos.tr@gmail.com>
> @@ -15,7 +15,9 @@ description: |
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

--97/KKRKBlksTlc+D
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYfTQAKCRB4tDGHoIJi
0h04AP0cKcYg9XzkZHNziwvYYH585+AqnRh6Q97FQkQ7I7W9nQD/ZJITPrHbVmkz
uyo7JTmPqeGCTAboA/acQiJ8gD8q1wY=
=Txsz
-----END PGP SIGNATURE-----

--97/KKRKBlksTlc+D--
