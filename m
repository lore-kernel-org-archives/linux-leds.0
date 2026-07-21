Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF5346E005;
	Tue, 21 Jul 2026 19:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784662731; cv=none; b=sfVg2Z2DMLY1tx/yL+0EVy9c2Eqx+5wUqW80zmFKOpjRD31/ci+lqv5pSUdVS1qj+GAJ5WIQVgAnrrVMhq50pBT+oV2fObRjaxkIGQ6esyjqqfljO6lmpIC9H6xCUTrx8hHfFE5ajsI9XbqVV9ROkyXTllWe7RENJfpv5oyhWME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784662731; c=relaxed/simple;
	bh=5Zev5SQHNatqxrvr1p33DwKX82qqiBWnGthUYfP0Ui0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oz1qng5qgzLkQDjCn4FLLkkgRxhLNv2UGfgoAEgMC1YyKuyDXkSgwSNYnLgpiCOcZZ78VO8D+iIziLmhyuWlHcLWSoDOygZ54N5GAqDxAYfwf/nWDamAItH0cYuTO3Dd3vSByWwd9ivS6fCKjULOtQIqZjF94/Ukz6mosauSjAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEH6fHx/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEH6fHx/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B0F1F00A3D;
	Tue, 21 Jul 2026 19:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784662730;
	bh=4mbftGSFBc6TlOsJJwuuRQlvSN+PsWYM9ETDUfJDG/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UEH6fHx/gCmr/0sMHTQNrdj+QwMiaD9Fp6JOYgzd+4nYFMd53ch4xVlM8SVMzLhxN
	 WlMo7jlImO4rTBaN0QAJZ3vLYjcD/k946tLnJkZYAue/32Eqa5/v/2HI9ivlKCACyE
	 QNg60IVd5bDJXtzzA2FE3ifNRQqOB8mvw2lDTffxbzw1t3gFrR0h2xWjatuliB35ai
	 TzdzSMqXuYqwc42qwuUBZZjlqbnwtjcNqanGNChlVUtr+B8b8XIgMkAKPL6RozgbSf
	 Fy8q81qRHSZfp5ctiz6tO0qDay+CX3NDZZi/RPkBgZqnspUhUKiu2OTqFcD3c3yati
	 JLT9ja1ZFhG/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: lacie,ns2-leds: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ninad Naik" <ninadnaik07@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721192754.46344-1-ninadnaik07@gmail.com>
References: <20260721192754.46344-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 19:38:49 +0000
Message-Id: <20260721193849.D2B0F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Using `additionalProperties` at the root level to define child node=
s incorrectly restricts standard properties on the parent node, breaking de=
vice tree validation.
- [Low] The schema omits the `num-modes` property, causing `dtbs_check` fai=
lures for existing in-tree device trees.
--

--- Patch [1]: [PATCH v2] dt-bindings: leds: lacie,ns2-leds: Convert to DT =
schema ---
commit d6e2084ac319cdcc30d00614f66ec071bc9c5c1a
Author: Ninad Naik <ninadnaik07@gmail.com>

dt-bindings: leds: lacie,ns2-leds: Convert to DT schema

Convert the lacie,ns2-leds binding text document to a DT schema.

> diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b=
/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> new file mode 100644
> index 0000000000000..1976669d2218c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: lacie,ns2-leds
> +
> +additionalProperties:
> +  type: object
> +  $ref: common.yaml#
> +  unevaluatedProperties: false

[Severity: Low]
Does setting additionalProperties to type: object at the root level break
standard parent device tree properties like status =3D "okay" or pinctrl-na=
mes?

By enforcing that any unlisted top-level property must be an object, standa=
rd
properties (which are strings or arrays) will fail validation with type
mismatch errors during make dtbs_check.

Is it better to use patternProperties: "^led(-[0-9a-f]+)?$": for the child
nodes and set additionalProperties: false at the root instead?

> +
> +  description: Each child node represents a single LED
> +
> +  properties:
> +    cmd-gpio:
> +      maxItems: 1
> +      description: GPIO connected to the command LED output

[Severity: Low]
Will this schema omission cause dtbs_check failures for existing in-tree
device trees?

The new schema strictly allows only documented properties via
unevaluatedProperties: false on the child nodes. However, existing in-tree
device trees contain an undocumented num-modes property:

arch/arm/boot/dts/armada-370-seagate-nas-4bay.dts:white-sata2 {
        ...
        slow-gpio =3D <&pca9554 2 GPIO_ACTIVE_HIGH>;
        num-modes =3D <4>;
        modes-map =3D <NS_V2_LED_SATA 0 0
        ...
}

Since num-modes is omitted from this new schema, validation will fail when
checking those boards. Should num-modes be added to the schema (perhaps with
deprecated: true), or removed from the DTS files as part of this patch seri=
es?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721192754.4634=
4-1-ninadnaik07@gmail.com?part=3D1
