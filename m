Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6136978F2E;
	Fri, 17 Apr 2026 12:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776428130; cv=none; b=KwMsMC1LTdDi5Hh37V5w50Tw+UAJ1/mH+mtprVemertIwNLH2/1oCxtp8TKXTjd74kgAcgQlmxfc67pVfwqIcrjZ+gghIr1a9OwdVYZKxqesji1gF6HKeIoDlOCbaZ1mdsnA1j133RA9SYrAyVy+/RFL1pogVLwHaz0eZxoMxyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776428130; c=relaxed/simple;
	bh=3/JcE1oEFCamdQomtHM6Su/mHXplatrZXsHT3756tyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7IsmIcMcWqNgyaYwoqRGCnsIpsOPxqb+Zoqi7zj6Kv1Slp2t4nf00IG7zotdRwTZZ7kqtjzjNnhwZBhr3WhFVWY1oN/AH+QwyzolT6eelC+l15LnquUHMvLGPXXQPrxO7NK7/i3YXMtUPoZFhzkZtjnEH5HzllgZUb7kTfH5EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwvOToKC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwvOToKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776428130; x=1807964130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3/JcE1oEFCamdQomtHM6Su/mHXplatrZXsHT3756tyg=;
  b=TwvOToKCCIcr2AjZSZl8iP9Argl3y4QdGV3LThGdJS3lgdBhuLknN7hF
   VRayjzELWnJPqFICHlZeHlx7jFfy1RYBM8k4+5CC7vCVcZOAUH+3IMkXB
   OY2piTGzKveXSrRfRY/WBDwtQ4rJmyIfQbcc/lGqnBq5nxqojJakieiVo
   YM+VpXi7vBtGVMp2ZfewJIRPtmbOc8un4uxZ1TiylhbshVFOLBgTJwOMv
   ziMnKTFYdY4W1+vppwS2Li+cd1Pxy8LNx3TFhPtKGRtZVwQnAAaO6Nnv6
   P6PUPdR6R7TZq806sAN98gBFvS/AzS4tRX+kQsdN+woCsOvMF0OMBd0wX
   Q==;
X-CSE-ConnectionGUID: H0mICCmkSwyOFSSz+imrDQ==
X-CSE-MsgGUID: mr7dDHBmTOiwGprWymR/YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77351011"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77351011"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:15:29 -0700
X-CSE-ConnectionGUID: MMce8I8hTyuPnqmz0T5PwQ==
X-CSE-MsgGUID: h5+8Y66sTQ6lkZ8AB6pkXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="227891671"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.170])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:15:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D81E4120E0E;
	Fri, 17 Apr 2026 15:15:45 +0300 (EEST)
Date: Fri, 17 Apr 2026 15:15:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 1/5] media: lm3560: Add HWEN pin support
Message-ID: <aeIkceWY7SrulUPf@kekkonen.localdomain>
References: <20260417114226.100033-1-clamor95@gmail.com>
 <20260417114226.100033-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417114226.100033-2-clamor95@gmail.com>

Hi Svyatoslav,

On Fri, Apr 17, 2026 at 02:42:22PM +0300, Svyatoslav Ryhel wrote:
> Add HWEN - logic high hardware enable input found in LM3560 to ensure its
> proper operation.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/media/i2c/lm3560.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> index f4cc844f4e3c..e6af61415821 100644
> --- a/drivers/media/i2c/lm3560.c
> +++ b/drivers/media/i2c/lm3560.c
> @@ -11,6 +11,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/module.h>
> +#include <linux/gpio.h>
>  #include <linux/i2c.h>
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
> @@ -45,6 +46,7 @@ enum led_enable {
>   * @dev: pointer to &struct device
>   * @pdata: platform data
>   * @regmap: reg. map for i2c
> + * @hwen_gpio: line connected to hwen pin
>   * @lock: muxtex for serial access.
>   * @led_mode: V4L2 LED mode
>   * @ctrls_led: V4L2 controls
> @@ -54,6 +56,7 @@ struct lm3560_flash {
>  	struct device *dev;
>  	struct lm3560_platform_data *pdata;
>  	struct regmap *regmap;
> +	struct gpio_desc *hwen_gpio;
>  	struct mutex lock;
>  
>  	enum v4l2_flash_led_mode led_mode;
> @@ -425,6 +428,12 @@ static int lm3560_probe(struct i2c_client *client)
>  	flash->dev = &client->dev;
>  	mutex_init(&flash->lock);
>  
> +	flash->hwen_gpio = devm_gpiod_get_optional(&client->dev, "enable",
> +						   GPIOD_OUT_HIGH);

Please add runtime PM support for this so it can be powered on when needed.

> +	if (IS_ERR(flash->hwen_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gpio),
> +				     "failed to get hwen gpio\n");
> +
>  	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
>  	if (rval < 0)
>  		return rval;
> @@ -452,6 +461,8 @@ static void lm3560_remove(struct i2c_client *client)
>  		v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
>  		media_entity_cleanup(&flash->subdev_led[i].entity);
>  	}
> +
> +	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
>  }
>  
>  static const struct i2c_device_id lm3560_id_table[] = {

-- 
Kind regards,

Sakari Ailus
