Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693397;
	b=eTR4Aa44BhqbwijdmQURMeRama6lP5dm50U8UDSfPaeO+dLUH/i3wlGf17lV1qXpfqxy
	 l0akGK/+vx3MZDubEofHJNkLpLDl99Aq38V7SdCEUvwoZx4+r3eXrzSUJDG8nwPe9IDKj
	 PX2t4k4nLoAIVLSvhN6c56oKMMJ/6M8idDOCUFFjbS6DJ7AZrVTTp56jdsDvXwQmtHJ1Q
	 JYcHIeLYmey10MHW8c/2WLunKxHzpmtyfsXESMsWKu5DODD379B2vqAonFy1xwNftSQVh
	 /S4j7g5AdW1my3Q+wOlOuXu+JeAVDEDSkdiiRBfOv4RcHSDkCodOIeveKRmpJJjTqxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693397;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=7R4CH0zzGfCB2KOv8qhcvynv/km/UmTP3//CHtLZhNk=;
	b=FjPzrlEPFDixcJVDgz3pFCemZGJWvJXFzk4Gt7C72QXHM7uX1fGsE6rEdK1VMDRIZt/G
	 OLU6u7YUkurnjaNz8rYSia7bhJ0pO3Uw0WVraVfpXz/1NDL8W3fuWDd5QGJBIjwbowTpy
	 S8yTNmWUOH6N9DYIB+u6eo9+vO+sM+681D350Dk46tKQOXpIT64K8C28bo1D7WztD23jF
	 vs/s/IqCX0x67Q8tq/uO2Q0T9VDFBQ8HpL3hueqvhVaMXORLQ6qckU7gGhvmqPqHgTWSD
	 OBsbdarxuB2TPawVVvyVmSSWts71EfwzNkptzj1xq34D3VF5mVv4ZoR8UTbgm2IOnbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DL8e24uD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E6606A31C;
	Thu, 26 Nov 2026 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DL8e24uD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1661F000CF;
	Thu, 26 Nov 2026 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795693396;
	bh=7R4CH0zzGfCB2KOv8qhcvynv/km/UmTP3//CHtLZhNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DL8e24uDaV9+JEvYib5GRXA841xxKF0uJ0069RnkvGULDWI4FC8LZs77Krt+JLTao
	 9LOfXbIT3qgxC6UpAK1r71rwhzrWwSp1BDiXS88XXilB40ZWgoqOd1qc7xyEqk+6m6
	 DY0ftI20mklXEQKLWD+pWNYkpyo9C0eaYWnr19yU7qugQ7r2g4Nmia5aHZo/3sVDv5
	 hN1VRsUyMpdhLCYeJRL7kIdr+gpetRDgg3+/781zgJmuiwVpZaQzYqTY7fcwaosGHY
	 MdSWsh3P+FY4CqI55wsDjMPWJjKZsGRk+jTKPGrG6uOp1mxLDr03wrD1cyMICKOUfs
	 8ixKECR0aR/Rw==
Date: Thu, 26 Nov 2026 11:43:12 +0000
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] leds: lm3533: Support getting LED sources from DT
Message-ID: <179510281165.63755.6096974058338821986@kernel.org>
References: <20261115084347.70592-1-clamor95@gmail.com>
 <20261115084347.70592-3-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115084347.70592-3-clamor95@gmail.com>
X-AI-Review-Draft: <20261115084347.70592-3-clamor95@gmail.com>

On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:

> Add support for the standard `led-sources` device tree property to
> configure the mapping between control banks and physical low-voltage LED
> (LVLED) outputs.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/leds/leds-lm3533.c | 57 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> index 7db1105bee5c2..ad8bc3751e3e5 100644
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c
> @@ -26,6 +26,14 @@
>  #define LM3533_ALS_CHANNEL_LV_MIN	1
>  #define LM3533_ALS_CHANNEL_LV_MAX	2
>
> +#define LM3533_REG_OUTPUT_CONF1			0x10
> +#define   OUTPUT_CONF1_SHIFT			2
> +#define   OUTPUT_LVLED_MASK			0x3
> +#define   OUTPUT_CONF1_PREP(x)			(((x) << OUTPUT_CONF1_SHIFT) & 0xff)
> +#define LM3533_REG_OUTPUT_CONF2			0x11
> +#define   OUTPUT_CONF2_SHIFT			6
> +#define   OUTPUT_CONF2_PREP(x)			(((x) >> OUTPUT_CONF2_SHIFT) & 0xff)
> +
>  #define LM3533_REG_CTRLBANK_BCONF_BASE		0x1b
>  #define LM3533_REG_PATTERN_ENABLE		0x28
>  #define LM3533_REG_PATTERN_LOW_TIME_BASE	0x71
> @@ -54,6 +62,9 @@ struct lm3533_led {
>  	u32 max_current;
>  	u32 pwm;
>
> +	int num_leds;
> +	u32 leds[LM3533_LVCTRLBANK_MAX];

Since LM3533_LVCTRLBANK_MAX is 5 (matching the maximum control bank ID)
and there are 4 low-voltage LEDs, shouldn't this array size and the
bounds checks below use LM3533_LVCTRLBANK_COUNT (4) instead?

Also, are 'num_leds' and 'leds' used anywhere after probe()?  If they
are only consumed by lm3533_led_setup(), could they live on the stack
instead of here?

> +
>  	bool have_als;
>  };
>
> @@ -622,8 +633,36 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
>
>  static int lm3533_led_setup(struct lm3533_led *led)
>  {
> +	u32 output_cfg_shift = 0;
> +	u32 output_cfg_val = 0;
> +	u32 output_cfg_mask = 0;
>  	int ret;
>
> +	for (int i = 0; i < led->num_leds; i++) {
> +		if (led->leds[i] >= LM3533_LVCTRLBANK_MAX)
> +			continue;

If an out-of-range source index is provided in DeviceTree, shouldn't we
fail probe() with -EINVAL rather than silently ignoring it?  Note that
with LM3533_LVCTRLBANK_MAX (5), an index of 4 would pass this check and
corrupt bits 4:5 (HVLED2) of LM3533_REG_OUTPUT_CONF2.

> +
> +		output_cfg_shift = led->leds[i] * 2;
> +		output_cfg_val |= led->id << output_cfg_shift;
> +		output_cfg_mask |= OUTPUT_LVLED_MASK << output_cfg_shift;
> +	}
> +
> +	if (led->num_leds) {
> +		/* LVLED1, LVLED2 and LVLED3 */
> +		ret = regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF1,
> +					 OUTPUT_CONF1_PREP(output_cfg_mask),
> +					 OUTPUT_CONF1_PREP(output_cfg_val));
> +		if (ret)
> +			return ret;
> +
> +		/* LVLED4 and LVLED5 */
> +		ret = regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF2,
> +					 OUTPUT_CONF2_PREP(output_cfg_mask),
> +					 OUTPUT_CONF2_PREP(output_cfg_val));
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);
>  	if (ret)
>  		return ret;
> @@ -690,6 +729,24 @@ static int lm3533_led_probe(struct platform_device *pdev)
>
>  	device_property_read_u32(dev, "ti,pwm-config-mask", &led->pwm);
>
> +	/*
> +	 * If led-sources property is not set then either this Control Bank uses
> +	 * its default LVLED or is not linked to any LVLED at all.
> +	 */
> +	led->num_leds = device_property_count_u32(dev, "led-sources");
> +	if (led->num_leds > LM3533_LVCTRLBANK_MAX)
> +		return dev_err_probe(dev, -EINVAL, "Number of LED sources exceeds max %d: %d\n",
> +				     LM3533_LVCTRLBANK_MAX, led->num_leds);
> +
> +	if (led->num_leds < 0)
> +		led->num_leds = 0;
> +
> +	if (led->num_leds > 0) {
> +		ret = device_property_read_u32_array(dev, "led-sources", led->leds, led->num_leds);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to get led-sources\n");
> +	}
> +
>  	ret = lm3533_led_setup(led);
>  	if (ret)
>  		return ret;
> -- 
> 2.53.0
>
>

-- 
Lee Jones
