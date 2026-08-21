Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A040B304BCB;
	Fri, 21 Aug 2026 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301868; cv=none; b=knMt3KWttdxLXEuHQMQIESb/K+UQPoZTsfOEGspVskMtqJnl+jGipyqO4xK33dd4GT4QgYqvAsAcbFexrKWbcpVxXBYL7gAfi6RLIDkhaBVSA9WFsD41+I/ACcHGKYIv55xjFfODfpjFh3V/waNzcPJY7ny/W8G/f+WvAY/5NVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301868; c=relaxed/simple;
	bh=v/u03PuZUtbKwBX7Mdk5PB38KRAstrXBAZhLKoeA07k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZP9PenZaffEQH9hWQl1uPH05+ff8WBPlpNyYC06vgo4kuP6d+1xhj0aWpo1bLbSsqBDAYMLGshg96dMczMf9UyLxDbGTR4gR+XnBUqhPV67CIKgIOSohqfOTUJUCjO8G8PvplP5BEbVnp0KWNAGi1spa5WdAS+GM6jy+tprORwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edgY4h85; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edgY4h85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01001F000E9;
	Fri, 21 Aug 2026 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787301867;
	bh=N6pzcVPSP+0shkqvDVeK+Ct3Rs/zYWcDc+g9tbS7GmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=edgY4h85ByFMb+VOFol530HJKjNWMcbJk+SBUyvhF+lWo0Niq5fUbZLQrThLgwmnV
	 fNZ+YerMge4MMK6nKP4G0CksXkMRYMssXaVpdSowK86wp7Dy6rgyXPfgkgJddA4yQ9
	 es9OIH8OmiexgY0NFCOTUcEudUggdPvDl/F1V2ZboRoim5ah4dqZQINoy69NV4iaqb
	 NTECln4WHQ7IVVPD7ST/7Q5Q/KQx947cWMPiNkjqWk52mLj06ok4vFbxNqCrOQ4UbF
	 NEHQm/rUSA+oQ0UBNxsEqu0VZTNzetCFq36WPee8sQwtBAAsBkcJmDJoZ62LX6OmcB
	 p78FxpnlqywAw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: leds: Document TI LM3643 dual LED
 flash driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rillian Grant" <rillian.grant@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821083620.68324-2-rillian.grant@gmail.com>
References: <20260821083620.68324-1-rillian.grant@gmail.com>
 <20260821083620.68324-2-rillian.grant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 08:44:26 +0000
Message-Id: <20260821084426.D01001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The schema does not enforce `flash-max-microamp`, `flash-max-timeo=
ut-us`, and `led-max-microamp` as required properties for the LED child nod=
e.
--

--- Patch [1]: [RFC PATCH 1/2] dt-bindings: leds: Document TI LM3643 dual L=
ED flash driver ---
commit 0c56365dce9a84b7387d67d8621b8beeacea7aec
Author: Rillian Grant <rillian.grant@gmail.com>

dt-bindings: leds: Document TI LM3643 dual LED flash driver

This commit documents the devicetree bindings for the Texas Instruments LM3=
643
dual LED flash driver, which uses a synchronous boost converter to power up=
 to
two current sources up to 1.5A.

> diff --git a/Documentation/devicetree/bindings/leds/ti,lm3643.yaml b/Docu=
mentation/devicetree/bindings/leds/ti,lm3643.yaml
> new file mode 100644
> index 0000000000000..18b08a79512f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml

[ ... ]

> +patternProperties:
> +  "^led@[0-1]$":
> +    type: object
> +    $ref: common.yaml#
> +    unevaluatedProperties: false

[ ... ]

> +      flash-max-timeout-us:
> +        description: |
> +          The chip supports timeouts from 10ms to 100ms in increments of=
 10ms
> +          and from 100ms to 400ms in increments of 50ms. The provided va=
lue
> +          will be rounded down to a supported value.
> +
> +        minimum: 10000
> +        maximum: 400000
> +
> +    required:
> +      - reg
> +      - led-sources

[Severity: High]
Should flash-max-microamp, flash-max-timeout-us, and led-max-microamp be
included here as required properties for the LED child node?

Without these properties enforced by the schema, a device tree could omit t=
hem
and still pass validation. If omitted, will driver fallback to the controll=
er's
absolute maximums (1.5A and 400ms) risk physically damaging connected LEDs =
that
have lower electrical limits?

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821083620.6832=
4-1-rillian.grant@gmail.com?part=3D1
