Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28C33AEF2E;
	Mon,  3 Aug 2026 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747221; cv=none; b=WcI3LL/qk+RVN6heqDai/r4WKEw81Ee0tXrKzJTxy8gQa4Tv0F//4h8YClvRuB0oX3qIHyEsvaGwVtAAJqAsR3jtUUaPesL14+wNdA3sCxePmutt2aZVdIIE7PTtqpib7ODk2yh/UhQrEfU08mFMha2ca4OhGtrKH/Z3binHNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747221; c=relaxed/simple;
	bh=EZkgldRiLAxsyAK9q/3SZO2CSCHVDixY74ILAU/BQLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUPxZsyTySH80a+tYw+yxfzXixH1BPuNH5MQvwngJbSk7PhQBMVrnaSUzRk/SJihYyH6sXK22v9bqmF79Yk+wojneyY2HAwOmKqO4CYM83KGIjd+VNDIExgAGR94+NkOILZ7FqRlZtqRjwaVFi7SlDOGIQnx+0o7Sn0RcW9YlzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6A6232008BB;
	Mon, 03 Aug 2026 10:53:35 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <jre@pengutronix.de>)
	id 1wqoQR-002fOJ-12;
	Mon, 03 Aug 2026 10:53:35 +0200
Message-ID: <955ff88f-8fe2-4e58-8d2d-9d871d0aacdb@pengutronix.de>
Date: Mon, 3 Aug 2026 10:53:34 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] leds: rgb: leds-group-multicolor: Implement
 default-intensity
To: Stefan Wahren <wahrenst@gmx.net>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260802115727.50411-1-wahrenst@gmx.net>
 <20260802115727.50411-3-wahrenst@gmx.net>
Content-Language: en-US
From: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <20260802115727.50411-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-02 13:57, Stefan Wahren wrote:
> Currently it's not possible to specify the initial color of a LED
> multicolor group during boot. So implement the default-intensity property
> similar to the leds-pwm-multicolor driver. In case the property is
> missing, the old behavior is kept.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Jonas Rebmann <jre@pengutronix.de>

> ---
>   drivers/leds/rgb/leds-group-multicolor.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> index 548c7dd63ba1..69b203ec89fa 100644
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -109,8 +109,14 @@ static int leds_gmc_probe(struct platform_device *pdev)
>   
>   		subled[i].color_index = led_cdev->color;
>   
> -		/* Configure the LED intensity to its maximum */
> -		subled[i].intensity = max_brightness;
> +		ret = fwnode_property_read_u32(led_cdev->dev->fwnode, "default-intensity",
> +					       &subled[i].intensity);
> +
> +		/* In case default-intensity is missing, fallback to maximum */
> +		if (ret)
> +			subled[i].intensity = max_brightness;
> +		else if (subled[i].intensity > max_brightness)
> +			subled[i].intensity = max_brightness;
>   	}
>   
>   	/* Initialise the multicolor's LED class device */

-- 
Pengutronix e.K.                           | Jonas Rebmann               |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

