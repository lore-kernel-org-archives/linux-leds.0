Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71698149DF1;
	Wed, 22 Jul 2026 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724742; cv=none; b=g7/rEvSlMRChp4ZBXGOO1Net1ZXhVDQkAZMeE/VHQesWdbp3lY55JM7swimJWhPVPm1MKG6RlNrnS9OEqhzP5Y1OekvTCJDnCJBgfUiuzSnTClpZpLc3zpZ1TkrkPP6cdQjBdjLp/JnAbpbEAu5bAnpnxTaarqOD3XcHm4UAE/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724742; c=relaxed/simple;
	bh=WopNwOAMk11gwarrL/7/TaqO5H2xN2gVAnlRJb7wAOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZ0xt7gQUBT5mqspR2BALKzel5x8bu6fmjcx3Uitql4M/v9kyaz47lnv6wold88BRPfaJKzW4W9roRdWqvwUXvDb5c6FOmVsM9DXlQXdXKMcvDvxxNWyJIeGyrW6FGgMAlFCQ601FoGReN2Fj78fK0AtV56+HDSEavNVKgoJQ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2aL4jeG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2aL4jeG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F841F000E9;
	Wed, 22 Jul 2026 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784724741;
	bh=7bpjXwSQ7nvMtwqEfdQ1aGjqnHSfXs7DM2lWFG7w/Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c2aL4jeGVEXeNI2FNLh2itNlU4ijobGl+r+DipPdgwH7QKSzuCN5LrVhGmunG+u6g
	 Yhj4wbAqfe3k3fRhpDbMBuVrio1uFo16xhsT24166wdKAkFQsNqI+ndpxS4xYxVeBR
	 3C1tI/kIdvxgZ1gZ3IbYE+/U5N4n5i+S4M0U1zjw7IlqJjNGMu78CGuNCFkJrLoaQb
	 u/drO/5IUSdre2bA7mUW4QY6Acp51odz8Qvdxh/dvWNYmbxAt2Jcal3F1zyAPXVdyy
	 /YihCBpf36FeGcUPYeZ5ZysjgFHcjd0rX9lo/cWLfuMvAEA3i77xaITrYCeU/aKS38
	 XTbkbe/l9PcQg==
Date: Wed, 22 Jul 2026 13:52:17 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: kr494167@gmail.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: rgb: s2m: wire up of_match_table in platform
 driver
Message-ID: <20260722125217.GC11805@google.com>
References: <20260721054846.34318-1-kr494167@gmail.com>
 <20260721054846.34318-2-kr494167@gmail.com>
 <20260721055807.A673C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721055807.A673C1F000E9@smtp.kernel.org>

On Tue, 21 Jul 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Wiring up `.of_match_table` without validating `dev->parent` allows arbitrary device tree instantiation, leading to a NULL pointer dereference or type confusion.
> - [Low] The commit message description after the subsystem prefix is not capitalized, violating the LED subsystem guidelines.
> --
> 
> --- Patch [1]: [PATCH 1/2] leds: rgb: s2m: wire up of_match_table in platform driver ---
> commit b11896849c3c9816b4973c7b324b0ca877cb4766
> Author: surendra <kr494167@gmail.com>

Please use your full name.

> leds: rgb: s2m: wire up of_match_table in platform driver
> 
> This commit wires up the of_match_table in the s2m-rgb platform driver.
> This enables device tree based probing and module auto-loading, fixing an
> issue where the MODULE_DEVICE_TABLE entry was dead code.
> 
> > leds: rgb: s2m: wire up of_match_table in platform driver
> 
> [Severity: Low]
> This isn't a bug, but the commit description after the subsystem prefix
> should be capitalized according to LED subsystem guidelines.
> 
> > diff --git a/drivers/leds/rgb/leds-s2m-rgb.c b/drivers/leds/rgb/leds-s2m-rgb.c
> > index d239f54eee901..28964de6920ca 100644
> > --- a/drivers/leds/rgb/leds-s2m-rgb.c
> > +++ b/drivers/leds/rgb/leds-s2m-rgb.c
> > @@ -415,6 +415,7 @@ MODULE_DEVICE_TABLE(of, s2m_rgb_of_match_table);
> >  static struct platform_driver s2m_rgb_driver = {
> >  	.driver = {
> >  		.name = "s2m-rgb",
> > +		.of_match_table = s2m_rgb_of_match_table,
> 
> [Severity: High]
> Does wiring up the of_match_table here allow the driver to be probed via
> an arbitrary device tree node?
> 
> If the driver is instantiated via a standalone DT node instead of through
> the expected MFD parent, dev->parent might not contain the expected driver
> data.
> 
> In s2m_rgb_probe(), the driver relies on the parent's drvdata:
> 
> drivers/leds/rgb/leds-s2m-rgb.c:s2m_rgb_probe() {
> 	...
> 	struct sec_pmic_dev *pmic_drvdata = dev_get_drvdata(dev->parent);
> 	...
> 	rgb->regmap = pmic_drvdata->regmap_pmic;
> 	...
> }
> 
> Could this result in a NULL pointer dereference or type confusion if
> pmic_drvdata is NULL or points to an unrelated structure?
> 
> >  	},
> >  	.probe = s2m_rgb_probe,
> >  	.id_table = s2m_rgb_id_table,
> >  };
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260721054846.34318-1-kr494167@gmail.com?part=1

-- 
Lee Jones
