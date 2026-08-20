Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6206E2D97BA;
	Thu, 20 Aug 2026 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249192; cv=none; b=MPuasRfXj6t83kuprotfZicSyuRsi69XR6blIWMCJTMP+ePo6huRCb5AmId1rvVXTgcaw6QSOVZCRy+4diYG6C0ZnuUB7UoS5svnKC1RygEylyqwHvyyw8KtBrNq/fCcxp3IGAUociW5fYJPckntesY5ZfV2SC4LhBh5Kcvw5YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249192; c=relaxed/simple;
	bh=mp2nxaNYgcAPwrKSMqx10ADDh4FzQA5kcSOTuMXVPOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PV21VKumuURhnRSAa5duKXYtNg+4HXrM/yWk4J5dJeeNNNPUJbodT5HLxAQWkUNRDoOV4vbPw7SChf2o59KdKT7Rc5YidQAKMR5Kjl8wfX56R+NZFkmZ1iCibb6D8Cv/8KZTHDGFQfoVnLH4j9rle9B8YU52sk5CVPNrdwiKaaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cR0eqKgZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cR0eqKgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56E71F000E9;
	Thu, 20 Aug 2026 18:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787249191;
	bh=g3vRVJu0Y5qwbO8fAcjSyaOZ38MIWJUKPcDVp+zkbFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cR0eqKgZ/U1x20x4hCdmqVhJar1e2HCQ4TX7pCv1WR5/A0XGsjnRnoMSJcCRZq0e1
	 ZlRIxXsiYnn35NK9pouC3O0jGabj6KP7m3zhwE6rnPcIg5qfl//7MF/Z4HRsUEo0in
	 P+iBqkhPpQ/glwlSS7Uq5EQAiHW4tK9PKT65CsDaDtzCzq7IxTaB9nCaXVSjzYQxAg
	 lxX6Gd+Z2iowq2j58HkMeMvhwnsOhwGkqmIIwvpTAZWrvQlBupfyZBI1W59ncjpm0Q
	 B/tiV9Ecur4qjjHtknUrgfuWz1teRZ/zSEU88CCQblPKmmoDYcdJM+p9EmcwPlMyIq
	 T97yBFvcEsBNA==
Date: Thu, 20 Aug 2026 19:06:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, skhan@linuxfoundation.org,
	me@brighamcampbell.com, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: lacie,netxbig-leds: Convert to DT
 schema
Message-ID: <20260820-seventh-essay-235f3711ad74@spud>
References: <20260820150223.108374-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GhDcvaf7RaFFYOuJ"
Content-Disposition: inline
In-Reply-To: <20260820150223.108374-1-challauday369@gmail.com>

--GhDcvaf7RaFFYOuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 08:32:23PM +0530, Udaya Kiran Challa wrote:
> Convert lacie,netxbig-leds devicetree binding from legacy
> text format to DT schema.
>=20
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
>  .../bindings/leds/lacie,netxbig-leds.yaml     | 134 ++++++++++++++++++
>  .../devicetree/bindings/leds/leds-netxbig.txt |  92 ------------
>  2 files changed, 134 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/lacie,netxbig-=
leds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.ya=
ml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
> new file mode 100644
> index 000000000000..ffdd47458d24
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/lacie,netxbig-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LaCie/Seagate netxbig CPLD LEDs
> +
> +maintainers:
> +  - Simon Guinot <simon.guinot@sequanux.org>
> +
> +description: |
> +  Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Sea=
gate
> +  boards (Example: 2Big/5Big Network v2, 2Big NAS).
> +
> +properties:
> +  compatible:
> +    const: lacie,netxbig-leds
> +
> +  gpio-ext:
> +    description: Phandle for the gpio-ext bus.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  timers:
> +    description: |
> +      Timer array. Each timer entry is represented by three integers:
> +      Mode (gpio-ext bus), delay_on and delay_off.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +required:
> +  - compatible
> +  - gpio-ext

This should be after the block defining the child nodes.

> +
> +additionalProperties:

This is not how the child nodes should be implmeneted, it should use
pattenProperties instead.

> +  description: Each child node represents a single LED
> +  type: object
> +  $ref: common.yaml#

> +  unevaluatedProperties: false

This should IMO be additionalProperties: false, and the two option
properties that are supported explicitly cited.

The rest of this looks fine I think.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +  properties:
> +    mode-addr:
> +      description: Mode register address on gpio-ext bus.
> +      $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    mode-val:
> +      description: |
> +        Mode to value mapping. Each entry is represented by two integers=
: a mode and
> +        the corresponding value on the gpio-ext bus.
> +      $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +    bright-addr:
> +      description: Brightness register address on gpio-ext bus.
> +      $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    max-brightness:
> +      description: Maximum brightness value.
> +      $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  required:
> +    - mode-addr
> +    - mode-val
> +    - bright-addr
> +    - max-brightness
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/leds-netxbig.h>
> +
> +    netxbig-leds {
> +        compatible =3D "lacie,netxbig-leds";
> +
> +        gpio-ext =3D <&netxbig_gpio_ext>;
> +
> +        timers =3D <NETXBIG_LED_TIMER1 500 500
> +                  NETXBIG_LED_TIMER2 500 1000>;
> +
> +        blue-power {
> +            label =3D "netxbig:blue:power";
> +            mode-addr =3D <0>;
> +            mode-val =3D <NETXBIG_LED_OFF 0
> +                        NETXBIG_LED_ON 1
> +                        NETXBIG_LED_TIMER1 3
> +                        NETXBIG_LED_TIMER2 7>;
> +            bright-addr =3D <1>;
> +            max-brightness =3D <7>;
> +        };
> +        red-power {
> +            label =3D "netxbig:red:power";
> +            mode-addr =3D <0>;
> +            mode-val =3D <NETXBIG_LED_OFF 0
> +                        NETXBIG_LED_ON 2
> +                        NETXBIG_LED_TIMER1 4>;
> +            bright-addr =3D <1>;
> +            max-brightness =3D <7>;
> +        };
> +        blue-sata0 {
> +            label =3D "netxbig:blue:sata0";
> +            mode-addr =3D <3>;
> +            mode-val =3D <NETXBIG_LED_OFF 0
> +                        NETXBIG_LED_ON 7
> +                        NETXBIG_LED_SATA 1
> +                        NETXBIG_LED_TIMER1 3>;
> +            bright-addr =3D <2>;
> +            max-brightness =3D <7>;
> +        };
> +        red-sata0 {
> +            label =3D "netxbig:red:sata0";
> +            mode-addr =3D <3>;
> +            mode-val =3D <NETXBIG_LED_OFF 0
> +                        NETXBIG_LED_ON 2
> +                        NETXBIG_LED_TIMER1 4>;
> +            bright-addr =3D <2>;
> +            max-brightness =3D <7>;
> +        };
> +        blue-sata1 {
> +            label =3D "netxbig:blue:sata1";
> +            mode-addr =3D <4>;
> +            mode-val =3D <NETXBIG_LED_OFF 0
> +                        NETXBIG_LED_ON 7
> +                        NETXBIG_LED_SATA 1
> +                        NETXBIG_LED_TIMER1 3>;
> +            bright-addr =3D <2>;
> +            max-brightness =3D <7>;
> +        };
> +        red-sata1 {
> +            label =3D "netxbig:red:sata1";
> +            mode-addr =3D <4>;
> +            mode-val =3D <NETXBIG_LED_OFF 0
> +                        NETXBIG_LED_ON 2
> +                        NETXBIG_LED_TIMER1 4>;
> +            bright-addr =3D <2>;
> +            max-brightness =3D <7>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/leds/leds-netxbig.txt b/Do=
cumentation/devicetree/bindings/leds/leds-netxbig.txt
> deleted file mode 100644
> index 5ef92a26d768..000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-netxbig.txt
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -Binding for the CPLD LEDs (GPIO extension bus) found on some LaCie/Seaga=
te
> -boards (Example: 2Big/5Big Network v2, 2Big NAS).
> -
> -Required properties:
> -- compatible: "lacie,netxbig-leds".
> -- gpio-ext: Phandle for the gpio-ext bus.
> -
> -Optional properties:
> -- timers: Timer array. Each timer entry is represented by three integers:
> -  Mode (gpio-ext bus), delay_on and delay_off.
> -
> -Each LED is represented as a sub-node of the netxbig-leds device.
> -
> -Required sub-node properties:
> -- mode-addr: Mode register address on gpio-ext bus.
> -- mode-val: Mode to value mapping. Each entry is represented by two inte=
gers:
> -  A mode and the corresponding value on the gpio-ext bus.
> -- bright-addr: Brightness register address on gpio-ext bus.
> -- max-brightness: Maximum brightness value.
> -
> -Optional sub-node properties:
> -- label: Name for this LED. If omitted, the label is taken from the node=
 name.
> -- linux,default-trigger: Trigger assigned to the LED.
> -
> -Example:
> -
> -netxbig-leds {
> -	compatible =3D "lacie,netxbig-leds";
> -
> -	gpio-ext =3D &gpio_ext;
> -
> -	timers =3D <NETXBIG_LED_TIMER1 500 500
> -		  NETXBIG_LED_TIMER2 500 1000>;
> -
> -	blue-power {
> -		label =3D "netxbig:blue:power";
> -		mode-addr =3D <0>;
> -		mode-val =3D <NETXBIG_LED_OFF 0
> -			    NETXBIG_LED_ON 1
> -			    NETXBIG_LED_TIMER1 3
> -			    NETXBIG_LED_TIMER2 7>;
> -		bright-addr =3D <1>;
> -		max-brightness =3D <7>;
> -	};
> -	red-power {
> -		label =3D "netxbig:red:power";
> -		mode-addr =3D <0>;
> -		mode-val =3D <NETXBIG_LED_OFF 0
> -			    NETXBIG_LED_ON 2
> -			    NETXBIG_LED_TIMER1 4>;
> -		bright-addr =3D <1>;
> -		max-brightness =3D <7>;
> -	};
> -	blue-sata0 {
> -		label =3D "netxbig:blue:sata0";
> -		mode-addr =3D <3>;
> -		mode-val =3D <NETXBIG_LED_OFF 0
> -			    NETXBIG_LED_ON 7
> -			    NETXBIG_LED_SATA 1
> -			    NETXBIG_LED_TIMER1 3>;
> -		bright-addr =3D <2>;
> -		max-brightness =3D <7>;
> -	};
> -	red-sata0 {
> -		label =3D "netxbig:red:sata0";
> -		mode-addr =3D <3>;
> -		mode-val =3D <NETXBIG_LED_OFF 0
> -			    NETXBIG_LED_ON 2
> -			    NETXBIG_LED_TIMER1 4>;
> -		bright-addr =3D <2>;
> -		max-brightness =3D <7>;
> -	};
> -	blue-sata1 {
> -		label =3D "netxbig:blue:sata1";
> -		mode-addr =3D <4>;
> -		mode-val =3D <NETXBIG_LED_OFF 0
> -			    NETXBIG_LED_ON 7
> -			    NETXBIG_LED_SATA 1
> -			    NETXBIG_LED_TIMER1 3>;
> -		bright-addr =3D <2>;
> -		max-brightness =3D <7>;
> -	};
> -	red-sata1 {
> -		label =3D "netxbig:red:sata1";
> -		mode-addr =3D <4>;
> -		mode-val =3D <NETXBIG_LED_OFF 0
> -			    NETXBIG_LED_ON 2
> -			    NETXBIG_LED_TIMER1 4>;
> -		bright-addr =3D <2>;
> -		max-brightness =3D <7>;
> -	};
> -};
> --=20
> 2.34.1
>=20

--GhDcvaf7RaFFYOuJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaodCHwAKCRB4tDGHoIJi
0jwAAQC7Gq3WPlLPBem8GgmKBUy2xFAg89L04idTPsNeoJmcGwD8CKvRp4/bJC9k
8R7oQJ6NCU+dPsYvq8DglgZ/ILbUBQc=
=reiD
-----END PGP SIGNATURE-----

--GhDcvaf7RaFFYOuJ--
