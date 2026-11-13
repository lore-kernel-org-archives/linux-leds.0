Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590245;
	b=Bk4TlpPdacZK9d65t/ZiMvacfBdHEiGuzcbpyn9Fbptrx/RRr5KP9qDWUV4A7LIqWScr
	 WrANQE0Mrq5+t/1Qkg35eVa+rxaVVqLOjl3c21EpwCY/KOe0UvWnxAeO4d3di/2EbEN+/
	 rF42a3+1H6hXcuUFDTZ+be+Uamor6pGmQmCPCigHw5OEPou/7jXXr6s8rlfShM/Z7Xya6
	 vzg9TS4w5MY0l1LhUTXCEBB5oZW5/joeM6r5ZC1YRhZzZAb6vvhaM+SxwZdL4ynh37rJF
	 a7+6I9P4+Jkn1ebBsi/puIFOgAgb6y8uMGMuhRgF0SG6CSQKjhKohSkWEqgINpMd+UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590245;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Xb14ScaCaDumMSYMu8DuGROvc3C+w5hjBYgj/69WbBY=;
	b=DfJjqt6Qpoc31RFftD1CineDl+AltvVgI45r5F2ojR8T5/i5Ou7P8HFebRJileeq4JuO
	 K0a6BQBf0lR1OF5T4Su1jxW5WErWNz0cbmiaeejdggs9em/KQ3h3tTtjpv9i+sca75JqC
	 dpd7Ayw5wxoJspwiweA7s/fuEqF1hBq+HFgxutmMdIhg9oGXnpocakBd+y1WBLJ8A4b/5
	 0AT8GubBhEdCVveQw3JZmiAFNt6UwPGqQTIxAY16r82KVTX1GOsG7SrR8+zNGxWZfL914
	 SeaM2HVvhT5BtjFm1zIXZ/msdU2Zx1k0HAjB8+cWvijuibBpawUkRVNHIM1fLnSPtkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KfHA7IFa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B69F6075E32;
	Fri, 13 Nov 2026 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KfHA7IFa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70781F000C6;
	Fri, 13 Nov 2026 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590245;
	bh=Xb14ScaCaDumMSYMu8DuGROvc3C+w5hjBYgj/69WbBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KfHA7IFaNEClH1EFTV9EwvtGaGzurf8K49uXO9l88TAyc1PjvcYGC8bKhBMnxedMJ
	 sfHHgYwCG57N0pkJ5Az6puJ0c2ssQ7pqeiWbC6xtkFWbQZzfdn5lten1oQbcV6+RZI
	 S5C3+2ZjfKmfFiO2lsxw/cD2T71wytWRJUqaswU9d8ZODVYOhCzD3jylkbniN1/ITU
	 WYut2WCaXL1oPwwcUrp5mn/ki39RVNywQQAPOJJ6pl1/eTm8xzrkF1TvokEt7XEJKW
	 ReqHeupLPHqVE5n9bvh2NHpyJ7bytIr3Rz/PsQXK0FrOesEpZRAkkELXObE6zpQhc4
	 YOCi+1VYazOAQ==
Date: Fri, 13 Nov 2026 17:17:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, maxime.chevallier@bootlin.com, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led
 nodes
Message-ID: <20261113-good-renovator-99924ca0d55b@spud>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-2-a.shimko.dev@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sYy28ZWzK/osFWZ7"
Content-Disposition: inline
In-Reply-To: <20261113110546.173624-2-a.shimko.dev@gmail.com>

--sYy28ZWzK/osFWZ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 02:05:43PM +0300, Artem Shimko wrote:
> Document the optional "leds" node supported by the dap8211r phy.
>=20
> The phy exposes three configurable led outputs, each of which can be
> assigned a color, a function and a default trigger.
>=20
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> ---
>  .../bindings/net/dptel,dap8211r.yaml          | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/=
Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> index 4cd0f9730d95..43425fc8e96e 100644
> --- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> +++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> @@ -20,6 +20,7 @@ description: |
>      - IEEE 802.3az-2010 Energy Efficient Ethernet
>      - IEEE 1588 SyncE support
>      - Internal packet generator and checker for link diagnostics
> +    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
> =20
>  allOf:
>    - $ref: ethernet-phy.yaml#
> @@ -28,6 +29,22 @@ properties:
>    compatible:
>      const: ethernet-phy-id0008.011b
> =20
> +  leds:
> +    type: object
> +    description:
> +      Optional node describing the three configurable LEDs of the PHY.
> +      Each LED can be assigned a color, function and default trigger
> +      (e.g. "netdev" for link/activity indication).

Please add some blank lines here,

> +    patternProperties:
> +      '^led@[0-2]$':
> +        type: object

here,

> +        properties:
> +          reg:
> +            maxItems: 1

here,

> +        required:
> +          - reg

and here.

> +        additionalProperties: true

This whole leds node needs to go down below tx-internal-delay-ps, child
nodes are typically sorted after regular properties.

pw-bot: changes-requested

Thanks,
Conor.

> +
>    reg:
>      maxItems: 1
> =20
> @@ -49,6 +66,8 @@ unevaluatedProperties: false
> =20
>  examples:
>    - |
> +    #include <dt-bindings/leds/common.h>
> +
>      mdio {
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
> @@ -58,5 +77,24 @@ examples:
>              reg =3D <1>;
>              rx-internal-delay-ps =3D <1950>;
>              tx-internal-delay-ps =3D <1950>;
> +
> +            leds {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                led@0 {
> +                    reg =3D <0>;
> +                    color =3D <LED_COLOR_ID_GREEN>;
> +                    function =3D LED_FUNCTION_LAN;
> +                    linux,default-trigger =3D "netdev";
> +                };
> +
> +                led@1 {
> +                    reg =3D <1>;
> +                    color =3D <LED_COLOR_ID_AMBER>;
> +                    function =3D LED_FUNCTION_LAN;
> +                    linux,default-trigger =3D "netdev";
> +                };
> +            };
>          };
>      };
> --=20
> 2.43.0
>=20

--sYy28ZWzK/osFWZ7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavdGHwAKCRB4tDGHoIJi
0lfpAP9rukdCD6f96aFpyDcEMd3E+w2yr6hmcKwUlH6VbzF/SAEAre99XLZewhEO
S11cs72OHm78d2QmxlKq54v/4j7hcwU=
=NsCz
-----END PGP SIGNATURE-----

--sYy28ZWzK/osFWZ7--
