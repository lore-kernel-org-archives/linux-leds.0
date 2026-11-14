Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654367;
	b=XoK/kP8qY/ETlPjSP+yULD+rU7iso1Y8c8ZZ/UnDg5JdIRQBaY5T16Hito6czh9jihQD
	 wva0MGWcuRZGwJvPtSpu5D8gzlO27b/QjrE/WDSxAnzL2YZo6gX1hEg/euo7FuCd6yplI
	 jabpnLKx8F4nfKjIlzxp6Jc3kf/QyXF8P+a6mvSiQWcq5ese2ifPBEyG7veej8tXu+lK3
	 U1hEwezO+cazqKoekiXZUx8w662kiqq1Bt/waXF84kEiK7lMnDPDf2ki254TAZJR47Z5M
	 ROLBoV3NuA1duarDMw0oIGaN5gAkOrlAZrMrWBrtVNK4zVDucban7hcBWAmH1sOhZMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654367;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=swa3pF9JtyfTmztFbkqLeYbkCarbgn53aEG+M5+Ug5A=;
	b=OslDucUsbqOjkD9a20xyRAURxLQFeowFIVK0xlXdP6s06NloDIAWFtsakO1b3FVjudw2
	 Gzwb+UN7lqu736cCFgwF2mKSfSPa82DSCxxlfb1yEpaaKk36yl3OwXWLb+nEiQCb8YLwQ
	 ZnoT5ICwvRqk7dvgAglfO7Yus7CBF/a9CnFM6ksfHwaTjsh/HxNw4L6QPA7pQTFsDKkvh
	 Z4C9+phiTISs3j2KsVumlwR8hp+fBmUhep6vsdEqx+G0CaWOjim/HZuFXbz3t2ilhTg2d
	 7YEaodJVvUjaQyp0SmFSFeHL+ljSL/ZNVlBz8GzOACya8799lPX1v+1t6eCfenJEJfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TdNaCl2j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C9A606A323;
	Sat, 14 Nov 2026 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TdNaCl2j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAC11F000C5;
	Sat, 14 Nov 2026 11:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794654366;
	bh=swa3pF9JtyfTmztFbkqLeYbkCarbgn53aEG+M5+Ug5A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TdNaCl2j0wqVSatCa4uaZnk50Ml5qMx3vjtdu+Z+vNJdnty+ih3LaWkzfPzpNxVWq
	 oZ3Wv9NhoYwSCxKCVRCMCsydg+QIV1yZwDMyHfXKIOJ1tA8PcQ+mek02GBwO/gpAAO
	 JVConP3talN2jpJgeaqSQWBDwqzLTw1YZ8ZTKxYweHXboHiDCOr+cg40h6cAxX63XK
	 A1H2Jam0sArLkakH87rBi+F8aZUFG4kQZFoHct+aNPAGeiClHKsSXqg4ETU9oqZh3c
	 lKkIeHJiGECPIjHtOJPxEsbPkkPRBDnAxyImCTn7mtHJGvi1lJkOoSs73m92sw+jxg
	 VyDtszXP6JeEQ==
Message-ID: <sashiko-outbox-214383@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware
 control support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261113110546.173624-4-a.shimko.dev@gmail.com>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-4-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:06:06 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] net: phy: dap8211r: link trigger rejected in
  dap8211r_led_hw_is_supported()
- [Medium] net: phy: dap8211r: LED register not cleared in
  dap8211r_led_hw_control_set()
--

commit 7e5f0824bef63e117be29a9ce8d9c67d5c813bfa
Author: Artem Shimko <a.shimko.dev@gmail.com>

net: phy: dap8211r: add led hardware control support

This commit adds hardware LED control support to the DAP8211R PHY driver by
implementing the led_hw_is_supported(), led_hw_control_set(), and
led_hw_control_get() callbacks.

> diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> index 4eb50c26397fb..2e371c231d32c 100644
> --- a/drivers/net/phy/dap8211r.c
> +++ b/drivers/net/phy/dap8211r.c
[ ... ]
> @@ -57,6 +58,33 @@
>   */
>  #define DAP8211R_DEFAULT_DEL_SEL	0xD
> =20
> +#define DAP8211R_LED_ID_0		0
> +#define DAP8211R_LED_ID_1		1
> +#define DAP8211R_LED_ID_2		2
> +#define DAP8211R_LED_0			0xA00C
> +#define DAP8211R_LED_1			0xA00D
> +#define DAP8211R_LED_2			0xA00E
> +#define DAP8211R_LED_ACT_BLINK		BIT(13)
> +#define DAP8211R_LED_FULL_DUPLEX	BIT(12)
> +#define DAP8211R_LED_HALF_DUPLEX	BIT(11)
> +#define DAP8211R_LED_TX			BIT(10)
> +#define DAP8211R_LED_RX			BIT(9)
> +#define DAP8211R_LED_LINK_1000		BIT(6)
> +#define DAP8211R_LED_LINK_100		BIT(5)
> +#define DAP8211R_LED_LINK_10		BIT(4)
> +
> +#define DAP8211R_LED_LINK		(DAP8211R_LED_LINK_10	| \
> +					DAP8211R_LED_LINK_100	| \
> +					DAP8211R_LED_LINK_1000)
> +
> +#define DAP8211R_LED_SUPPORTED_TRG	(BIT(TRIGGER_NETDEV_LINK_10)	| \
> +					BIT(TRIGGER_NETDEV_LINK_100)	| \
> +					BIT(TRIGGER_NETDEV_LINK_1000)	| \
> +					BIT(TRIGGER_NETDEV_TX)		| \
> +					BIT(TRIGGER_NETDEV_RX)		| \
> +					BIT(TRIGGER_NETDEV_HALF_DUPLEX)	| \
> +					BIT(TRIGGER_NETDEV_FULL_DUPLEX))

[Severity: Medium]
Should DAP8211R_LED_SUPPORTED_TRG include BIT(TRIGGER_NETDEV_LINK)?

Without it, dap8211r_led_hw_is_supported() returns -EOPNOTSUPP whenever
TRIGGER_NETDEV_LINK is requested, so enabling the netdev link trigger on a
DAP8211R LED fails and the TRIGGER_NETDEV_LINK handling in
dap8211r_led_hw_control_set() is never reached.

[ ... ]

> @@ -142,6 +170,156 @@ static int dap8211r_modify_ext(struct phy_device *p=
hydev, u16 reg, u16 mask, u16
[ ... ]
> +static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 ind=
ex, unsigned long rules)
> +{
> +	u16 led_mode =3D 0, led_reg;
> +
> +	switch (index) {
> +	case DAP8211R_LED_ID_0:
> +		led_reg =3D DAP8211R_LED_0;
> +		break;
> +	case DAP8211R_LED_ID_1:
> +		led_reg =3D DAP8211R_LED_1;
> +		break;
> +	case DAP8211R_LED_ID_2:
> +		led_reg =3D DAP8211R_LED_2;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK, &rules))
> +		led_mode |=3D DAP8211R_LED_LINK;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
> +		led_mode |=3D DAP8211R_LED_LINK_10;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
> +		led_mode |=3D DAP8211R_LED_LINK_100;
> +
> +	if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
> +		led_mode |=3D DAP8211R_LED_LINK_1000;
> +
> +	if (test_bit(TRIGGER_NETDEV_RX, &rules))
> +		led_mode |=3D DAP8211R_LED_RX | DAP8211R_LED_ACT_BLINK;
> +
> +	if (test_bit(TRIGGER_NETDEV_TX, &rules))
> +		led_mode |=3D DAP8211R_LED_TX | DAP8211R_LED_ACT_BLINK;
> +
> +	if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
> +		led_mode |=3D DAP8211R_LED_HALF_DUPLEX;
> +
> +	if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
> +		led_mode |=3D DAP8211R_LED_FULL_DUPLEX;
> +
> +	if (!led_mode)
> +		return -EOPNOTSUPP;
> +
> +	return dap8211r_write_ext(phydev, led_reg, led_mode);
> +}

[Severity: Medium]
Does returning -EOPNOTSUPP when led_mode is 0 leave the previous trigger bi=
ts
enabled in the PHY register when all trigger rules are cleared?

When the last active netdev trigger rule is disabled (rules =3D=3D 0),
dap8211r_led_hw_is_supported() returns 0, so set_baseline_state() in
drivers/leds/trigger/ledtrig-netdev.c calls hw_control_set() with mode =3D=
=3D 0
to turn off the hardware triggers.  Returning -EOPNOTSUPP here skips
dap8211r_write_ext(), leaving the old configuration active in led_reg.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113110546.1736=
24-1-a.shimko.dev@gmail.com?part=3D3
