Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43DA3EB118;
	Tue, 29 Sep 2026 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673665; cv=none; b=GPCX9LSs/T6jeRHMQ3vEc+39GGig/05aa2tvspqTxEoLtqolKZKtmvd6B8NjNE5NVheoifk9fm/De7I019sgJvla/IAk/m578L2lPbGps0LUz3R/WHFYvcYZjYZyiKMwmdFVXIAt65x1Hu2MleTkUih6IWgwUYN6AdyTs2Q9eC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673665; c=relaxed/simple;
	bh=dHaOcnl3aXWc2Hmn3y4eVOxSIsKD8Rhg94cPXiaqY3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBgw0XdW3fiw6RKjvHijrH9F5zDsIvQ3zelW6TM6lEGMM38h0/OMgAUcJLx9zGsK/Ab3UcC7ocA9UffX2PX8+hZXUBlvf+/3ib1gItEOTa+4m9q5/VhhBklS+mS0m7ewegKcDzPp+mQxgnEo93Yle/YR/LqW1vO1wV7qy9MMJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAl1ONLy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAl1ONLy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824421F000FF;
	Tue, 29 Sep 2026 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790673649;
	bh=lLjkhLoMP1e/qq53Vk9mHOqcFym2TAV6bpEmyAeFQPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hAl1ONLyFwjkmLA33u2zICviyzoJvJpJshiMl6oL3yrCQj6c9AIZlZEzWKfkWypRm
	 jzf2/ahruhBC9qM2px3vNPKVDolZ3h+Kg/x9uagHmsBAKzfwQQxY8xjnAfVc9NMQ64
	 qQVHtHPwCAVZj6+acdc/681QWHCPumobgbGEsbVoyqgYpGZwaBx+s1ceEfRUZiqOez
	 t9wl6pp4wHGOe+g+zRlKJH8yjyqSPqracfkGT4xkXG96u0/6ufrvO6v52nWD4LACnB
	 03bdaF9RtPsEhgPoyJrIhv7V90oMF4uj/ZsKrz1qzobEX6RgTYQqkelBkAzqY8YxUx
	 LIqm8uQzve2KQ==
Date: Tue, 29 Sep 2026 10:20:44 +0100
From: Lee Jones <lee@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Pieterjan Camerlynck <pieterjanca@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux@ew.tq-group.com, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/10] leds: pca995x: Fix fwnode handle leaks in error
 paths
Message-ID: <179025017981.457255.5791421193775684526@kernel.org>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <3d38609c96d387aec7eaff7cdb19fc2d8eb32a3e.1790087890.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d38609c96d387aec7eaff7cdb19fc2d8eb32a3e.1790087890.git.nora.schiffer@ew.tq-group.com>
X-AI-Review-Draft: <3d38609c96d387aec7eaff7cdb19fc2d8eb32a3e.1790087890.git.nora.schiffer@ew.tq-group.com>

--- checkpatch.pl: clean (0 issues) ---

On Tue, 22 Sep 2026, Nora Schiffer wrote:

> Each entry in led_fwnodes needs to be put as long as no LED device has
> been created for it yet - not just in the creation loop, but also in the
> first loop that iterates over the child nodes.
>
> By clearing entries in led_fwnodes once they have been used, the same
> cleanup loop can be used to handle errors in both loops.
>
> Fixes: 82c5ada1f9d0 ("leds: pca995x: Fix device child node usage in pca995x_probe()")
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  drivers/leds/leds-pca995x.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index 8b05b3f12cf38..079ce3d8f1e49 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
> @@ -123,7 +123,7 @@ static int pca995x_probe(struct i2c_client *client)
>  	const struct pca995x_chipdef *chipdef;
>  	struct pca995x_chip *chip;
>  	struct pca995x_led *led;
> -	int i, j, reg, ret;
> +	int i, reg, ret;
>
>  	chipdef = device_get_match_data(&client->dev);
>
> @@ -144,10 +144,12 @@ static int pca995x_probe(struct i2c_client *client)
>  	device_for_each_child_node_scoped(dev, child) {
>  		ret = fwnode_property_read_u32(child, "reg", &reg);
>  		if (ret)
> -			return ret;
> +			goto err_put_nodes;
>
> -		if (reg < 0 || reg >= chipdef->num_leds || led_fwnodes[reg])
> -			return -EINVAL;
> +		if (reg < 0 || reg >= chipdef->num_leds || led_fwnodes[reg]) {
> +			ret = -EINVAL;
> +			goto err_put_nodes;
> +		}
>
>  		led = &chip->leds[reg];
>  		led_fwnodes[reg] = fwnode_handle_get(child);
> @@ -169,12 +171,12 @@ static int pca995x_probe(struct i2c_client *client)
>  						     &chip->leds[i].ldev,
>  						     &init_data);
>  		if (ret < 0) {
> -			for (j = i; j < chipdef->num_leds; j++)
> -				fwnode_handle_put(led_fwnodes[j]);
> -			return dev_err_probe(dev, ret,
> -					     "Could not register LED %s\n",
> -					     chip->leds[i].ldev.name);
> +			dev_err_probe(dev, ret, "Could not register LED %s\n",
> +				      chip->leds[i].ldev.name);
> +			goto err_put_nodes;
>  		}
> +
> +		led_fwnodes[i] = NULL;

Shouldn't we put this before removing it?

>  	}
>
>  	/* Disable LED all-call address and set normal mode */
> @@ -184,6 +186,12 @@ static int pca995x_probe(struct i2c_client *client)
>
>  	/* IREF Output current value for all LEDn outputs */
>  	return regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_HALF_CFG);
> +
> +err_put_nodes:
> +	for (i = 0; i < chipdef->num_leds; i++)
> +		fwnode_handle_put(led_fwnodes[i]);
> +
> +	return ret;
>  }
>
>  static const struct i2c_device_id pca995x_id[] = {
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
>
>

-- 
Lee Jones
