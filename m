Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB752BB17;
	Tue, 21 Apr 2026 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776789874; cv=none; b=i4Tz8s6yvglwAhkkOm1VUMb3/JjwzSzryJ6GRThBIIXIDq6oAsPftDNZtF6q+FRChZNZ5pFE7PUTxlmJN5HTiHYpmAB29daKDxaLYGG5BKjC///1RcRtUW/FkogdzuhJ3EBTQPANup2bBQpdxbpQy0yzAWm180liPWTQmP9rg+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776789874; c=relaxed/simple;
	bh=ZMlm3vke/xn/Mo/8udyirPFnry1e8XrjEu/pi9aURw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzoSK3PYFWyr3hEImIr4Cz7WUWbGhT12xQLNNQh0UVC4nAnpoZ9INYgcK7L15oma1CbwZnje3iSiTfBHyt8gLXFfIaRdkiHS9svRGfkFszuzYmVKeplIuBm7bdaYRZe/oZql288q+TYhkQytw7JQbgHjufU8DuPN8c39ZS5Ukzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzPlMaYb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzPlMaYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776789874; x=1808325874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZMlm3vke/xn/Mo/8udyirPFnry1e8XrjEu/pi9aURw4=;
  b=ZzPlMaYb+EefMlGsdKm+4FYkLeljyJ/GdyN+BjYWA8G1QNbrbSHMMxX/
   xk5hME4uD10vbP77YMmwu/H/WLqwGDQbDJZrO6jgsek+Qnofnb3mLEBlp
   rXVrpJogdPy7N1vlhoZGDZQ42f/4UhIE0Baym9J/347gF8A7RfCMxREEH
   D2QVcz/DBLHhio6Yt/zOYju1tkr0394x0iRNuLwyBEZmPdaQRzYqCofgG
   GtRUNMmqRmwzjDMJw01U+mCB5e/G1C9yPNPvDUSRZX4CzjjmjfXSNDU5x
   9V8qpnlJPW4qE8nsnGqDIUTWxb3WPmt9sB8dnnyUQA1pBg8lqiRKJ6kEL
   A==;
X-CSE-ConnectionGUID: AdkmFtGrQ1G/81G+2hOf5g==
X-CSE-MsgGUID: FlZUgJk3RQatoo+VFk/m0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="81598286"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="81598286"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:44:33 -0700
X-CSE-ConnectionGUID: 1A287Hd8Qy+B8bKqHBR4qA==
X-CSE-MsgGUID: E72GOy4kQ6KN0VGoVtXeOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="231946096"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:44:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 53E1B120D05;
	Tue, 21 Apr 2026 19:44:28 +0300 (EEST)
Date: Tue, 21 Apr 2026 19:44:28 +0300
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
Subject: Re: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
Message-ID: <aeepbB72uWDxvnE_@kekkonen.localdomain>
References: <20260419093412.40796-1-clamor95@gmail.com>
 <20260419093412.40796-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419093412.40796-6-clamor95@gmail.com>

Hi Shyvatoslav,

On Sun, Apr 19, 2026 at 12:34:12PM +0300, Svyatoslav Ryhel wrote:
> @@ -403,6 +423,60 @@ static int lm3560_init_device(struct lm3560_flash *flash)
>  	return rval;
>  }
>  
> +static void lm3560_power_off(struct lm3560_flash *flash)
> +{
> +	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
> +	regulator_disable(flash->vin_supply);
> +}
> +
> +static int lm3560_power_on(struct lm3560_flash *flash)
> +{
> +	int rval;
> +
> +	rval = regulator_enable(flash->vin_supply);
> +	if (rval < 0) {
> +		dev_err(flash->dev, "failed to enable vin power supply\n");
> +		return rval;
> +	}
> +
> +	gpiod_set_value_cansleep(flash->hwen_gpio, 1);
> +
> +	rval = lm3560_init_device(flash);
> +	if (rval < 0) {
> +		lm3560_power_off(flash);
> +		return rval;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused lm3560_pm_runtime_resume(struct device *dev)
> +{
> +	struct lm3560_flash *flash = dev_get_drvdata(dev);
> +
> +	return lm3560_power_on(flash);
> +}
> +
> +static int __maybe_unused lm3560_pm_runtime_suspend(struct device *dev)

Could you change lm3560_power_o{n,ff}() take struct device pointer as the
argument?

> +{
> +	struct lm3560_flash *flash = dev_get_drvdata(dev);
> +
> +	lm3560_power_off(flash);
> +
> +	return 0;
> +}
> +
> +static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
> +{
> +	unsigned int i;
> +
> +	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++) {

You could define i here.

> +		v4l2_device_unregister_subdev(&flash->subdev_led[i]);
> +		v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
> +		media_entity_cleanup(&flash->subdev_led[i].entity);
> +	}
> +}
> +
>  static int lm3560_probe(struct i2c_client *client)
>  {
>  	struct lm3560_flash *flash;

-- 
Kind regards,

Sakari Ailus
