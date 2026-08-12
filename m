Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C25636F8E4;
	Wed, 12 Aug 2026 19:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786562916; cv=none; b=pwpPoQdI49pFydVdTz9TOw/ZgPnuM4btZyuiMt2pAnt8hDg/9gDcD7uR0SpZQ6bh9S4O+rJbzr8Cs2ypYsEF3542svvWnVFbCOiZ0dgJkNqpkbJA6L7ElrqRItlKLdhLiytRkEet/8dChl4xCEIeRmwagiIttVnIvB+dIhsGKX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786562916; c=relaxed/simple;
	bh=AlScUpq7vddfgR16eeoOIduQAhY/hspaxHM3/5Jqec8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EPeKQLQfzvokmVnudFxAI8IFMzATAbP6NGp74fcg3Y8XZ2t2n5Lo+1a9gx88ZXVysp5/Djo7GAOLSxM2yu6gaAM6CGv3v3atWta6dcJ+dqn3/VV2dBVHWZE+UevyGSIIzAsUHsBkWLMM6LHNuuHGV8U2AaUVAOdczfYVpQsFbKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJz5ZM/+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJz5ZM/+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06A31F00A3A;
	Wed, 12 Aug 2026 19:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786562915;
	bh=1wv4kNgnNbihJVWnQRVp4+ysqwQfrzKDVI8KwyAicVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TJz5ZM/+RdnIO9aodwTJfkn0wijqZZUoskTs4R/zKiyhnDh28Ocu9V6cddf24E7Tw
	 JESFbu+6wsuurxQTBLzIZRgEqm3ro8RUaEmSTw/HWnE8tOZuzPe1vetBm9oXmrNVTn
	 BJXnqtlZI++ZyU1hGkRy7A7uPLdAfASZ9yKEqmtWt9FDBROlF57yaSf8hRKLpgnMBP
	 R1UddwakP/Uya/lGKO0/x8SIzcZWaDoaj0eFj973GZ7BNq8jAyQG1MmXAu6TG92lXy
	 rFJwR3duYvfvstYZ86trHP6sWf7tHRIMJJteoamYfeuLUJieC34Q2DDkuNx9Gc8LRG
	 YE57PDUZtqQrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: Add Orient Chip OCP8178
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wim de With" <wf@dewith.io>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260812-ocp8178-backlight-v2-1-4ad18b48bef8@dewith.io>
References: <20260812-ocp8178-backlight-v2-0-4ad18b48bef8@dewith.io>
 <20260812-ocp8178-backlight-v2-1-4ad18b48bef8@dewith.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:28:34 +0000
Message-Id: <20260812192834.F06A31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema uses `additionalProperties: false` while also referen=
cing `common.yaml#`, which will incorrectly reject standard inherited prope=
rties.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: backlight: Add Orient Chip OCP81=
78 ---
commit e31a9b24875ae6868d7bab27e5c73b0f9db06347
Author: Wim de With <wf@dewith.io>

dt-bindings: backlight: Add Orient Chip OCP8178

This commit adds device tree bindings for the Orient Chip OCP8178 LED
backlight driver, introducing a new YAML schema.

> diff --git a/Documentation/devicetree/bindings/leds/backlight/ocs,ocp8178=
.yaml b/Documentation/devicetree/bindings/leds/backlight/ocs,ocp8178.yaml
> new file mode 100644
> index 0000000000000..57c44d3383b88
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ocs,ocp8178.yaml
[ ... ]
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
[ ... ]
> +required:
> +  - compatible
> +  - enable-gpios
> +
> +additionalProperties: false

[Severity: Medium]
Since this schema references common.yaml, should this be set to
unevaluatedProperties: false instead? Using additionalProperties: false
will incorrectly reject legitimate properties inherited from common.yaml
during schema validation.

> +
> +examples:
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ocp8178-ba=
cklight-v2-0-4ad18b48bef8@dewith.io?part=3D1
