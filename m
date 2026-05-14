Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD09534403F
	for <linux-leds@vger.kernel.org>; Thu, 14 May 2026 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778776834; cv=none; b=S57KdoRv5SehM365Bao/LO0gUuUZKYbH1Xct9AjC8/I4nh0dUFb9Vhw/RO/yGtTBxMp8Ey+7pUaqa7WdXQuLvieP0V07CHAvdwfpRv2H7tYB8QGS5SNUZSXPMxHNI4bjkNurGu/UemaxJtXTa0KnwJwHDZsOuDxmMlUXwL9l1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778776834; c=relaxed/simple;
	bh=teksZAJ/EX9Z2tDQzhONkNV/W4GduDsC2SeFcDF4H9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6eNITwxVPLI14lGXBgG5hsAXyxqlB0+Xoeiyf4+DvgmgT8TIaiFm9wG7ls2IqVZqwxg7bRAmR3qS6K3AfFj0XuSXYCuNj0/EdYQ+qO2UjR8P4Ss715D1GnKn6y+URtnJXIpDD2BFTVWrXFmRFz12OQQ6zH0tJ0GaWiQyYFjnSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUOUSdcl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUOUSdcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D2CC2BCC9;
	Thu, 14 May 2026 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778776834;
	bh=teksZAJ/EX9Z2tDQzhONkNV/W4GduDsC2SeFcDF4H9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUOUSdcldJHO9ZygtW7745AzOpsGhCZeNVbFNY5zN3Dhh+BlTLnaKhDGxbRRbGUTm
	 hs8ZXsJuXMr9bM9uXAZmOVKhqR96PYzXD2ZEmXV+ANA+uV4ZVhf1Mj8nVILa7j4dAl
	 3BmRle1bYhKbPVbS3PSpRF9NDRSqLM7aLpCyO9ncRiIrb8Zc0/w6vxWxEUAPjoCgIO
	 EytEpgvTSVNqdluqGxzd/cQdLew4LaEXiIg4isiJqICg/HdGu54jVvV72+3FO+qdrs
	 dIFjBmnQh/E9OOF6YXW19+tUAhKNyD1srPeOldYzOitx52WVAa4ePXU/uv4DPJwbL3
	 txFMrCaziNgtw==
Date: Thu, 14 May 2026 17:40:31 +0100
From: Lee Jones <lee@kernel.org>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: core: Fix race condition for software blink
Message-ID: <20260514164031.GQ305027@google.com>
References: <20260423113638.2079302-1-craig@mcqueen.au>
 <20260507115907.GF305027@google.com>
 <19e0507bcfe.b2da6346184484.1331248575877259177@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e0507bcfe.b2da6346184484.1331248575877259177@mcqueen.au>

On Fri, 08 May 2026, Craig McQueen wrote:

> Lee Jones wrote
>  > On Thu, 23 Apr 2026, Craig McQueen wrote: 
>  >  
>  > > led_set_brightness() function: Change handling of software blink to 
>  > > avoid race conditions when stopping blink and setting brightness. 
>  > > 
>  > > Triggers may call led_set_brightness(LED_OFF), 
>  > > led_set_brightness(LED_FULL) in quick succession to disable blinking and 
>  > > turn the LED on. If the delayed work task has not yet disabled blinking 
>  > > by the time the second call occurs, then the brightness also needs to be 
>  > > changed in the delayed work task. 
>  > > 
>  > > Signed-off-by: Craig McQueen <craig@mcqueen.au> 
>  > > --- 
>  > >  drivers/leds/led-core.c | 33 ++++++++++++++++++++------------- 
>  > >  1 file changed, 20 insertions(+), 13 deletions(-) 
>  >  
>  > I think this needs more eyes on it and to be thoroughly tested by others. 
> 
> The problem I have seen is when a Linux driver controls a trigger to change it from flashing to steady-on. I've seen it specifically with LED core's software blinking.
> 
> /* First stop the blinking */
> led_trigger_event(&udev->led_trigger, LED_OFF);
> /* Next turn the LED steady-on */
> led_trigger_event(&udev->led_trigger, LED_FULL);
> 
> Without this patch, the LED usually ends up in the off state, rather than on.
> 
> I have tested this patch on a Rockchip RK3328 based system (ARM 64).

I'm sure that this patch does work for you.  Just as the last iteration
of this function has been working fine for everyone else for the last 10
years.  However, since this is core change, I shall be exercising
caution.

If anyone would be kind enough to test it, or provide some extra eyes,
I'd be appreciative.

-- 
Lee Jones
