Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FEC466B58;
	Tue, 28 Jul 2026 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785264757; cv=none; b=NA7kTC+Pj5kGQtrYkJK2//YVADfwu9EoxNOpavQ3OVqO9IBdeHTR7LPRGfnf31gxFwbf5QCBx541ePUSg2nhCfOuMUDnL0u2jN664t7AdolDI1XxhIIQghyoxX4ahUCnXa/8IsmVX1ddtx7sqSXrsYiTeROpmaJGMx1U9yaEkkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785264757; c=relaxed/simple;
	bh=RHgHWaYgSTSCKqwsuaHvVTMbaStYpd8crtraB2Liimc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uyj4/1WpISO8vLduXsNKDf0mCUzKqVYJUF81P8/6HJp1Hx0sE5g4ASrMGZmaby9ModyyI0frTiw8ZBmd67EPkh1HMtaFMdh8/LEY0uqsrlqPgypll07kGs5XyHR/t7o01GlexN7ogmbLNPo8tV4C3BK6KJiWnZn/qTZXZftKgu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YerJwDPC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YerJwDPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048481F000E9;
	Tue, 28 Jul 2026 18:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785264756;
	bh=oNi4MIx6WVWoYld3bNzUZKVwTrP63kwXaGq9/p3Zslk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YerJwDPCRYPNJ0EbYDr4kkzU4259yvKjEkbn5wlhJkCPznroE+Fe7hbDU9SX8ifKz
	 8RYQqGj6VbhEDA4k1JG9d1cdM58iYCOpjKe69XEnlDNDjNJfteyK5jXkJDAh/uxzGt
	 ufidCSM596gHsQOPBQyxKR0wXbI18N50bqMYz+CpwlDWZoMg+B7zZ48NGPTB+IQh0b
	 YaCRBl4sDXNiloHFn+s770EodOfFFNKFZid38DhC26FErd/BXEDZC9G7ZGnfgODoht
	 VeffWr9nX3dkEmvTryNGHQ+3uAEFjpYddxXWUO64rmhJ4zx8kabT1OxT+KFCpLJ7t/
	 NS+AsZJWqJJkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: leds: lacie,ns2-leds: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ninad Naik" <ninadnaik07@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728183945.12008-1-ninadnaik07@gmail.com>
References: <20260728183945.12008-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 18:52:35 +0000
Message-Id: <20260728185236.048481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Using `additionalProperties: { type: object }` at the root level in=
correctly restricts all unlisted parent properties to be objects, causing v=
alidation to fail for standard devicetree properties.
--

--- Patch [1]: [PATCH v4] dt-bindings: leds: lacie,ns2-leds: Convert to DT =
schema ---
commit e51c70e2c2a321d27514dfdacc4ab4b3fb805568
Author: Ninad Naik <ninadnaik07@gmail.com>

dt-bindings: leds: lacie,ns2-leds: Convert to DT schema

This commit converts the lacie,ns2-leds device tree binding from plain text
to YAML schema.

> diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b=
/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> new file mode 100644
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
> +
> +  description: Each child node represents a single LED

[Severity: Low]
By applying type: object to additionalProperties at the root level, will th=
is
incorrectly restrict standard unlisted parent properties (such as status or
pinctrl-0) to be objects?=20

If a standard string or array property is added to the node, it looks like
schema validation will fail. Should patternProperties be used here instead =
to
selectively match the child LED nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728183945.1200=
8-1-ninadnaik07@gmail.com?part=3D1
