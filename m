Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4766653FD2B;
	Wed, 14 Oct 2026 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991316; cv=none; b=Ih/Z0lOi6fTOPLUK2rA5+L5vug7yVHEwaNvZGadECCCPryaqc1uB3icE6cFyVxGxqyM+rs7RZV7rHl7r2jngBmjS5UpVU8SeBNxxKqcCbfYqL2w0HBSQqnDMnN6zTgItNK/X6z5U03fWWpEhQCl4R7JQEYWEsBVJp1PkGv3EEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991316; c=relaxed/simple;
	bh=pd0AGV5iZMRWYNmpEXwYk+RzEai9sreo2tcFYocO5Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJP84LnYxMuGpVX2JOJa3EOBq4Fn7ZC0MLuhifSQlofU9iyRUEUeTs3SOqBSFZ/wVLxwBwvmxg8xLhaPjbCYokrFKpu3UjIno0SigliP97rqsREjbiodNyhZDOoWISwTAG0xUhzprPEl9vvOwbWoDV/WeqZrwS4+kerHqByY3Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kun6kRZc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kun6kRZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8706F1F000C4;
	Wed, 14 Oct 2026 15:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791991314;
	bh=LZCBvqQBfTrZjWEST58LrCPndXXroTsoZDc3GnNnim8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kun6kRZc53Gu5O24HJKgnwi3c0hZQguFFwHp9yfa1DWiVfdIoUJbMYJmqpbgYZ0h7
	 66J7thft1CO4Lb6sGNLEIZ+KPCYV8Wbl22LNJedEVHePOvl4O3YF6pgzqI1Xz6frxs
	 yjAKnm5STZ9SYXe5NpfNps8WVKpeQ9D0Q92OHB8PON5dlroLaO8bpizWLirpHASqdx
	 9gaiY2HK/opT6VbKTEJkViXQHvoatDgx6QzfT/NKIybW7rkP0+6/BUWkWFnnLS6jMd
	 NHizjRhXjgLa43zTRrncUA2hXrcieB1cn0nyX5K3nQxs39AR2dMmGVOkV/YTWKjKqF
	 n351HWlalL+UQ==
Date: Wed, 14 Oct 2026 16:21:51 +0100
From: Lee Jones <lee@kernel.org>
To: Ruslan Koreev <koreev.r@gmail.com>
Cc: pavel@kernel.org, rillian.grant@gmail.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: flash: lm3643: Return to standby when the last
 output is switched off
Message-ID: <179198511712.839288.17752967041610699661@kernel.org>
References: <20260821083620.68324-1-rillian.grant@gmail.com>
 <20260924172040.1185688-1-koreev.r@gmail.com>
 <20260924172040.1185688-2-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924172040.1185688-2-koreev.r@gmail.com>
X-AI-Review-Draft: <20260924172040.1185688-2-koreev.r@gmail.com>

--- checkpatch.pl: clean (0 issues) ---

On Thu, 24 Sep 2026, Ruslan Koreev wrote:

> Setting the torch brightness of an output to 0 only cleared its enable
> bit and left the mode bits at torch (or flash), so the chip kept its
> boost converter running with no output enabled. Likewise switching the
> strobe off returned early when the output's enable bit had already been
> cleared, leaving the mode bits at flash. Both were flagged by the
> Sashiko review of the RFC, which Lee Jones asked to have addressed.
>
> Clear the mode bits together with the enable bit whenever the sibling
> output is not active, so that the chip goes back to standby when its
> last output is switched off.
>
> Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>

Given that the base series hasn't been merged yet, please coordinate with
Rillian to fold these fixes directly into the next version of the original
series rather than sending fix-up patches on top of an unapplied RFC.

> ---
>  drivers/leds/flash/leds-lm3643.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-lm3643.c
> index 48e164261..bbe9358c9 100644
> --- a/drivers/leds/flash/leds-lm3643.c
> +++ b/drivers/leds/flash/leds-lm3643.c
> @@ -271,9 +271,15 @@ static int lm3643_torch_set_brightness(struct led_classdev *led_cdev,
>  	    mode != LM3643_MODE_TORCH)
>  		return -EBUSY;
>
> -	if (brightness == 0)
> -		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE,
> -				chan->enable_bit, 0);
> +	if (brightness == 0) {
> +		unsigned int mask = chan->enable_bit;
> +
> +		/* Last active output: leave torch mode, back to standby */
> +		if (!(enable & sibling_bit))
> +			mask |= LM3643_MODE_MASK;
> +
> +		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE, mask, 0);
> +	}
>
>  	ret = regmap_update_bits(led->regmap, chan->torch_br_reg, LM3643_TORCH_BR_MASK,
>  				 LM3643_TORCH_BR_CDEV_TO_CODE(brightness));
> @@ -365,11 +371,16 @@ static int lm3643_flash_strobe_set(struct led_classdev_flash *fled_cdev, bool st
>  	mode = enable_reg & LM3643_MODE_MASK;
>
>  	if (!state) {
> -		if (mode != LM3643_MODE_FLASH || !(enable_reg & chan->enable_bit))
> +		unsigned int mask = chan->enable_bit;
> +
> +		if (mode != LM3643_MODE_FLASH)
>  			return 0;
>
> -		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE,
> -			LM3643_MODE_MASK, LM3643_MODE_STANDBY);
> +		/* Leave flash mode once no other output is strobing */
> +		if (!(enable_reg & sibling_bit))
> +			mask |= LM3643_MODE_MASK;
> +
> +		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE, mask, 0);
>  	}
>  	if ((enable_reg & sibling_bit) && mode != LM3643_MODE_STANDBY)
>  		return -EBUSY;
> -- 
> 2.55.0
>

-- 
Lee Jones
