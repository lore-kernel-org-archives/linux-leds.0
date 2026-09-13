Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3125D35F192;
	Sun, 13 Sep 2026 02:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789267512; cv=none; b=WvLq2/0NwuUqRla58luwA/xZsT9S7L5MK7oHxsdA+U/a/o7DKSYxWXnniffZpYGTL6Y8lIpbV8QsmIWUSVUM3pHqIUyOM3o+KK+5rDtPFaqyuxPlVBqWq/JDeeVhi7Cwl6gjem1F8y1aJTT9480NzrdyOQ//lm9/hhfPETpTM1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789267512; c=relaxed/simple;
	bh=vf/LynADfSBjaHhi2H4uw7GoweYkIcGUYqMcUdMGZKo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=owFfQS6pAlaA/30/GV6Yfy6GDB0p2s/IeyeeP7RdaYObHNi13xTWeQlJsgMmgpAX4KWuan7zqqQGajyRBQj3r4CIG+4IFnp0tG2JuGPRdH/SjKoTQfKTQSXtuL6bsUxIIIhALkwFQWVEfVGz8dKoVPOrwKdBhvXtdaLtZzAuFHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Te/3yJtL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Te/3yJtL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485A11F000FF;
	Sun, 13 Sep 2026 02:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789267510;
	bh=DXH6TZKoAojuDtDUnZ9GM1csOg1RlctdkZheDilHJuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Te/3yJtLwiECm8A4o6CkyjOhZFUo7JPTNJqvyoGcTwy5sBJpNTFRJiRTO8tSMZBlE
	 6Ej+XJPGHZX5r7dncPVuouHs7nyNHvLgFEvvFtOWQSvPIqvU5zgR52ZWmwzzJ6gO2X
	 34Dfvgg/C0d8d01rOTicWIrH/NQOOP1DNQ3j3BwUh7EkH/vSgndqRRPKMS/4Rbrd30
	 uMx+mSf/8ipLkRtrqn+rr1ZAqI3yx9T+GrmxFfJak8Crg303PCoooVJKQ3Z28PsOF6
	 HJyfjwgzROT28VZaX/0wccqhigSAhtY4QQhkxDbr0Psppf2s8XrTFG0rKK1XZrmcWz
	 RjpEPt1vGyf3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: leds: rt8515: Support single-GPIO
 flash ICs with vin supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rudraksha Gupta" <guptarud@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260912-expressatt_camera_flash-v7-1-e1fd2edc8d84@gmail.com>
References: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
 <20260912-expressatt_camera_flash-v7-1-e1fd2edc8d84@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 02:45:09 +0000
Message-Id: <20260913024510.485A11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `oneOf` constraint incorrectly makes `ent-gpios` and `vin-su=
pply` mutually exclusive and strictly requires exactly one to be present, c=
ontradicting the claim that `vin-supply` is optional and artificially restr=
icting valid hardware configurations.
--

commit 72463777ee1c18e7913b350d5d2ad857810ece89
Author: Rudraksha Gupta <guptarud@gmail.com>
Subject: dt-bindings: leds: rt8515: Support single-GPIO flash ICs with vin =
supply

This commit adds support for single-channel variants of the RT8515 flash
ICs. It makes ent-gpios optional and introduces a vin-supply property,
adding a oneOf constraint to manage their presence.

> diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b=
/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> index 0356371a6b014..ab3c5139132cc 100644
> --- a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> +++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml

[ ... ]

> @@ -81,10 +90,15 @@ properties:
> =20
>  required:
>    - compatible
> -  - ent-gpios
>    - enf-gpios
>    - led
> =20
> +oneOf:
> +  - required:
> +      - ent-gpios
> +  - required:
> +      - vin-supply
> +

[Severity: Medium]
Does this oneOf constraint incorrectly restrict valid hardware configuratio=
ns?

The oneOf constraint strictly requires exactly one of its subschemas to mat=
ch.
If a single-channel IC (which naturally lacks ent-gpios) does not use the
explicitly optional vin-supply regulator, zero subschemas will match, causi=
ng
schema validation to fail.

Conversely, if a standard dual-channel IC (which requires ent-gpios) is also
powered by a vin-supply regulator, two subschemas will match. This will also
fail validation due to the strict exclusivity of oneOf.

Should this be modeled differently to allow vin-supply to be truly optional
while safely permitting single-channel configurations?

>  additionalProperties: false
> =20
>  examples:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-expressatt=
_camera_flash-v7-0-e1fd2edc8d84@gmail.com?part=3D1
