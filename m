Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079455;
	b=L8cHhmKOx3UrCFxJC9Ma5DENidlIrKuFJHlo2rtwEj3rRkz+yi6SDTVjyTIsHjxUs2G9
	 WCG26o1NBRoCLII41O8MFpUX+D6uNzt14IvSUeWJ7rTqMDMWzYjtB9Al6WhNlt2JM7Eym
	 XpBhG9GOcTGZm/MWLlu9sPpWyhac4pYcYKzCJ9CcpaOpcjL4ktcwhMHZ003rasa15IsA/
	 UJ6MLVoyoH1QSk2qjdep7/ldhNJTaikWqzk3KWeq7/sanuCUyAm3eW3SuxlH4zjLhQi8A
	 y0tXOEOuZRHlqu40hbJWvkqFzZlDfncrP8hTS9EpmOMFJHTTyJeoA43iH3uDa7PQSiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079455;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zsxpdu4aQ7yzHZ4VOT1oVEJDFztOr6C0cNni0HqSOyQ=;
	b=SwXXDhI6oA9PkLpzmgij92mg2wxgd6vXGUUEDXKYV9txW0K/7lrdNJMwEYSxC3p0tVf4
	 LjexgQxko/VU4yskA0mogilRFU0XILreoIP3ZXq3EHdVUKawltr9qLRVDKuOqqS3EHdVw
	 7TJxY7tnXMxiHUfZCowDHir4iv9yCp1pFOUfL3Tp44A8lpxllMMAAvU0kqzPA98ZKMCbl
	 lXWrU/nlXwIsLaQKbhON/G4Fjdd5rt0WiHhpp0A+XYabOSBqcffNkCbIRNHhlyf205thA
	 lVok4E2EGVVuyuybJEdIPfE7MQEXJirFHpKmIJljFHS04i3YKQKDoH+KRjvRqAf/1gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O925RZWV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B284606A320;
	Thu, 19 Nov 2026 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O925RZWV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7951D1F000C4;
	Thu, 19 Nov 2026 09:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079454;
	bh=zsxpdu4aQ7yzHZ4VOT1oVEJDFztOr6C0cNni0HqSOyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O925RZWV9D9usakC/CftdI1sSQoGwHbfdu3lIoi29jWfklb99+cL0dZcF8Ya34Her
	 lky3Lpx9gv9CKkwgd20qLTiMUnDhsd0YI2tYVUVBE730mjfM10F0gB/ZScyvMTrXNP
	 Okh9Al5HclyCy9mGOG0JGWvOUFPQ85oUBeb641Azvl1lizO/lHYODNgdHHJMfSsX6b
	 P/tqYA08HgErKKXDzRBAm3Z4KX0zDpOpoCu/40K+GgIjphSaSGfv+QYQH+MHhTNWAM
	 d/ytBfnUA4NTTzstaIvW6vSU6q1QM/c2gjoZ9anfXSmJd+IiiRwcDE1bHObqKTZhrW
	 +hq3nX1u3Z+2A==
Date: Thu, 19 Nov 2026 09:10:51 +0000
From: Lee Jones <lee@kernel.org>
To: jiegu <jie.gu@leica-geosystems.com>
Cc: Matthias Fend <matthias.fend@emfend.at>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gujie <jie.gu@leica-geosystems.com.cn>
Subject: Re: [PATCH 2/2] leds: tps6131x: clear torch brightness cache on
 flash takeover
Message-ID: <20261119091051.GM98456@joneslee-macbookpro.roam.internal>
References: <20261117064328.4096518-1-jie.gu@leica-geosystems.com>
 <20261117064328.4096518-3-jie.gu@leica-geosystems.com>
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
In-Reply-To: <20261117064328.4096518-3-jie.gu@leica-geosystems.com>

On Tue, 17 Nov 2026, jiegu wrote:

> From: gujie <jie.gu@leica-geosystems.com.cn>
> 
> When the device switches from torch mode to flash or external strobe
> mode, the hardware torch output is disabled, but the LED class
> brightness cache may still keep the previous non-zero torch value.
> 
> This leaves sysfs brightness reporting an enabled torch state even
> though the light is already off.
> 
> Update the cached LED brightness to LED_OFF when flash control takes
> over so userspace state matches the actual hardware state.
> 
> Signed-off-by: gujie <jie.gu@leica-geosystems.com.cn>

Real name please.

> ---
>  drivers/leds/flash/leds-tps6131x.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
> index 823e0462939c..4f708cf56178 100644
> --- a/drivers/leds/flash/leds-tps6131x.c
> +++ b/drivers/leds/flash/leds-tps6131x.c
> @@ -294,6 +294,11 @@ static int tps6131x_set_mode(struct tps6131x *tps6131x, enum tps6131x_mode mode,
>  				       NULL, false, force);
>  }
>  
> +static void tps6131x_sync_torch_brightness_off(struct tps6131x *tps6131x)
> +{
> +	tps6131x->fled_cdev.led_cdev.brightness = LED_OFF;

Just put this at the call-site, then you can drop the `tps6131x->` part.

> +}
> +
>  static void tps6131x_torch_refresh_handler(struct work_struct *work)
>  {
>  	struct tps6131x *tps6131x = container_of(work, struct tps6131x, torch_refresh_work.work);
> @@ -398,6 +403,8 @@ static int tps6131x_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
>  	if (ret)
>  		return ret;
>  
> +	tps6131x_sync_torch_brightness_off(tps6131x);
> +
>  	return 0;
>  }
>  
> @@ -697,12 +704,19 @@ static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, boo
>  {
>  	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
>  	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> +	int ret;
>  
>  	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
>  	guard(mutex)(&tps6131x->lock);
>  
> -	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
> -				 false);
> +	ret = tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
> +				false);
> +	if (ret)
> +		return ret;
> +
> +	tps6131x_sync_torch_brightness_off(tps6131x);
> +
> +	return 0;
>  }
>  
>  static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops = {
> -- 
> 2.43.0
> 
> 

-- 
Lee Jones
