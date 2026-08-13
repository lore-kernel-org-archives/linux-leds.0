Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44B947CA76;
	Thu, 13 Aug 2026 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630659; cv=none; b=MTadvb4y4O08ojNlWWy4Y5GHJfRUit88bxgj4Mko3jUoHnbtQByE0KAwwM6I9XaeufqahSz39vhjPG5hu6jghVl/T3Qn9C3y8UYwvzrH+T6mTNvDrwzajDbC+/PzVZBO1pKRa8Xzk62x+tzILfhDDBLaqNT01Wj4Nr0KW9nq+Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630659; c=relaxed/simple;
	bh=Xsl0Nh1jSfjzlV7Vj6lE9mAeQqm5bhlNqoDYilvdwT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RadRasBmjLZNZmwXtvL35pgxIk9X/PIgYSSUknhXzSYpAdDiSZNbWaDwxXPp6xHah1MPWbw66sXJX/I8NMRTIL2b/9q8zp/kfw+viJYGwP/qJvPa/Yw/COk5RjT7fypYYWlnyyVQ2kuMItT7N/CRiuCJ6vB2h4/O8ZYUMpaLtzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5mK07jb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5mK07jb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2A91F000E9;
	Thu, 13 Aug 2026 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630657;
	bh=jcxpOLQdoOr1rmfxtBOUq/K44mKuP9VeespzCCiY4jg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F5mK07jboEj6aEFq2OVB+rGd18C8Y8Uirgb1ytlQbLT6lSUpK13u+Pz+MG1JLpvRY
	 uIgKAnm0RqjwrDKt2mmqdQ51t/g446JRF/kRC8Do1662Ybaz1l9aO3BTahJZMZEPYT
	 x5Asjc10OKuAAY+elwY4ImuYRMEvfkhDL2gtT+dwdQgcORitddwMxLpk4vZm8tVcCN
	 VYeqapvrhSUDsr2lBCD+Q9acCmkwr/AdfAO96e+LDCTtRwiL6QvjESgI35ocRVAKEM
	 n1INRCjG8alW8YcFgyLcV126sDUiejXQj15p/nbCKNzmnaC/B1wWefcvpnZ9MRzlw0
	 8i1z9cp3S7zUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/5] dt-bindings: leds: Add IS32FL3207
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <361f85124583adba9aae710179af910c328a747b.1786543681.git.ahmadexp@gmail.com>
References: <cover.1786543681.git.ahmadexp@gmail.com>
 <361f85124583adba9aae710179af910c328a747b.1786543681.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:17:37 +0000
Message-Id: <20260813141737.6E2A91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `multi-led` node constraints arbitrarily limit the maximum b=
ase channel to 15, preventing valid configurations like a bicolor LED group=
 on the final two channels (OUT17 and OUT18).
--

--- Patch [1]: [PATCH net-next v4 1/5] dt-bindings: leds: Add IS32FL3207 co=
ntroller ---
commit e5368ebd3d680b7d1dca52de92294047f625cbb9
Author: Ahmad Byagowi <ahmadexp@gmail.com>

dt-bindings: leds: Add IS32FL3207 controller
   =20
The IS32FL3207 is an 18-channel constant-current LED controller with
per-output PWM and current scaling. Describe I2C addressing, power and
shutdown controls, RISET, and individual or multicolor output groupings.

> diff --git a/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml =
b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
[ ... ]
> +  "^multi-led@[0-9a-f]$":
> +    type: object

[Severity: Medium]
Does this pattern inadvertently reject valid unit addresses above 15?

Since the hardware supports 18 independent channels, a bicolor LED placed on
channels 16 and 17 (OUT17 and OUT18) would logically need the node name
multi-led@10, which this single hex digit pattern would reject.

> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 15

[Severity: Medium]
Could this maximum limit be too restrictive?

If a bicolor LED group is placed on the final two channels (OUT17 and OUT18=
),
the base channel would need to be 16 (reg =3D <16>), which is rejected by t=
his
limit.

> +        description: |
> +          Zero-based lowest-numbered LED output used by the group. Value=
s 0
> +          through 15 correspond to OUT1 through OUT16. A group based at
> +          channel 15 (OUT16) may include channels 16 and 17 (OUT17 and O=
UT18).
[ ... ]
> +    anyOf:
> +      - required: [led@0]
> +      - required: [led@1]
> +      - required: [led@2]
> +      - required: [led@3]
> +      - required: [led@4]
> +      - required: [led@5]
> +      - required: [led@6]
> +      - required: [led@7]
> +      - required: [led@8]
> +      - required: [led@9]
> +      - required: [led@a]
> +      - required: [led@b]
> +      - required: [led@c]
> +      - required: [led@d]
> +      - required: [led@e]
> +      - required: [led@f]

[Severity: Medium]
Are there cases where a multicolor group could be formed exclusively by led=
@10
and/or led@11?

If a bicolor LED group uses the last two outputs, the schema validation wou=
ld
fail because this list stops checking at led@f.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786543681.gi=
t.ahmadexp@gmail.com?part=3D1
