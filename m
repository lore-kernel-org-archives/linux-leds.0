Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654365;
	b=BVBuIVvZ15x9HJpphjTbskktg+Jph2RRf2IVQAOIXAMa4xkJo0xzsMwHZhuzS0otN/Kc
	 BR86gojl4y33HWXuhDaDS5Egrd5M8V/NjlZw0zOx0WoR89tUhZUj8xSLemEGXLCO+ciem
	 TYsj/rdk/7dvxjhBR3rBPBMNuYJ2J8hgYTel7G/K4FyknMvKVWWIPSTGpZZmbVAiyfuv2
	 kBS3EZhapelf4ulRQqF5gjgorlpPZm5HI+jnGwD2upieoGAiglubgp+ZflQE1K2ECPV7z
	 CtKgcCQI1cbDe5u1K/+Cejo8w8QKEu+4L2IyoJTulh2cXvm/WEPMDH+BjPvkmrQm4ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654365;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9U0khN7iql6VpfwzDkAJHrz0gkCeu5UEO7KKcMCN05E=;
	b=BpLwuO854xDVy8LB0Kv+44mfeOrb1xlSkcSh2FbBXLYfHnUaLhsPbnbzsL9hMzFBDyBW
	 vy76mr9x1luoL/cIJuPjp449lOi4Z1jG3waz3cOp60KJvsnWB+1DCZs74Oboo94oQ+Ypf
	 z9uSdzFJifs2fbd0vXHlTUeS6B93ghyEP0JgT6b/2MqW0AClTEmRbz/Ulljzt6/rfPDqC
	 w50ajhSHH4VJtPkNJNdRW84z48AjBAtGvBw/tFXQH9XiPpvO/2PIcCY3dB31a43YyOj+K
	 x4/dc9LmJpzUXmm/ZHXc9DlwtqbLr42AwFBLM+vFEcmlHOy7v+J1DkqfRQ3j5oZ9fmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nKWQcb4U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928DF606A32E;
	Sat, 14 Nov 2026 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nKWQcb4U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F1A1F000C4;
	Sat, 14 Nov 2026 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794654365;
	bh=9U0khN7iql6VpfwzDkAJHrz0gkCeu5UEO7KKcMCN05E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nKWQcb4UeZcTXa1DPnS3z5RPKiauJB+6caMuVeehI633M3lss6mrFxfQPOt2JdHg8
	 VxXHKBUMa8KQPhkZXIDrKa8qGx8HscCOjxfb1zkeNkh18iyYG4fWe5BAkQ9XpnFrwZ
	 Ka5n35xz7XOJn77a6BKC4rtDv4KRtPDxGxUuzMTibt4lNxQOSMSUC3jrm31nHfBhgk
	 j5TvHAtx1G+PYcfuGeIaBKoDztoDdcb8Bz8ADsi2wXXISukWMFzyZkbTBnkw1otJAH
	 m6kD3Z7l6+C0zOt9VTjJ261TBWNAQASnHleaM/UlAoU3htiw6SR7KHIMp3Nz6rFfPr
	 8GPJOy9WrzQOQ==
Message-ID: <sashiko-outbox-214381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261113110546.173624-2-a.shimko.dev@gmail.com>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-2-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:06:04 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: net: dptel,dap8211r: invalid and ineffective
  leds node schema
--

commit b253b1562298deb66ca7a0d9739c668ef65e6592
Author: Artem Shimko <a.shimko.dev@gmail.com>

dt-bindings: net: dptel,dap8211r: add led nodes

This commit documents the optional leds node and adds an example for the
DAP8211R PHY binding.

> diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/=
Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> index 4cd0f9730d954..43425fc8e96e0 100644
> --- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> +++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml

[ ... ]

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
> +    patternProperties:
> +      '^led@[0-2]$':
> +        type: object
> +        properties:
> +          reg:
> +            maxItems: 1
> +        required:
> +          - reg
> +        additionalProperties: true

[Severity: Medium]
Does this leds schema pass dt_binding_check or enforce the 0..2 LED index
limit?

The leds object omits additionalProperties: false (as well as
#address-cells and #size-cells), and ^led@[0-2]$ sets
additionalProperties: true without a compatible property, both of which
fail DT meta-schema validation.

Because ethernet-phy.yaml# is included in allOf and already defines leds
with ^led@[a-f0-9]+$, leaving additionalProperties unset on leds allows
child nodes outside ^led@[0-2]$ (such as led@3) to pass validation via
ethernet-phy.yaml#, while reg under ^led@[0-2]$ only specifies maxItems: 1
without restricting the value to 0..2.

Either drop the leds property block to inherit the definition from
ethernet-phy.yaml#, or define #address-cells, #size-cells, and
additionalProperties: false on leds and reference
/schemas/leds/common.yaml# with unevaluatedProperties: false and
maximum: 2 on reg under ^led@[0-2]$.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113110546.1736=
24-1-a.shimko.dev@gmail.com?part=3D1
