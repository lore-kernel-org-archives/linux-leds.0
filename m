Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0978C5632A0;
	Tue, 22 Sep 2026 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093560; cv=none; b=TdxX/i0W/ity/KOjbbe9JA8xIdHrhLYgpMN/t1Uw/Gy6bgkwJ3OrZGD0btYloonmTADGPBDAMklIzuIDxThRviv1/kkCzRNynN6LWnAgRvpBJnySqQZz3sWuk7OwMbkU6hKM6b7IU9Pyxi15RN8ONu66HuvbOE+go/hn03c2apY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093560; c=relaxed/simple;
	bh=XqPiasCcF6EaZlcN2xCC7wrmpkM2iTrXUhbF1mjWb/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmTs6LMc+Oszg17X4Hgb4tH3h26knenObue38QpL3J2NmwlSAXjjHoZWgOr798UxMuUu/yfTlVZtcs7B5qmMrqF2VfcBlCT1aav/kK7wo5Rur5W5JycgJcgz7uDnmwZWtsgm2Wf4JcJ7VteU31jY2N6n2/46wLcGaltrvMdUy/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEIICUSc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEIICUSc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15D81F000FF;
	Tue, 22 Sep 2026 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790093558;
	bh=5C+vW0E2+T44ApPmj0CLki4v1TiOioi3oKrSSNkGLoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TEIICUScF42H+nmCg2F5Rehgypa0natd3pJw3x3IMyBgJ9CP/arynHNvJPiqEFcOE
	 IG3M30dK7D6b/aJnhZEXQ73pf/WxgIqURx1+ckMOc+H5mH0rqonC7eLBfSQiA8sVb/
	 VN+53f4JOxWrK67ommeJdD8TxlaZSZBfF0daXbiCyZbYjKbd7LQleaP59q0neokGq2
	 +7VIRkPmeDRsTC05oK0fg12C/deQL2LNn1GEbsnEMjIxzVcC7+OREqG4Tg4G11VHsR
	 LD0eEutgARnX81aXA+tz8U1xBYUaQ3ISWtnDyvOuYcbBpdHs+2ezYcO/4Y3FOtKGoE
	 w6cja7rHAHt1A==
Date: Tue, 22 Sep 2026 17:12:34 +0100
From: Lee Jones <lee@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>, linux@ew.tq-group.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] leds: pca995x: Make output gain configurable
Message-ID: <20260922161234.GC3438784@google.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
 <6b65d783052e84fd00c139a3b3f85b04f680b798.1789477502.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b65d783052e84fd00c139a3b3f85b04f680b798.1789477502.git.nora.schiffer@ew.tq-group.com>

On Tue, 15 Sep 2026, Nora Schiffer wrote:

> The output gain linearly configures the LED current in 255 levels; the
> absolute current depends on both the gain value and the R_ext resistor
> connected to the LED driver. Make the gain configurable in the Device
> Tree instead of hardcoding it to 128, allowing to adjust the current
> for different hardware designs.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
> 
> v2: Add nxp, vendor prefix
> 
>  drivers/leds/leds-pca995x.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index 0c0ea57f3225a..9cd5702573b0d 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
> @@ -127,6 +127,7 @@ static int pca995x_probe(struct i2c_client *client)
>  	struct pca995x_chip *chip;
>  	struct pca995x_led *led;
>  	int i, j, reg, ret;
> +	u32 iref;
>  
>  	chipdef = device_get_match_data(&client->dev);
>  
> @@ -154,6 +155,11 @@ static int pca995x_probe(struct i2c_client *client)
>  
>  	i2c_set_clientdata(client, chip);
>  
> +	if (device_property_read_u32(dev, "nxp,output-gain", &iref))
> +		iref = PCA995X_IREFALL_HALF_CFG;
> +	else if (iref > PCA995X_IREFALL_FULL_CFG)
> +		return dev_err_probe(dev, -EINVAL, "invalid nxp,output-gain\n");

As clever as is this, it's not that easy to follow.

I'd prefer:

	u32 iref = PCA995X_IREFALL_HALF_CFG;

	ret = device_property_read_u32(...);
	if (!ret) {
		if (val > PCA995X_IREFALL_FULL_CFG)
			 return dev_err_probe(dev, -EINVAL, "output-gain is out of range\n");
		iref = val;
	}

>  	device_for_each_child_node_scoped(dev, child) {
>  		ret = fwnode_property_read_u32(child, "reg", &reg);
>  		if (ret)
> @@ -196,7 +202,7 @@ static int pca995x_probe(struct i2c_client *client)
>  		return ret;
>  
>  	/* IREF Output current value for all LEDn outputs */
> -	return regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_HALF_CFG);
> +	return regmap_write(chip->regmap, chipdef->irefall, iref);
>  }
>  
>  static const struct i2c_device_id pca995x_id[] = {
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/

-- 
Lee Jones
