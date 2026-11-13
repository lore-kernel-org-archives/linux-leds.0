Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568908;
	b=FfQr5k2+v1AysQfMCKmUM5FwrWxbHVbqDkr/SuOs0ttLxlj74j/9Xb0AIIcXs0ca1J+7
	 WTOMtVFQ5s+9KVtYPz8BnpGdYTihlFNXP7uZWLC0pzXxbmvtrcVS9CAo7txG4NBEyXbvD
	 o/vAWG9wjjQicX7SpXLtoBDymXRzqyBkwrJtxiZXbFmP3F4q6DqaJ7TcHgDccpuohRbE+
	 Bi33oNkxtof1pz+gw6aoXBKHFx9ApV6LrpkGeGUvM6YTqPrV74kulRxAhC2OGMmOSFWsf
	 TTqRJ1azYzdKbVxa5mqoCIlKZpBWVeWcsa3+Sma5nMuIQoweM+nQ73SnfNq7atJGCKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568908;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=sb9zH2XllumvbBdXYvlu0j+x5CI4hn0eDMkdHE3AL+k=;
	b=FqwYytHGq8YfH6zm387Iw01BWzV5W0Xer5Hd1s2F4CZgI9I1K2R6GPA6D/Y3YpKZbBsP
	 1XEdyaS8MzuXqHkY+KsgVC2wfD4ruWXONQ5D+zBUUOONNXzk5MmJQJRkQr1w1hp5XX33o
	 643c4R2zbOLRlPbT0iY+Jj4urKs5GHR8ni8wlgehej7eHQQ8oDsEpIeR7CI38W8Xv7ouc
	 sqKrvvVL6htGkOx+7PAIrjKtS1MwdWkZ386ELWRIGPtTIShFR85ULI9DODDrlP1LWTH3b
	 d548m2A2y6uzmNLc+omKfXqLwBVplUqJOqgxqkz3g2foxou5rPuKvXjPwehZ9963dZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=feQcJ7Ga;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EB6606A321;
	Fri, 13 Nov 2026 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=feQcJ7Ga
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80561F000C4;
	Fri, 13 Nov 2026 11:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568908;
	bh=sb9zH2XllumvbBdXYvlu0j+x5CI4hn0eDMkdHE3AL+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=feQcJ7GaFPCzSfkdWvXHNc7ThTrxF/ABgAhZZKpXFCK+bZsi0q6clhKn8oZFA2BxM
	 vSbOxmJOpwMmq0Xqmmz/XEp5HZT7Nm1fPotX3DoSMTnsLpN3ySkIW4FOhTPauiMZUZ
	 mLk7LtACkGVvkuatZyohVTNWc37QV8d1UJzEIbcNxAGGbDGO04UKSHc9NDCQljU01t
	 Tq+FzEyXSOIvnrTPnHI7ijHonYmITw8xzDn7OzMPet42KuVJJl0/7YvGi+TJdHHsf4
	 wxC5h8MFg9i4Ow/HSTLrGVn35GIH3WFvzvyO2wqh+qkCAQrAKyuJhjKEHsuiqTEf1c
	 rrg3/+FAI7j9A==
Date: Fri, 13 Nov 2026 11:21:44 +0000
From: Lee Jones <lee@kernel.org>
To: phucduc.bui@gmail.com
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 1/2] leds: lm3532: Propagate enable GPIO errors
Message-ID: <179310027340.2808517.7320226573540907171@kernel.org>
References: <20261021045832.16356-1-phucduc.bui@gmail.com>
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
In-Reply-To: <20261021045832.16356-1-phucduc.bui@gmail.com>
X-AI-Review-Draft: <20261021045832.16356-1-phucduc.bui@gmail.com>

On Wed, 21 Oct 2026, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> devm_gpiod_get_optional() returns NULL when the optional GPIO is not
> present, but may return -EPROBE_DEFER or other errors.
>
> lm3532_parse_node() currently treats GPIO lookup errors as if the GPIO
> were not present.
>
> Check the return value and propagate errors from the enable GPIO lookup.
>
> Fixes: bc1b8492c764 ("leds: lm3532: Introduce the lm3532 LED driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>
> Link v1 : 
> https://lore.kernel.org/all/20261007104915.507801-1-phucduc.bui@gmail.com/
> Link v2 : 
> https://lore.kernel.org/all/20261009091059.25729-1-phucduc.bui@gmail.com/
>
> Changes in v2:
>  - Capitalize the first letter of the commit message subject 
>
>  drivers/leds/leds-lm3532.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index b51496910b08..a3bc9680dc4c 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -560,7 +560,8 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>  	priv->enable_gpio = devm_gpiod_get_optional(&priv->client->dev,
>  						   "enable", GPIOD_OUT_LOW);
>  	if (IS_ERR(priv->enable_gpio))
> -		priv->enable_gpio = NULL;
> +		return dev_err_probe(&priv->client->dev, PTR_ERR(priv->enable_gpio),
> +				     "failed to get enable GPIO\n")

Please capitalise the first letter of the error message.

>  	if (priv->enable_gpio) {
>  		ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
> -- 
> 2.43.0
>
>

-- 
Lee Jones
