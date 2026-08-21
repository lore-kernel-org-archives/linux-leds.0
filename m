Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FAD3A6F00;
	Fri, 21 Aug 2026 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316908; cv=none; b=twyuGpC/ByTLyT7MYFPwrT3xyCfFpiPTRI75QSEGjGTmh0UyjZ++OkbilkHtao9GgRQnM2QQtAyiXxeWlKVc4/CWgFtjHBiG7WxpyfXW0kprgwcP0iO7ImSiCVB6NSErzkdvJMxbKj7xDg+oHJaPBqPMQzBcXj2HyKOYZVj1ntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316908; c=relaxed/simple;
	bh=034pj/+RDKUa9WSKMXg8IQaUK03iUa1AHN58yFy3h/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=joo3CDw8YAdg1vOT+EP0BxnpWQALOR+FbxFfio9ztq9rKfH3iK7G/bkJPpzb1/mAYmy5NUABIcALvxcOgk/wvbBoMxPAPTVf3p3AOgf0PqnfFLsK9drPPKX7iy7cT0gi1BHMvKcA2YvKQ0YvaRtbJftOcHzy2+PeOmQ6YtkyhBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIhOJI2p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIhOJI2p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D4C1F000E9;
	Fri, 21 Aug 2026 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787316907;
	bh=g7TyHELAvJHU4eNziERH223ljexJAuEgbAcvXYlrTvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BIhOJI2pLQElcyj7zum3MK5AEoI0fvXqc2GSaL31utE2PejMSiCHqXW3vFZsGcka0
	 8HdHAnjSs1l0PDtYAI0SN/XvJhl5y6CfXtUCjCJ6aqnLrWhvH8Ei5vXHmcoaak+5Sf
	 womYiPs79ZrwzAcLZ02mAuLjTY4VSC777f5Uc5K0Rxk/+FzWNnXS8QNzkLUSPk07jW
	 MbPp0AsOqvbFbENHv2xEf2gFjXXHPKnY6Smom6XOMEk11g6y2qVvycLTIF+ADiguLQ
	 52Xhc+gE6T4ZrcfvWoHtiAuY2kxGYkMP8FJ0SmlF7JkM8+YoSBAJrjGAXZjTH3/KjF
	 aZAZcjHA/X7yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: lacie,netxbig-leds: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260821123723.198286-1-challauday369@gmail.com>
References: <20260821123723.198286-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:55:06 +0000
Message-Id: <20260821125506.97D4C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The YAML binding schema for LED child nodes explicitly forbids s=
tandard LED properties by using 'additionalProperties: false' without refer=
encing the common LED schema.
- [Medium] The regular expression used in `patternProperties` to match chil=
d nodes is brittle: it arbitrarily rejects valid single-word node names and=
 would erroneously match hyphenated top-level properties.
--

--- Patch [1]: [PATCH v2] dt-bindings: leds: lacie,netxbig-leds: Convert to=
 DT schema ---
commit a7a7b0d43884f0f2164a9d243e2d08d00c94a010
Author: Udaya Kiran Challa <challauday369@gmail.com>

dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema

This commit converts the LaCie/Seagate netxbig CPLD LEDs devicetree
binding from the legacy text format to the YAML DT schema.

Link to v1:https://lore.kernel.org/all/20260820150223.108374-1-challauday36=
9@gmail.com/

> diff --git a/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.ya=
ml b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
> new file mode 100644
> index 0000000000000..02759ecb32d04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml
[ ... ]
> +patternProperties:
> +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":

[Severity: Medium]
Does this regular expression arbitrarily reject valid single-word node
names like led or sata?

The regex requires at least one hyphen. A child node simply named led
would fail to match here, fall through to the top-level
additionalProperties: false, and be completely rejected.=20

It could also erroneously match future standard hyphenated properties like
power-domains and expect them to contain LED properties.

> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      label:

[Severity: Medium]
Does setting additionalProperties: false here without referencing the
common LED schema prevent the use of standard properties like color and
function?

Because the schema validator will reject any unlisted properties, device
trees cannot be modernized to use standard LED subsystem properties, which
are explicitly recommended over the deprecated label property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821123723.1982=
86-1-challauday369@gmail.com?part=3D1
