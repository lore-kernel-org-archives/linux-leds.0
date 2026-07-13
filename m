Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA335AC3C;
	Mon, 13 Jul 2026 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974489; cv=none; b=CKyPZA2q68OTfuryhlZ62T8PBgV6XTJ1jV9sDkNh/m4x4I/dXzK82fxNWH6pNxQx79bfsvcU0EPjL2LPm7S6Q1x2A2L/9TLQ9r26ObXE5QBH8dS8yhBASSXFTy/k3SkTQJnY5sz+4l1cIIxfQuT2qE0wei75M6j+Elvi+U7ydTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974489; c=relaxed/simple;
	bh=9xwhYK1EA+FByOAoCBeFlwtBhu3kQBrSJkq/GtYPlpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ru84ixLI8InfOovupcoFbWz2InG4pBfAsI+2sr01lqrvndVIM7IYURQr7R6RrKgGsHSPvo4qt7WgHQQZmtn8akJG/+CNgh+ItCErsD5ZtbEjvIc1oAWQGq0BUq+2eUua/FoPrA5M9Uc/d2/i6tNaHZ/KPv34L2myVri0WSNHVIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Q/o/CDgT; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Q/o/CDgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783974485;
	bh=9xwhYK1EA+FByOAoCBeFlwtBhu3kQBrSJkq/GtYPlpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/o/CDgTz9FNP08MkVNa/8/f9XkR18f20LCBKuPutaydBr0I7HJaJwFO5eduvaqxB
	 wJsIcJj1Rug8nsAStK6EkNCgBn6c98jjZ4cRX9FE1QLEsOqocuZSWK0fz2TMmrGIrS
	 K7x3hba7oB+aAVorpPAkZc3NuVkZQewS0dEknTng=
Date: Mon, 13 Jul 2026 22:28:04 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Rong Zhang <i@rong.moe>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/9] leds: cros_ec: Implement offloaded() callback
 for trigger
Message-ID: <f028ec00-3a7e-4a12-bfed-dabef2f44be0@t-8ch.de>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
 <20260618-leds-trigger-hw-changed-v2-2-c28c44053cf3@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-2-c28c44053cf3@rong.moe>

On 2026-06-18 00:47:56+0800, Rong Zhang wrote:
> "chromeos-auto" is a private hardware control trigger which always stays
> in hardware control. Implement offloaded() callback with its return
> value to be always true to reflect this.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
>  drivers/leds/leds-cros_ec.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> index bea3cc3fbfd2..f48e3cf6ccf6 100644
> --- a/drivers/leds/leds-cros_ec.c
> +++ b/drivers/leds/leds-cros_ec.c
> @@ -86,12 +86,18 @@ static int cros_ec_led_trigger_activate(struct led_classdev *led_cdev)
>  	return cros_ec_led_send_cmd(priv->cros_ec, &arg);
>  }
>  
> +static bool cros_ec_led_trigger_offloaded(struct led_classdev *led_cdev)
> +{
> +	return true;
> +}
> +
>  static struct led_hw_trigger_type cros_ec_led_trigger_type;
>  
>  static struct led_trigger cros_ec_led_trigger = {
>  	.name = "chromeos-auto",
>  	.trigger_type = &cros_ec_led_trigger_type,
>  	.activate = cros_ec_led_trigger_activate,
> +	.offloaded = cros_ec_led_trigger_offloaded,
>  };
>  
>  static int cros_ec_led_brightness_set_blocking(struct led_classdev *led_cdev,
> 
> -- 
> 2.53.0
> 
