Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53494ADD89;
	Thu,  2 Jul 2026 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000180; cv=none; b=o8vwcWx1NSLmFMQ2KOacaULz4qMLlwzaGy1f7zd6fboQ5uFir6mlxCQEu1WMYgbrvqtTS3dWsyAWxxSErvCbyTLM97C0oMgRLK2agAkl1Vusa9eHY2rzRftszBs+MHryiPmis35BZeFS56bApfI9rQECTirgj7FCwAI6Agwfs3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000180; c=relaxed/simple;
	bh=G85VWkQ2/aPk9u2tihin6PCwG+OST33NH+bEGoH23l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6jNjgvQ8caegSV8GHyQ50PRVfcDLoo13G9v9dIuoogluTZnIjFYtysC7jBTIgknWD+KyK7RYRRXlhnrYdLFeOO28UldF4dX47xCAJsK0iVNDwxQYHgR9wA7vH6bMF1t5JvNCziKIIp6hI1X9mME0ustqFP9cDqC+THTw4FOj64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4d7NAQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4d7NAQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC0C1F00A3A;
	Thu,  2 Jul 2026 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783000179;
	bh=yGeq2baMUbY7SFJzHJJI30FMkpo+octfDeH0zUu/83I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E4d7NAQ3qpHqoBBOTm47ieIbLhEbHWq/zi1JxrSseLcFtg2lzOosDT0z0RrZm4bqm
	 PN7eIqXu99j13JBtG2bBklDkBGlMhk6W6HvoPCLd9C7NpO2Fr8XsNgBRths3mx3t3Q
	 svRJf1vRg6LbFJop9cnJtJIhiAMLC1EBOD9/qiTMFUFl5kHJwMlQajcbO1PiKsmo+d
	 RpWzQlG6Dcz45ZrZQtaA64u6GBGhd4Et1oXCJCoDwvekyIgJodvHn8xQN0APv/YiWk
	 fbg6nfMydOJzn1tyTlY87p9FToDUlPFdu+bD0lTImj47qLZZB6X47zX5i9V5zZk81E
	 e+HbGz6cMxqiA==
Date: Thu, 2 Jul 2026 14:49:35 +0100
From: Lee Jones <lee@kernel.org>
To: Mert Seftali <mertsftl@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] leds: lp5860: Return an error for an out-of-range
 'reg' property
Message-ID: <20260702134935.GO2108533@google.com>
References: <20260618142133.27377-1-mertsftl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618142133.27377-1-mertsftl@gmail.com>

Please consider / reply to these.

/* Sashiko Automation: Reviewed (3 Findings) */

On Thu, 18 Jun 2026, Mert Seftali wrote:

> lp5860_iterate_subleds() checks the result of reading the "reg" property
> and the channel range in a single condition:
> 
> 	if (ret < 0 || channel > LP5860_MAX_LED)
> 
> When fwnode_property_read_u32() succeeds but the channel is out of range,
> ret is 0, so the error path passes 0 to dev_err_probe() and returns 0 -
> an out-of-range "reg" is silently accepted instead of rejected. The
> shared "'reg' property is missing" message is also inaccurate when the
> property is present but out of range.
> 
> Split the two cases: report a read failure with if (ret), and reject an
> out-of-range channel with -EINVAL. Each case now has its own accurate
> error message.
> 
> Fixes: 3daf2c4ef82b ("leds: Add support for TI LP5860 LED driver chip")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202605210624.3gcr3prk-lkp@intel.com/
> Signed-off-by: Mert Seftali <mertsftl@gmail.com>
> ---
> Changes in v2 (per Lee Jones review):
> - Split the combined read/range test into separate checks: use if(ret)
>   for the read failure, and reject an out-of-range channel with -EINVAL.
> - Give each case its own accurate message instead of the shared
>   "missing" one, and drop the nested "if (ret >= 0)".
> 
>  drivers/leds/rgb/leds-lp5860-core.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> index fd0e2f6e6e0f..bc59be87b08f 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -114,13 +114,21 @@ static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *
>  		}
>  
>  		ret = fwnode_property_read_u32(led_node, "reg", &channel);
> -		if (ret < 0 || channel > LP5860_MAX_LED) {
> +		if (ret) {
>  			dev_err_probe(led->chip->dev, ret,
> -				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
> +				      "%pfwP: Cannot read 'reg' property. Skipping.\n", led_node);

This isn't a bug introduced by this patch, but while reviewing the driver
I noticed a double unlock in lp5860_device_init():

drivers/leds/rgb/leds-lp5860-core.c:lp5860_device_init() {
        ...
        mutex_lock(&lp->lock);
        ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, 
                                 LP5860_MODE_MASK,
                                 LP5860_MODE_1 << LP5860_MODE_SHIFT);
        if (ret)
                goto err_disable;
        mutex_unlock(&lp->lock);

        ret = lp5860_init_dt(lp);
        if (ret)
                goto err_disable;

        return 0;

err_disable:
        mutex_unlock(&lp->lock);
        ...
}



[Severity: High]
If lp5860_init_dt() fails, doesn't the jump to err_disable result in
calling mutex_unlock() on an already unlocked mutex?


This is also a pre-existing issue, but I noticed a potential
use-after-destroy involving the same mutex in the removal path:

drivers/leds/rgb/leds-lp5860-spi.c:lp5860_remove() {
        ...
        mutex_destroy(&lp5860->lock);

        lp5860_device_remove(&spi->dev);
}

Calling lp5860_device_remove() ends up taking the lock again:

drivers/leds/rgb/leds-lp5860-core.c:lp5860_device_remove() {
        ...
        lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
}

drivers/leds/rgb/leds-lp5860-core.c:lp5860_chip_enable() {
        guard(mutex)(&lp->lock);
        return regmap_write(lp->regmap, LP5860_REG_CHIP_EN, enable);
}



[Severity: High]
Does this sequence result in lp5860_chip_enable() locking a mutex that
was just destroyed by lp5860_remove()?

>  			fwnode_handle_put(led_node);
>  			return ret;
>  		}
>  
> +		if (channel > LP5860_MAX_LED) {
> +			dev_err_probe(led->chip->dev, -EINVAL,
> +				      "%pfwP: 'reg' %u is out of range. Skipping.\n",
> +				      led_node, channel);
> +			fwnode_handle_put(led_node);
> +			return -EINVAL;
> +		}
> +
>  		led->mc_cdev.subled_info[subled].color_index = color_index;
>  		led->mc_cdev.subled_info[subled].channel = channel;
>  		ret = lp5860_led_init(led, init_data->fwnode, channel);
> -- 
> 2.54.0
> 
> 

-- 
Lee Jones
