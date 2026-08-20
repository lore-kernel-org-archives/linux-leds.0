Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEAC47141A;
	Thu, 20 Aug 2026 17:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787248134; cv=none; b=HX4i33EAxEQ0eVi2UpujZg5v0V21sA7lgLZ/c8hW39Zi8dfto3cGB9/QDtywlF1q7C+icDzSXtK94P4AO9oc4dCXj7KpDhr21re9PSWgfXG+wHO/vD+9m9vlrdRrm+QTWoX3mqeQXlNW4PQSjnqcxcXhqctEUC8g2NrWPMLFcG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787248134; c=relaxed/simple;
	bh=bkF0Er6K0DEC5+kRmoZ/b1OQ/CZAArh6ooiPcrkxYgM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=McvEWoyXSsnoxtEcVMXV5qvVOS6AiN/z+ua74O5CReShmW+9oMWlcA5VfZ+Bu/KPn0uVsUeDhk1rakQBkRJnXwSKmBnytuU6IOmZ9P39dUW/1TANgRkzZyErVM1sXIrXKSSYLIygMe2xHKF8WiGf3Bhbk+/9rYAcuNJ/n+Y72bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4gXL6aV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4gXL6aV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1E61F00A3A;
	Thu, 20 Aug 2026 17:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787248133;
	bh=fE0bi5TtMpiOAq4j4eYwHl9wS2wY2/zSFdI0/32q62U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M4gXL6aV2XbE2K1/HeNMbv8iPyGvXE7d9RsBSIR/13lUblMNmYnL/oQ9pBhaXetpl
	 qvcMUndkyV5/cW82nxNFVaxw9tg1pRTmyyKARHMEN9ttR70F7FM5yevtC//eehAL6h
	 EsIpuXh7gGEPT8oRhcYxaj8nlbvxRgptZpSpbt6X5sliwvKDO/b7d+roqtIMN/HJmy
	 9CuYtynhH8uCTQeL94d2jtlqeSlb5xh3ovA9XCosHM1GJ4St2vv0hZHAywMOsALANa
	 xw/5yYKSV+xeDzessskvdCWLzvqvlyFNrI9RceKxNG6Wo6o4hPBEntwur0wJrjlWSA
	 7oUr+8EgzTpIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: Add IS32FL3207 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: conor+dt@kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <22d13eb34c85e2c2be8c0ba1b7f3360e7cf9da71.1787247467.git.ahmadexp@gmail.com>
References: <cover.1787247467.git.ahmadexp@gmail.com>
 <22d13eb34c85e2c2be8c0ba1b7f3360e7cf9da71.1787247467.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 17:48:52 +0000
Message-Id: <20260820174852.BB1E61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `minimum: 149` constraint on `led-max-microamp` incorrectly =
rejects valid, lower-current configurations.
--

--- Patch [1]: [PATCH v6 1/2] dt-bindings: leds: Add IS32FL3207 controller =
---
commit 4fc20b49cd66c5af5de8db1465fd9c2b64f3c2ad
Author: Ahmad Byagowi <ahmadexp@gmail.com>

dt-bindings: leds: Add IS32FL3207 controller

The IS32FL3207 is an 18-channel constant-current LED controller with
per-output PWM and current scaling.

> diff --git a/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml =
b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
> new file mode 100644
> index 0000000000000..32eaf14ca7cf3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
> @@ -0,0 +1,285 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/issi,is32fl3207.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lumissil IS32FL3207 18-channel LED controller

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
> +        description: |
> +          Zero-based LED output number. Values 0 through 17 correspond to
> +          OUT1 through OUT18.
> +
> +      led-max-microamp:
> +        minimum: 149
> +        maximum: 38250

[Severity: Medium]
Does this minimum constraint inadvertently reject valid lower-current limits
for single LEDs?

When a board designer uses a larger issi,riset-ohms (e.g., 100 kOhm) to
achieve a lower full-scale current, they may need to limit a specific LED to
a peak current well below 149 uA (e.g., 50 uA).

Since the hardware can represent much smaller currents with a large RISET,
could this prevent developers from enforcing valid safety limits below 149 =
uA,
forcing them to over-specify the limit?

> +        description: |
> +          Board-safe peak current for this output. The value must not ex=
ceed
> +          the full-scale current derived from issi,riset-ohms. The minim=
um is
> +          the smallest nonzero current representable at the maximum perm=
itted
> +          full-scale current.

[ ... ]

> +  "^multi-led(@[0-9a-f]|-[0-9]+)?$":
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false

[ ... ]

> +    patternProperties:
> +      "^led@[0-9a-f]+$":
> +        type: object
> +        $ref: common.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            minimum: 0
> +            maximum: 17
> +            description: |
> +              Zero-based LED output number. Values 0 through 17 correspo=
nd to
> +              OUT1 through OUT18.
> +
> +          led-max-microamp:
> +            minimum: 149
> +            maximum: 38250

[Severity: Medium]
Does this also incorrectly restrict nested LEDs inside multi-led groups from
having valid maximum current limits below 149 uA?

> +            description: |
> +              Board-safe peak current for this output. The value must not
> +              exceed the full-scale current derived from issi,riset-ohms=
. The
> +              minimum is the smallest nonzero current representable at t=
he
> +              maximum permitted full-scale current.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787247467.gi=
t.ahmadexp@gmail.com?part=3D1
