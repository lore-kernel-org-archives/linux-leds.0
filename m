Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C143909BF;
	Thu, 18 Jun 2026 11:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783705; cv=none; b=YJ488Ysx7cpUzIfsUXCU7J1tPQoUoylqdssSjYcm8lVLHKh0EbDMcIgVIh/maJYNZbK7aWtY1jDhiTrUVO97PKgB7x1WWiul/ykAfJHsVw2yuISKFzGfTY9RerBKCyk4q/K2Hqxlztw17FTTR4KZ33Ry4oy+qE3ELSn/Uh5BB6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783705; c=relaxed/simple;
	bh=l3xYCaUqNLFB409DbywWeGiJwxho6W5c1fcfUc4WayQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOlTGyeIrmrDYlz26oJnAP2hju9dQFs/BFlkhdbbz0ZBZAKDHMjCOSMRDre0LLA7zRD0xvfk/3/N/Oi9FX61VXyL7oy971VJsf5LaVxKZ6zh88dZ5kfFDR/lcrGgCthIR4zr2/jbeFa03cWTwAbNc0lWcBrm/zSewzBeI6sJNIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtMAoVS3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtMAoVS3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938DB1F000E9;
	Thu, 18 Jun 2026 11:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781783704;
	bh=gRppDPydiWQJfhNbFyOZwg7MxIHmG/ehzuishIepgAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YtMAoVS3z8XSHoQAABYh+HuF7aVoM/AWETVxacFfpWETS+74LV31SSXdA6+XA0dVN
	 QEsNsItN5zB9c2A0PGNqOiGZMQ2Lwff/ezhhVtuOmYli9FpggX9qoCD4sb1/4oLPKu
	 oWa4hJWjjcohCiUpr+XLP/wJBbDJKtFeK125byzrWSaWcsdFVtXvW2zQF8yJKnyCM3
	 x5cOTxBVTU2SrA07+KYnZPNQaNa4yIshRoWrx5pLS0Cxvn2wSP4Pa+9nOAIuUICSHS
	 v6h+7AqCTj7gvIjzzFStnM40EGeik7ocEVV81jJPUFhNprMgxTvulZOCleFc94Q4Tc
	 1GjwCMnIhce0A==
Date: Thu, 18 Jun 2026 12:55:00 +0100
From: Lee Jones <lee@kernel.org>
To: Mert Seftali <mertsftl@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	Dan Carpenter <error27@gmail.com>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] leds: lp5860: Return an error for an out-of-range 'reg'
 property
Message-ID: <20260618115500.GG1672911@google.com>
References: <20260612201637.197608-1-mertsftl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612201637.197608-1-mertsftl@gmail.com>

On Fri, 12 Jun 2026, Mert Seftali wrote:

> When fwnode_property_read_u32() succeeds but the channel number exceeds
> LP5860_MAX_LED, ret is 0. The error path then passes 0 to dev_err_probe()
> and returns 0, so an out-of-range "reg" value is silently treated as
> success instead of being rejected.
> 
> Set ret to -EINVAL in that case so the invalid channel is reported and
> propagated as an error.
> 
> Fixes: 3daf2c4ef82b ("leds: Add support for TI LP5860 LED driver chip")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202605210624.3gcr3prk-lkp@intel.com/
> Signed-off-by: Mert Seftali <mertsftl@gmail.com>
> ---
>  drivers/leds/rgb/leds-lp5860-core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> index fd0e2f6e6e0f..9eeb01b3e56a 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -115,6 +115,8 @@ static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *
>  
>  		ret = fwnode_property_read_u32(led_node, "reg", &channel);
>  		if (ret < 0 || channel > LP5860_MAX_LED) {

Whilst we're hear, let's split this out.  If 'fwnode_property_read_u32()'
fails, 'channel' is not populated.  While short-circuit evaluation protects
us here, separating the error paths would allow us to use the preferred
'if (ret)' check instead of 'if (ret < 0)'.  It would also let us provide a
more accurate error message, as 'reg' is not missing when it is simply out of
range.

> +			if (ret >= 0)
> +				ret = -EINVAL;

Avoid this nested check entirely by assigning 'ret = -EINVAL' directly
within a separate block for the out-of-range check.  This would keep the
flow a bit cleaner and easier to follow.

>  			dev_err_probe(led->chip->dev, ret,
>  				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
>  			fwnode_handle_put(led_node);
> -- 
> 2.54.0
> 

-- 
Lee Jones
