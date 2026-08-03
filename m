Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AF423ABBF;
	Mon,  3 Aug 2026 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772001; cv=none; b=fcRmc+BiyFAdrlI5cE1URnmLY+C1pFZNuBzKyOcm3MR43QxvJLzy4enUvjKvHTCtH1ZawQLfo+HhPG0y6pq6D4dKysYKs3n7T18snrfyBpFRnOKS2wBjFPi+POqQwaSz/xVLYUsQkfM598/+EzPinNuyegFPZuh47jfB2HDcBmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772001; c=relaxed/simple;
	bh=IdtU70tWsLEVbSHSgwDQi1+Q2Oh5dkltS8EqJJu5E9Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tUzqEWng50KnjsLRlHTEjTTc8N/jWV9r3GwFHEHXHv1FhvGl4g2zLyhDn8wlZR72ll49G+ixvcOBHCo/NlCWrzHcIyQylhJHpOBqWo+pbcBRRt+4ucSPo7+CB7/a07ymoZiL5RD5M4J7QJqUQ7shrsByDrYWyhY3PI9m9OBXeK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyyPWLfH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyyPWLfH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB581F00A3A;
	Mon,  3 Aug 2026 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785771999;
	bh=oEdT4mzGkWDV4vexqlT5cS64ry5dexwrhSGC0ZNoxIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FyyPWLfHasaC7raR8by3BLYcpM+1xx5Y9lRqn7W52O/wefuEyaR0AtKLn0aUAwjOy
	 8Le/uOnxVhRFlc6Ma3K1qALJDPdpRlVMdrVqBzA8YtOmdmomosxE8/blhQrJUt0XLo
	 8d6Xx53g+A9VQFtvHtWzHOW1dgJY8kgH9HmAUSnm1SOesG2+Ke4W832EqWpyT+AOI5
	 Jl+UzYya3DRDHKjZwt5bY+qUqN3hIXpbSpynBAbWTe2TQX8IEcwWhzczdjvJt6/Tn6
	 7Bpid1Jw57413yDcAUAeTJoa3PPfskoouqOSau4SIdpCoLHqJ2/rJ0EDY/hcUrIX3V
	 GcD1eMzcyHJfQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC net-next 1/4] dt-bindings: leds: Add IS32FL3207 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: linux-leds@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <f45601f5a51e94e4d0fb58652fdd9a80eec8361f.1785684064.git.ahmadexp@gmail.com>
References: <cover.1785684064.git.ahmadexp@gmail.com>
 <f45601f5a51e94e4d0fb58652fdd9a80eec8361f.1785684064.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 15:46:38 +0000
Message-Id: <20260803154638.DBB581F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Arbitrary restriction of standard LED properties (`default-state=
`, `default-brightness`, `retain-state-shutdown`).
- [Medium] The `max-brightness` limit contradicts the 16-bit PWM capability=
 of the hardware.
- [Low] MAINTAINERS file entry breaks strict alphabetical ordering.
--

--- Patch [1]: [RFC net-next 1/4] dt-bindings: leds: Add IS32FL3207 control=
ler ---
commit 7a01cdde2c240d5fb659f162c75c91152d916f4e
Author: Ahmad Byagowi <ahmadexp@gmail.com>

dt-bindings: leds: Add IS32FL3207 controller
   =20
This commit adds a new device tree binding for the Lumissil IS32FL3207
18-channel LED controller. It describes the controller properties, such as
I2C addressing, output groupings, and current limits.

> diff --git a/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml =
b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
> @@ -0,0 +1,204 @@
[ ... ]
> +patternProperties:
> +  "^led@[0-9a-f]+$":
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 17
> +        description: LED output number.
> +
> +      led-max-microamp:
> +        minimum: 1
> +        maximum: 38250
> +
> +      color:
> +        not:
> +          enum: [8, 9]
> +
> +      max-brightness:
> +        minimum: 1
> +        maximum: 255

[Severity: Medium]
Since the commit message states this hardware has up to 16-bit PWM control,
does limiting max-brightness to 255 artificially restrict the hardware's PWM
resolution? Should this allow values up to 65535 instead?

> +
> +      default-state:
> +        const: "off"
> +
> +      default-brightness: false
> +
> +      retain-state-shutdown: false

[Severity: Medium]
Are these standard LED property restrictions necessary? Restricting
default-state to off and disabling default-brightness and
retain-state-shutdown entirely prevents device trees from configuring these
LEDs to be on at boot or retain their state.

> +
> +    required:
> +      - reg
> +      - led-max-microamp
> +
> +  "^multi-led@[0-9a-f]+$":
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 17
> +        description: Lowest-numbered LED output used by the group.
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      max-brightness:
> +        minimum: 1
> +        maximum: 255

[Severity: Medium]
Does this 8-bit limit also restrict the 16-bit PWM capabilities for multico=
lor
LED groups?

> +
> +      default-state:
> +        const: "off"
> +
> +      default-brightness: false
> +
> +      retain-state-shutdown: false

[Severity: Medium]
Should multicolor LEDs be permitted to use standard LED state configurations
like default-brightness and retain-state-shutdown, similar to the standalone
LEDs above?

[ ... ]
> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13821,6 +13821,12 @@ F:	Documentation/devicetree/bindings/hwmon/renes=
as,isl28022.yaml
>  F:	Documentation/hwmon/isl28022.rst
>  F:	drivers/hwmon/isl28022.c
> =20
> +ISSI IS32FL3207 LED DRIVER
> +M:	Ahmad Byagowi <ahmadexp@gmail.com>
> +L:	linux-leds@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
> +
>  ISOFS FILESYSTEM

[Severity: Low]
This isn't a bug, but does inserting ISSI before ISOFS break the strict
alphabetical ordering of the MAINTAINERS file?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785684064.gi=
t.ahmadexp@gmail.com?part=3D1
