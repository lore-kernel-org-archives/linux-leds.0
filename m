Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C9E3E0C48;
	Thu, 19 Mar 2026 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933347; cv=none; b=uzeg/jdRJp/CXtWKjwmeSUKXS2S8Sv3aHjkSof314TLrDfJonA5S2U1O2YwcjEXM8dUsZh82+wkMu7waWkRLTC+C1vm7mm2ZZuaRtiv4otGKxlKvG0HOPVdtRXQ/U+yekeAgOeQFJ9tpEkaGKAt1sr5ZHuQvdjw7HhlfXAxP8bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933347; c=relaxed/simple;
	bh=21V6QskOrtkBzoy+NibzY06hvc3idoW+2lYOMsUtL5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Emun4HweLged4yEInXrymPhG/2mIi6i0Ct/5L54kAuCT6Uf9AX3yp0RX8pAAIwXTC2juLxQl0nd7XEQO2tLfukNbLswm1Kt6By1jSWgsUmH9fxglUJYdmiRrz8RjOX9nkOz6SQsUzq86dG2aD/icfEsenH/U64xumxjQDRCYF/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZY5IfaKs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZY5IfaKs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC496C2BCAF;
	Thu, 19 Mar 2026 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773933346;
	bh=21V6QskOrtkBzoy+NibzY06hvc3idoW+2lYOMsUtL5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZY5IfaKszlJSeP73YMJenUDMAUQJ8DrHETC6Q8nCly4gM1ujHj0XHX+KIgSPjz2HK
	 XS6cl/aHmDKWi30JGoC4sAOTPXIJUN+utrAOdGS1q2EsxxxIaUP6EbbP3p73aRF/YZ
	 /siIRVTSuT5UOL8omUCq8JeqSTmw5UsfrYqD1uxy3kWKkzWm/cliygHSrgwx7qQgz7
	 bdN4t0jRvEuTtGUCP7uAeS5cMV9U3izuzF4dKYuHBlIRsWPgUTneqEsbgU7BGD2GK6
	 mvSgiVJW11EUVt1LLVxLyErkLzEGWWN80OSLnUwAy/Epbwu5h12nXFMLfOnOrioIqi
	 IFgZgD1K6AJTA==
Date: Thu, 19 Mar 2026 15:15:39 +0000
From: Lee Jones <lee@kernel.org>
To: Richard Lyu <richard.lyu@suse.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lm3642: use guard to simplify locking
Message-ID: <20260319151539.GO554736@google.com>
References: <20260311040034.25937-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311040034.25937-1-richard.lyu@suse.com>

[Actually Cc:ing the list this time!]

> The mutex_lock()/mutex_unlock() pattern requires explicitly pairing
> lock and unlock calls. Use guard(mutex) instead so the lock is
> automatically released when the scope exits.
> 
> Convert to guard(mutex) in lm3642_torch_brightness_set(),
> lm3642_strobe_brightness_set(), and lm3642_indicator_brightness_set().
> Add #include <linux/cleanup.h> to support scoped guards.
> 
> Signed-off-by: Richard Lyu <richard.lyu@suse.com>
> ---
>  drivers/leds/leds-lm3642.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
> index 61629d5d6703..ee957d4da882 100644
> --- a/drivers/leds/leds-lm3642.c
> +++ b/drivers/leds/leds-lm3642.c
> @@ -12,6 +12,7 @@
>  #include <linux/fs.h>
>  #include <linux/regmap.h>
>  #include <linux/platform_data/leds-lm3642.h>
> +#include <linux/cleanup.h>

Could you please take this moment to place these in alphabetical order.

Then rebase your patch on top of it please.

>  #define	REG_FILT_TIME			(0x0)
>  #define	REG_IVFM_MODE			(0x1)
> @@ -202,10 +203,9 @@ static int lm3642_torch_brightness_set(struct led_classdev *cdev,
>  	    container_of(cdev, struct lm3642_chip_data, cdev_torch);
>  	int ret;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex)(&chip->lock);
>  	chip->br_torch = brightness;
>  	ret = lm3642_control(chip, chip->br_torch, MODES_TORCH);
> -	mutex_unlock(&chip->lock);
>  	return ret;
>  }
>  
> @@ -249,10 +249,9 @@ static int lm3642_strobe_brightness_set(struct led_classdev *cdev,
>  	    container_of(cdev, struct lm3642_chip_data, cdev_flash);
>  	int ret;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex)(&chip->lock);
>  	chip->br_flash = brightness;
>  	ret = lm3642_control(chip, chip->br_flash, MODES_FLASH);
> -	mutex_unlock(&chip->lock);
>  	return ret;
>  }
>  
> @@ -264,10 +263,9 @@ static int lm3642_indicator_brightness_set(struct led_classdev *cdev,
>  	    container_of(cdev, struct lm3642_chip_data, cdev_indicator);
>  	int ret;
>  
> -	mutex_lock(&chip->lock);
> +	guard(mutex)(&chip->lock);
>  	chip->br_indicator = brightness;
>  	ret = lm3642_control(chip, chip->br_indicator, MODES_INDIC);
> -	mutex_unlock(&chip->lock);
>  	return ret;
>  }
>  
> -- 
> 2.51.0
> 

-- 
Lee Jones [李琼斯]
