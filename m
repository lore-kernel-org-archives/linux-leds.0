Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0373D3FFFA9;
	Wed,  7 Oct 2026 07:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358629; cv=none; b=hkIAmnd3elbmpGH9rA6Mf/t7Wh1TVk9cKDUDOsoIm8kKL+/2TAPH6YzmTOjBZyB2ZOkMDBkLssrEo0VIR0y/EUy1DIL7nCeKRVLHYG9MtYkdM6pqUMT630C6uZFV6R8nfNVLJt5eTVER8PwB3oNZ3c7IibItWZB8s/eF2kfqujU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358629; c=relaxed/simple;
	bh=QCJ3uApyy62/gG7ICwjLCiG2yTBSuQGZTIjl4AV2ahs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hqDLogdzZGsQsnNlQ3Ld6ktdvCSKfjxURMv3LnUAqv41fEo9MgPA7zNml9GLUtrALf5IvA7X2VuCyYvJBC/kRc6+QKMBK/Ehg/BCozyNyRNChl54Myzcai8dx7CtugsZ1idSFzZLjJZkVXm93nExUQWRCKRVPgQuUcRF7SHE07E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=6FgwnO6V; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="6FgwnO6V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=AnfuN7MVcz66iWXUZSEQcYw5WdKZnD7eJ6R+4ZAlaiA=; t=1791358628; x=1792568228; 
	b=6FgwnO6VcByo8h86otOYYSz2OszqH+wb8G0iDFAf1Mxvak6dRnf8LE/En6LUscwmgCniVaTv8Cv
	UXpfNwc/dIm+4Hm1o8CMRMqnt63StXEcoweNSkMWx6PRbVyPOVddiDOrUHaZfReZtkP1c0m2A4a2o
	8ZZmVoPJhDYNdE6zEJsLpOIZeQYwxsiV2xfROSOzCT/+8FhxmM8SO5qfV9AX3kAHhb/Z1dbgPoZz7
	cj0l3ps5P8ypdo+Wgdr97jNLZ3tQlgD/cnAbVP8BndTiTpFJTQYUCndxRKrptYJ9jOrR2B/VHjb54
	CPZCMPhSuSL51kePuK67/+koPhDFzCbntQHA==;
Date: Wed, 7 Oct 2026 09:36:48 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, Alexey Min
 <alexeymin@minlexx.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 4/7] leds: aw2013: use dev_err_probe
Message-ID: <20261007093649.29a2dd6d@kemnade.info>
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-4-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
	<20261005-aw2013-aw20xx-rename-v2-4-108ecbdf2775@postmarketos.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 05 Oct 2026 20:46:05 -0700
Paul Sajna <sajattack@postmarketos.org> wrote:

> Failure to use dev_err_probe() for regulator requests violates
> LED subsystem guidelines.
> 
This cleanup is good.

But your comment sounds like there are documented guidelines and not just common
practice, so please add a link if it is not in an usual place which it is not:

~/linux/Documentation/leds$ grep -R probe *
leds-blinkm.rst:  $ modprobe ledtrig-heartbeat
well-known-leds.txt:wants to use particular feature, you should probe for good name, first,

~/linux/Documentation/leds$ grep -R http *
leds-lm3556.rst:* Datasheet: http://www.national.com/ds/LM/LM3556.pdf
leds-lp3944.rst:	http://www.national.com/pf/LP/LP3944.html
leds-lp5521.rst:* Datasheet: http://www.national.com/pf/LP/LP5521.html
leds-lp5523.rst:* Datasheet: http://www.national.com/pf/LP/LP5523.html
leds-lp5812.rst:* Datasheet: https://www.ti.com/product/LP5812#tech-docs

No links to additional documentation either.

If no such documentation exist, then do not talk about it. Just
say something like "to simplify und unify error reporting" as reason.

Regards,
Andreas

> The original driver didn't use it, but it's worth cleaning up
> while I'm here.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  drivers/leds/leds-aw2013.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index 340eefdda04f..705de95c6eac 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c
> @@ -448,9 +448,8 @@ static int aw20xx_probe(struct i2c_client *client)
>  
>  	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
>  	if (IS_ERR(chip->regmap)) {
> -		ret = PTR_ERR(chip->regmap);
> -		dev_err(&client->dev, "Failed to allocate register map: %d\n",
> -			ret);
> +		ret = dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
> +				    "Failed to allocate register map\n");
>  		goto error;
>  	}
>  
> @@ -460,30 +459,30 @@ static int aw20xx_probe(struct i2c_client *client)
>  				      ARRAY_SIZE(chip->regulators),
>  				      chip->regulators);
>  	if (ret < 0) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&client->dev,
> -				"Failed to request regulators: %d\n", ret);
> +		ret = dev_err_probe(&client->dev, ret,
> +				     "Failed to request regulators\n");
>  		goto error;
>  	}
>  
>  	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators),
>  				    chip->regulators);
>  	if (ret) {
> -		dev_err(&client->dev,
> -			"Failed to enable regulators: %d\n", ret);
> +		ret = dev_err_probe(&client->dev, ret,
> +				     "Failed to enable regulators\n");
>  		goto error;
>  	}
>  
>  	ret = regmap_read(chip->regmap, AW20XX_RSTR, &chipid);
>  	if (ret) {
> -		dev_err(&client->dev, "Failed to read chip ID: %d\n",
> -			ret);
> +		ret = dev_err_probe(&client->dev, ret,
> +				     "Failed to read chip ID\n");
>  		goto error_reg;
>  	}
>  	if (chipid != chip->cdef->chip_id) {
> -		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
> -			chipid);
>  		ret = -ENODEV;
> +		ret = dev_err_probe(&client->dev, ret,
> +				     "Chip reported wrong ID: %x\n",
> +				     chipid);
>  		goto error_reg;
>  	}
>  
> @@ -498,13 +497,12 @@ static int aw20xx_probe(struct i2c_client *client)
>  	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
>  				     chip->regulators);
>  	if (ret) {
> -		dev_err(&client->dev,
> -			"Failed to disable regulators: %d\n", ret);
> +		ret = dev_err_probe(&client->dev, ret,
> +				     "Failed to disable regulators\n");
>  		goto error;
>  	}
>  
>  	mutex_unlock(&chip->mutex);
> -
>  	return 0;
>  
>  error_reg:
> 

