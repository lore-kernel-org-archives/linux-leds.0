Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B905C489866;
	Wed,  2 Sep 2026 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352685; cv=none; b=MZM7dpf0spmQS0DEgsTvtFWVxQOlU5EzhCJwa6+7rKByGraBREIq4tDdwzpUrPyLa0NmxINExoo2vs79EqzDk53p/COatqniDcP92nwElkfUM+P4zHaxh1W4ceNpvP1fySEt22io21LcC7DuiZ7X+pTgykaCR3x55nZ5I9mpFbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352685; c=relaxed/simple;
	bh=RiSKSJIjEyx6lqaWOIi9H8QqmbvFesfp6493+2rRlSo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MCays6sYb8Id10vJ4dC8w+M1DrSTqz5tpdyhavopbDjxm2nfWK7h7BMtF8qrsv/2AGZts/lr0poIKaMRvlP3fZj10m515AyM4Dhr7HvtjAd5Nh9fQVrJPJXoPiStPGR9dtuFezpnQoQQv/Mb6GpSo34buSWJFe1PKFB97oQzHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrkhHzL6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrkhHzL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6841F00A3A;
	Wed,  2 Sep 2026 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788352680;
	bh=X/mpNmMLwy/VfVy1aA/48xgLkKpcWMnzNYONpoqleso=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PrkhHzL6O9AqEwmUFWsLCAQ5PhXbzcSnxzxlxFIOzlnw7aW6t/3cnjwBKJBlgNsX2
	 tLEZCD55DGRCJGpFtvMQqhmxIIxq1NEkcK7o5n5vA50mUK6vBEpfF0NTA9nVIWOi7i
	 ne4Tj+8gefU/TO4dYA1I7nC7qze5kwSV+y0GeZsIWR4H86F9qLlnSPMTEi3RKunVPg
	 Wcp8VxvtdZHVA85074sjI94DY1FJ6/Jac2n2xz6VHIzVi3CqXr5TWsyHCbxJVwWbRC
	 h/bIRHGwpIh8J2dOH82huVjLKGaqYdSJkr93m1eQ+kfpvB7LJNXSvlBJrtzPiKeuK6
	 9rXU3LjeBtb1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: leds: pca995x: describe reset-gpios
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 12:37:59 +0000
Message-Id: <20260902123759.DC6841F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized, violating the LE=
D subsystem guidelines.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the driver valid=
ates the child `reg` property against `PCA995X_MAX_OUTPUTS` (24) instead of=
 the chip-specific `num_leds`. This allows 16-channel variants to configure=
 out-of-bounds LEDs.
--

commit ead1262f70ad0044c0eca7c693a6d898fbcc4d44
Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>

dt-bindings: leds: pca995x: describe reset-gpios property

This commit adds the reset-gpios property to the PCA995x device tree bindin=
g.
It allows the reset pin of the PCA995x to be described in the Device Tree.

> dt-bindings: leds: pca995x: describe reset-gpios property

[Severity: Low]
This isn't a bug, but does this commit message subject violate the LED
subsystem capitalization rules? The description after the subsystem prefix
should be capitalized.

This is a pre-existing issue, but the driver validates the child reg
property against PCA995X_MAX_OUTPUTS (24) instead of the chip-specific
num_leds:

drivers/leds/leds-pca995x.c:pca995x_probe() {
    ...
	device_for_each_child_node_scoped(dev, child) {
		ret =3D fwnode_property_read_u32(child, "reg", &reg);
		if (ret)
			return ret;

		if (reg < 0 || reg >=3D PCA995X_MAX_OUTPUTS || led_fwnodes[reg])
			return -EINVAL;
    ...
}

[Severity: High]
Does this allow 16-channel variants to configure out-of-bounds LEDs?

Changing the brightness of out-of-bounds LED channels (16-23) on 16-channel
variants (e.g. PCA9955B) calculates a pwmout_addr that overlaps with the
IREF registers (output current control) for channels 0-7.

Could this cause silent hardware state corruption and potential physical
damage to LEDs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6d3600f99c77c31166f=
0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com?part=3D1
