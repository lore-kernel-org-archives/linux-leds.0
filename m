Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9214E560AD8;
	Thu, 17 Sep 2026 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655602; cv=none; b=SkyGr1Lc15d+ne7llnGqrFfg8G9WutII2fYYJfbusddSc9aJ90lfGVlKkyk5LzCNsBXrpWrHITlRSQmNoxFp58Db2duzxpjaI6tYGOw7iv6qcgKNlDVnb/apuMoXXVV+6JE3cRrS2E34uAFosHUBFSmWx8q/WWXvExi/sRU8mKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655602; c=relaxed/simple;
	bh=5BFAUSbEC7ZqbPP+Xzk9lFiGhkxIv2UN6woEzekMIFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQmzThq+7qPrU7ETl/a1fV4LmirsMtDGqIDMNtPF/H6H9vFmZ89JZCmCbtio+g8Ot0+yVCkA4xJeEcR2nzTsJkl5FOfTmp/XdnA3lR4k3jX0h6JDYhYDQ6y2C9kunOjgi2VCIyLl45Z1Em2/UpmgdjOoW8bypnBMbVMfdvd+NGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaomMELo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaomMELo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3316A1F00893;
	Thu, 17 Sep 2026 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789655601;
	bh=STP9v5KOajoZJXPO9JYtwCREu7QupIFOB+O6jedYzzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KaomMELo9HnBPfx379ckKTBRz8xrgxZj9csIJyS2KJHIMGfO4piQEYFrzLVylAMPb
	 MHCaJ+Kxw9Dz3kv+opO5st5h6HFdAOYvLdhDOhe3pEl2FzMBqAgApW8nNorexRadyV
	 z0jZPdtVA00j6X7WjMqm5ujRvOjIMZ5moe4ZS+X4FTd2qYNJFGv04d+7uPWCn0Rn3N
	 2lz1FqVnIrEHDlavAncuYAJ8MT6iQgCr9gOMuW6fcsohjLNuo/j6Zf37p9dif7k0cF
	 Jo6hiEtF/T0fyzhwBHoV0cCtus1cI1unkmfY83VqLT1oGTjW2hnPQ4plQ8UCbVBRKI
	 MViYMo0Q7/AaQ==
Date: Thu, 17 Sep 2026 15:33:17 +0100
From: Lee Jones <lee@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: rgb: qcom-lpg: Use fwnode APIs for LED parsing
Message-ID: <20260917143317.GL1605367@google.com>
References: <20260908053221.29955-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908053221.29955-1-rosenp@gmail.com>

On Mon, 07 Sep 2026, Rosen Penev wrote:

> Convert LED and channel parsing in lpg_add_led() and
> lpg_parse_channel() from DT-specific helpers to the fwnode API.
> The probe loop now uses device_for_each_child_node_scoped(),
> dropping explicit node lifetime handling.
> 
> Behaviour is unchanged for device tree: fwnode_get_child_node_count()
> and both child iteration helpers skip unavailable children on OF,
> and the fwnode handle is passed straight to LED registration.
> 
> cdev->default_trigger is only assigned when
> fwnode_property_read_string() succeeds, so an absent
> linux,default-trigger property no longer yields an uninitialized
> pointer.
> 
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 36 ++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index d7d6518de30f..dcc8e6f14c8b 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -11,6 +11,7 @@
>  #include <linux/nvmem-consumer.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/pwm.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> @@ -1342,7 +1343,7 @@ static int lpg_add_pwm(struct lpg *lpg)
>  	return ret;
>  }
>  
> -static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
> +static int lpg_parse_channel(struct lpg *lpg, struct fwnode_handle *fw,
>  			     struct lpg_channel **channel)
>  {
>  	struct lpg_channel *chan;
> @@ -1350,17 +1351,18 @@ static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
>  	u32 reg;
>  	int ret;
>  
> -	ret = of_property_read_u32(np, "reg", &reg);
> +	ret = fwnode_property_read_u32(fw, "reg", &reg);
>  	if (ret || !reg || reg > lpg->num_channels)
> -		return dev_err_probe(lpg->dev, -EINVAL, "invalid \"reg\" of %pOFn\n", np);
> +		return dev_err_probe(lpg->dev, -EINVAL,
> +				     "invalid \"reg\" of %s\n", fwnode_get_name(fw));
>  
>  	chan = &lpg->channels[reg - 1];
>  	chan->in_use = true;
>  
> -	ret = of_property_read_u32(np, "color", &color);
> +	ret = fwnode_property_read_u32(fw, "color", &color);
>  	if (ret < 0 && ret != -EINVAL)
>  		return dev_err_probe(lpg->dev, ret,
> -				     "failed to parse \"color\" of %pOF\n", np);
> +				     "failed to parse \"color\" of %s\n", fwnode_get_name(fw));
>  
>  	chan->color = color;
>  
> @@ -1369,25 +1371,26 @@ static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
>  	return 0;
>  }
>  
> -static int lpg_add_led(struct lpg *lpg, struct device_node *np)
> +static int lpg_add_led(struct lpg *lpg, struct fwnode_handle *fw)
>  {
>  	struct led_init_data init_data = {};
>  	struct led_classdev *cdev;
>  	struct mc_subled *info;
>  	struct lpg_led *led;
> +	const char *trigger;
>  	const char *state;
>  	int num_channels;
>  	u32 color = 0;
>  	int ret;
>  	int i;
>  
> -	ret = of_property_read_u32(np, "color", &color);
> +	ret = fwnode_property_read_u32(fw, "color", &color);
>  	if (ret < 0 && ret != -EINVAL)
>  		return dev_err_probe(lpg->dev, ret,
> -			      "failed to parse \"color\" of %pOF\n", np);
> +			      "failed to parse \"color\" of %s\n", fwnode_get_name(fw));
>  
>  	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
> -		num_channels = of_get_available_child_count(np);
> +		num_channels = fwnode_get_child_node_count(fw);

Are you sure 'fwnode_get_child_node_count()' skips unavailable children?  It
counts all children, whereas 'of_get_available_child_count()' only counted
available ones.  If there are disabled child nodes, 'led->mcdev.num_colors' will
be larger than the number of populated subleds, leading to uninitialised memory
access in the LED core.  Should we be using 'i' for 'num_colors' instead, or
counting available nodes properly?

>  	else
>  		num_channels = 1;
>  
> @@ -1403,7 +1406,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
>  		if (!info)
>  			return -ENOMEM;
>  		i = 0;
> -		for_each_available_child_of_node_scoped(np, child) {
> +		fwnode_for_each_available_child_node_scoped(fw, child) {
>  			ret = lpg_parse_channel(lpg, child, &led->channels[i]);
>  			if (ret < 0)
>  				return ret;
> @@ -1426,7 +1429,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
>  			cdev->pattern_clear = lpg_pattern_mc_clear;
>  		}
>  	} else {
> -		ret = lpg_parse_channel(lpg, np, &led->channels[0]);
> +		ret = lpg_parse_channel(lpg, fw, &led->channels[0]);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -1441,14 +1444,15 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
>  		}
>  	}
>  
> -	cdev->default_trigger = of_get_property(np, "linux,default-trigger", NULL);
> +	if (!fwnode_property_read_string(fw, "linux,default-trigger", &trigger))
> +		cdev->default_trigger = trigger;
>  
>  	if (lpg->lpg_chan_sdam)
>  		cdev->max_brightness = PPG_MAX_LED_BRIGHTNESS;
>  	else
>  		cdev->max_brightness = LPG_RESOLUTION_9BIT - 1;
>  
> -	if (!of_property_read_string(np, "default-state", &state) &&
> +	if (!fwnode_property_read_string(fw, "default-state", &state) &&
>  	    !strcmp(state, "on"))
>  		cdev->brightness = cdev->max_brightness;
>  	else
> @@ -1456,7 +1460,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
>  
>  	cdev->brightness_set_blocking(cdev, cdev->brightness);
>  
> -	init_data.fwnode = of_fwnode_handle(np);
> +	init_data.fwnode = fw;
>  
>  	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
>  		ret = devm_led_classdev_multicolor_register_ext(lpg->dev, &led->mcdev, &init_data);
> @@ -1638,8 +1642,8 @@ static int lpg_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	for_each_available_child_of_node_scoped(pdev->dev.of_node, np) {
> -		ret = lpg_add_led(lpg, np);
> +	device_for_each_child_node_scoped(&pdev->dev, child) {
> +		ret = lpg_add_led(lpg, child);
>  		if (ret)
>  			return ret;
>  	}
> -- 
> 2.55.0
> 

-- 
Lee Jones
