Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437E134CFD3
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 05:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784613489; cv=none; b=Bovkq/fZ7UwfHwLwU43KrfeoxMle1Ywea7R8UNJXNR++tVqhBpvDRsudYf+vA0TpEIoTbRB6pC4i02SGETwO5v/DW+tfe7GKqPtDKUDrrmSOeHbX8EQg7fHOEQcAtcvCtvJ5etw+BaTx43IdgSUFV7W9kjMBSInaMDSYayC6+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784613489; c=relaxed/simple;
	bh=cFgEz4Qky+Sfj4dFHz445S8/cVE7foNTUBMIN6xNDjk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JmPwFO74RATfHXXF7kIX+IXROpiKaQxzJeVSodWPxUcgHPWMsRRBM6QqagpCT8snmtWutaQG7bLf/FB4mnKbywHgSrVpCzL6J6lcKHWu5RYua9nf0RU0d8Lj8W/XCj/5WgwS33vkZVNfGxVlbVRb/OqshD2UvR+BEKF4+JoQxfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqlCxlAJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqlCxlAJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A673C1F000E9;
	Tue, 21 Jul 2026 05:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784613487;
	bh=R3faEPjU+zGAAlzKyYcNJwBPCp95hyCV/pWp0JsSz04=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QqlCxlAJ3EMfyuCMwvWLP0gdRCizK+43pbr2GI7H6sWYE7la8XtACNEbQkLsGl8w9
	 XBSYhjVue2wfbQwoYyC5wUARVIqe0bRBT9tftDg0KDOqP685Gn5mbInHksX0SKmLXK
	 YDEqCx26Zvmwaf21MAoxxDfEMSB4XQl+jBLgsfa27T68R7+rMpyEJua0qCpTx5iUEQ
	 cmtQiHcpXlMByuZVr2nX8esMQ1L+E9gICjCXNZBPrsEBtsT17wbMEP8GO9SPuPUKsa
	 1UsGN9R+SvU7pWRlkBAt7Y6I6Vj1Esu1N/80/IqG2ZcAgbjPluGd+byUkSCJyZVonC
	 D8WNMn3K787fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] leds: rgb: s2m: wire up of_match_table in platform
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: kr494167@gmail.com
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260721054846.34318-2-kr494167@gmail.com>
References: <20260721054846.34318-1-kr494167@gmail.com>
 <20260721054846.34318-2-kr494167@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 05:58:07 +0000
Message-Id: <20260721055807.A673C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Wiring up `.of_match_table` without validating `dev->parent` allow=
s arbitrary device tree instantiation, leading to a NULL pointer dereferenc=
e or type confusion.
- [Low] The commit message description after the subsystem prefix is not ca=
pitalized, violating the LED subsystem guidelines.
--

--- Patch [1]: [PATCH 1/2] leds: rgb: s2m: wire up of_match_table in platfo=
rm driver ---
commit b11896849c3c9816b4973c7b324b0ca877cb4766
Author: surendra <kr494167@gmail.com>

leds: rgb: s2m: wire up of_match_table in platform driver

This commit wires up the of_match_table in the s2m-rgb platform driver.
This enables device tree based probing and module auto-loading, fixing an
issue where the MODULE_DEVICE_TABLE entry was dead code.

> leds: rgb: s2m: wire up of_match_table in platform driver

[Severity: Low]
This isn't a bug, but the commit description after the subsystem prefix
should be capitalized according to LED subsystem guidelines.

> diff --git a/drivers/leds/rgb/leds-s2m-rgb.c b/drivers/leds/rgb/leds-s2m-=
rgb.c
> index d239f54eee901..28964de6920ca 100644
> --- a/drivers/leds/rgb/leds-s2m-rgb.c
> +++ b/drivers/leds/rgb/leds-s2m-rgb.c
> @@ -415,6 +415,7 @@ MODULE_DEVICE_TABLE(of, s2m_rgb_of_match_table);
>  static struct platform_driver s2m_rgb_driver =3D {
>  	.driver =3D {
>  		.name =3D "s2m-rgb",
> +		.of_match_table =3D s2m_rgb_of_match_table,

[Severity: High]
Does wiring up the of_match_table here allow the driver to be probed via
an arbitrary device tree node?

If the driver is instantiated via a standalone DT node instead of through
the expected MFD parent, dev->parent might not contain the expected driver
data.

In s2m_rgb_probe(), the driver relies on the parent's drvdata:

drivers/leds/rgb/leds-s2m-rgb.c:s2m_rgb_probe() {
	...
	struct sec_pmic_dev *pmic_drvdata =3D dev_get_drvdata(dev->parent);
	...
	rgb->regmap =3D pmic_drvdata->regmap_pmic;
	...
}

Could this result in a NULL pointer dereference or type confusion if
pmic_drvdata is NULL or points to an unrelated structure?

>  	},
>  	.probe =3D s2m_rgb_probe,
>  	.id_table =3D s2m_rgb_id_table,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721054846.3431=
8-1-kr494167@gmail.com?part=3D1
