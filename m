Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE2F4BB271;
	Thu, 10 Sep 2026 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055479; cv=none; b=Yoy+k3u0nP68oQJKMdEDcZkzMcSTnP+EFcqmWVr2tMzw8OJGWeNs4ypAWEHXdEhIxqmejxGnJ7ymazzLxqINDt/nybKcsymSsvYd9imUc/A/UaVY1owXyKvSxzR7YPS0juaDlHSNPl70RTHn8Q6Y29KauNHp2UEhQ8L1AoqANHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055479; c=relaxed/simple;
	bh=W2hGv1Lcru20yCjX4R8ZXDurK3qwcvVfeW4sqbiK4AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpydFf0wTXUL5LDdVTunkBt7akj2ks4USnesp7Vi9qOrDSYYUHoWuQJWnq7APnCmD9DIaksT+GcFsBXuOoRJEaJ3MUiacSDRjCoxO0uvSgAQNR5u0PZMYZtM7oa0JgCgkGuslkgV82YEFu0ER16bzvC8DSnbrAx9tqmCyP2DbOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0sC2oZo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0sC2oZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AEF1F000FF;
	Thu, 10 Sep 2026 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789055477;
	bh=t4gms4s00McJZzCyVBDIDyBx4Cvn+/tejggdvcXSlaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M0sC2oZoHwmy3wBLpp4CDl+xs9p+v7h6EFeYlMiagVJ+1LGqiUQDcCQMVWYwNW8wU
	 xyFrXtasiR2zO814iUUOO0IGxU2Tgfqdux/V7pA6T/p+E0rucZTiRP2w1Rq+xGrA8N
	 REYIu4buvnVAmqdcxmLmb0MBd6Z/RrotRv70d+YdCM/OFU86msLFZCNHRKPxGuVgj2
	 VGckrwaO//JwjaMWw0eZvWOU672PFSJmGgOr1x42KZ6tsHImmDcppfnGH4cWK5Ivt2
	 GxutPfEPVljt0hMgYU6P0MTiRa8NOxpMqpaBji9AnIksKlISzSPgFELkkt7ggt13HU
	 mK1gpPgZj+1wA==
Date: Thu, 10 Sep 2026 16:51:12 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Carlo Roleda <jancarlo.roleda@analog.com>, conor+dt@kernel.org,
	linux-leds@vger.kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v11 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Message-ID: <20260910155112.GI1051768@google.com>
References: <20260903-upstream-ltc3208-v11-0-28f5f0fd364e@analog.com>
 <20260903-upstream-ltc3208-v11-2-28f5f0fd364e@analog.com>
 <20260902235602.8112F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902235602.8112F1F000E9@smtp.kernel.org>

On Wed, 02 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Incorrect assignment of num_reg_defaults using a register address macro instead of ARRAY_SIZE.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> commit 13fa42bec99e4f9ce4669e4a6a7c6f12807ee3a4
> Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> 
> leds: ltc3208: Add driver for LTC3208 Multidisplay LED Driver
> 
> This commit introduces a new kernel driver for the Analog Devices LTC3208
> Multi-display LED driver. It configures the device via I2C and supports up
> to 7 distinct LED channels with configurable current levels.
> 
> > diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/leds/leds-ltc3208.c
> 
> [ ... ]
> 
> > +static const struct regmap_config ltc3208_regmap_cfg = {
> > +	.reg_bits = 8,
> > +	.val_bits = 8,
> > +	.max_register = LTC3208_REG_G_OPT,
> > +	.cache_type = REGCACHE_FLAT_S,
> > +	.reg_defaults = ltc3208_reg_defaults,
> > +	.num_reg_defaults = LTC3208_REG_G_OPT,
> 
> [Severity: Low]
> Does this code intentionally use a register address macro for the array length
> instead of ARRAY_SIZE(ltc3208_reg_defaults)?
> 
> Because LTC3208_REG_G_OPT happens to evaluate to 7, it coincidentally matches
> the exact number of elements in the ltc3208_reg_defaults array. However,
> using a register address macro to specify an array length creates a brittle
> semantic dependency. If elements are removed from the array, or if a register
> with a different address is added in the future, this will result in an
> incorrect size being passed to the regmap core.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903-upstream-ltc3208-v11-0-28f5f0fd364e@analog.com?part=2
> 

-- 
Lee Jones
