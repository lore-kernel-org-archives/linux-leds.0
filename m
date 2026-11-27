Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790278;
	b=ctKoyWDUnZWi59Kx3FDRut/5YeX4YC3ZHr3KNgHf1m2SXzjeQk0E7As8uWMum0BhgNVP
	 K1JTPrvrf/QQ0g7sFoCdOklXo8DaYPmoydQkpf4Wgsq9G4UU7aWo552ELCFpQ43fDKwwj
	 9Rr/P1D3WNN2FNnsmX1f6snW6fkXn/w5k57rZ3Lc3Ba11rO7DYideaZmNc4hTyHU3pl4g
	 qAgUVH1M/VY2lNrIOeZopXJnApJncdj18EZE2pn+FVwILYKJc0eAkKMaOgRJIzfuOorXV
	 SGt9NZmPEJVA6r+y1Mrk8MHrteAPhbkzPiNZqkrd8LCW6ov43y1R8NnZSszx+Qu5Mvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790278;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=J+Q+IQl7AcKa06Ttj3ntD1c4YWHxPDBduwfBT3xpo+U=;
	b=eA+jqTmuUHaxrcmRJHKAvsSIbZKxQKcHJes2GT/EsCYU+5uzHSHiYGBtieR6DPbx42b2
	 ZeP6TAnEGFqYiHSwZsb8c1YZw41tgOvEhdM73+IX+n6H/rMJEfwjO9zVAhtNkFunRxTsQ
	 AQfQMW5OmAMmElFJ1kkhPpH7CORyVrBGXz+vXtt1ZhApEAqG+GTSUcDA/PlLdf/Qbt96Y
	 uQkV7AZFsYeXfDkP0NdVJMefku/hsZV+NqONlxdp218auGWBWsi3tvfUyslI17Y/+kH1F
	 /RJ/RvurW3RQEs5jK0KbrYRPNMUQ2ldv+/Gfd16X5JUP7kSyCMc1nSK0TnJ8Vx99Siw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROoUYmfb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C23E606A6BE;
	Fri, 27 Nov 2026 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROoUYmfb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741AC1F00893;
	Fri, 27 Nov 2026 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795790277;
	bh=J+Q+IQl7AcKa06Ttj3ntD1c4YWHxPDBduwfBT3xpo+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ROoUYmfb6bUAMjtubiYwilLd5XBqZScIwDq0AnQpgBKfhd2sNWebUgLJzzzesTOjh
	 QrNtiiSdEXCoT1JeIEP1kGPnmxYl2UPNWSAdk8cbEJGuYIyK1PZJElICqu9zX8ESuN
	 zMZizIPM3J4YJ85mTbQsogJR0UaqB8yFPWUv9hlD7ySBac6h9pllehfELvpw+8R32C
	 l+niKRJVOFWevxOBmZohzeuB4kiYPkixqg4yOCP7hDTkCeRF4TafqmNs+dHbRZiKfl
	 HWKd0DU6zcUn3oAfIirxialVBRRzRnLBKJUcXLjf14DtsRQ099+enFXfUgkFE5s9m4
	 Suy+GZ1NhrB+Q==
Date: Fri, 27 Nov 2026 14:37:53 +0000
From: Lee Jones <lee@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, i@rong.moe
Subject: Re: [PATCH v3 11/11] leds: multicolor: Adjust maximum subled
 intensity during initialization
Message-ID: <179568582896.32537.166831565181132392@kernel.org>
References: <20261120212431.152081-1-W_Armin@gmx.de>
 <20261120212431.152081-12-W_Armin@gmx.de>
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
In-Reply-To: <20261120212431.152081-12-W_Armin@gmx.de>
X-AI-Review-Draft: <20261120212431.152081-12-W_Armin@gmx.de>

--- checkpatch.pl (1 issue) ---
Line 77: ERROR: that open brace { should be on the previous line
----------------------------------

On Fri, 20 Nov 2026, Armin Wolf wrote:

> The maximum brightness of a LED device is fixed after having called
> led_classdev_init(), so performing the adjustment during runtime is
> no longer necessary.
>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/leds/led-class-multicolor.c | 40 ++++++++++++-----------------
>  1 file changed, 16 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
> index 0656ca2361b3..09c52bc1a55a 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -14,24 +14,6 @@
>  #include <linux/uaccess.h>
>  #include "leds.h"
>
> -static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcled_cdev, size_t index)
> -{
> -	unsigned int max_intensity;
> -
> -	/*
> -	 * The maximum global brightness value might still be changed by
> -	 * led_classdev_register_ext() using devicetree properties. This
> -	 * prevents us from changing subled_info[X].max_intensity when
> -	 * registering a multicolor LED class device, so we have to do
> -	 * this during runtime.
> -	 */
> -	max_intensity = mcled_cdev->subled_info[index].max_intensity;
> -	if (max_intensity)
> -		return max_intensity;
> -
> -	return mcled_cdev->led_cdev.max_brightness;
> -}
> -
>  int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>  				 enum led_brightness brightness)
>  {
> @@ -53,12 +35,10 @@ static ssize_t multi_max_intensity_show(struct device *dev,
>  {
>  	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>  	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
> -	unsigned int max_intensity;
>  	int len = 0;
>
> -	for (int i = 0; i < mcled_cdev->num_colors; i++) {
> -		max_intensity = led_mc_get_max_intensity(mcled_cdev, i);
> -		len += sysfs_emit_at(buf, len, "%u", max_intensity);
> +	for (unsigned int i = 0; i < mcled_cdev->num_colors; i++) {

How many colours are you expecting?

It's usual (although not unheard of) to use unsigned for this.

> +		len += sysfs_emit_at(buf, len, "%u", mcled_cdev->subled_info[i].max_intensity);
>  		if (i < mcled_cdev->num_colors - 1)
>  			len += sprintf(buf + len, " ");
>  	}
> @@ -98,8 +78,8 @@ static ssize_t multi_intensity_store(struct device *dev,
>  		goto err_out;
>  	}
>
> -	for (int i = 0; i < mcled_cdev->num_colors; i++) {
> -		max_intensity = led_mc_get_max_intensity(mcled_cdev, i);
> +	for (unsigned int i = 0; i < mcled_cdev->num_colors; i++) {
> +		max_intensity = mcled_cdev->subled_info[i].max_intensity;
>  		mcled_cdev->subled_info[i].intensity = min(intensity_value[i], max_intensity);
>  	}
>
> @@ -187,6 +167,18 @@ int led_classdev_multicolor_register_ext(struct device *parent,
>  	if (ret < 0)
>  		return ret;
>
> +	/*
> +	 * The maximum global brightness value might have been changed by
> +	 * led_classdev_init() using devicetree properties. Because of this
> +	 * we can only adjust subled_info[X].max_intensity after said function
> +	 * was called.
> +	 */
> +	for (unsigned int i = 0; i < mcled_cdev->num_colors; i++)
> +	{

Nit: Misplaced '{'.

> +		if (!mcled_cdev->subled_info[i].max_intensity)
> +			mcled_cdev->subled_info[i].max_intensity = led_cdev->max_brightness;
> +	}
> +
>  	led_cdev->dev->type = &led_multicolor_device_type;
>
>  	return led_classdev_add(led_cdev, init_data);
> -- 
> 2.56.1
>
>

-- 
Lee Jones
