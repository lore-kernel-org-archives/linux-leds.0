Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755AA447811;
	Thu, 23 Jul 2026 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784816362; cv=none; b=Xfg2q0zbPGWIsGZqtPb7wpe+fwMCJyPJhMaOS0cM4BjprRA5CTxtDLiAK+yWzX8eQ2g2IKZq2x1ASC19GSR03X2tYZnYVYyTDVrIimwttG1kAAgCqfnvHaW4bzIfEMMzNybTTDODh/GOKkLNLbhLmHEFm47LWpGiisJjF2kLr2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784816362; c=relaxed/simple;
	bh=9+Gr9e41mFc32mpdgYWk8e88TxKn2lqqEKy3/4qOwx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7T1XzXpvwhOC9CBAbewgGqCbjgarupK1KpeVgM5EaATyAUFSlZrnIxIQ1bRXQRydd8YaOFbuTy/U97n2tmNy+RHBgjhe2YBSglzAHGQukSxjpg/JkpTDCrhAKbMFLwr9b2uZ/dkstzLraIghPzUlt8Q6ZlePhDwhvB/lNC+jEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927D61F00A3F;
	Thu, 23 Jul 2026 14:19:14 +0000 (UTC)
Date: Thu, 23 Jul 2026 15:18:59 +0100
From: Lee Jones <lee@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 3/4] leds: pca963x: add multicolor LED class support
Message-ID: <20260723141859.GN3363113@google.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
 <20260715-monza-leds-v6-3-d1724bb7fe3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-monza-leds-v6-3-d1724bb7fe3d@oss.qualcomm.com>

On Wed, 15 Jul 2026, Loic Poulain wrote:

> Allow grouping of individual PCA963x PWM channels into a single
> multicolor LED device by adding support for the LED multicolor class.
> 
> A child node with sub-children is treated as a multicolor group,
> others are treated as single leds, keeping full backwards compatibility.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/leds/Kconfig        |   1 +
>  drivers/leds/leds-pca963x.c | 162 ++++++++++++++++++++++++++++++++++----------
>  2 files changed, 128 insertions(+), 35 deletions(-)
> 
> diff --git dur/leds/Kconfig b/drivers/leds/Kconfig
> index f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5..14df88f92b12bbe43908b67f9480cf23056e27e2 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -596,6 +596,7 @@ config LEDS_PCA963X
>  	tristate "LED support for PCA963x I2C chip"
>  	depends on LEDS_CLASS
>  	depends on I2C
> +	select LEDS_CLASS_MULTICOLOR
>  	help
>  	  This option enables support for LEDs connected to the PCA963x
>  	  LED driver chip accessed via the I2C bus. Supported
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index e3a81c60ee27c96e5050a829523dfd43e1f0663f..f3e4d65e48b4c3eefa147a7fb5c9fe81ce569731 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -27,6 +27,7 @@
>  #include <linux/string.h>
>  #include <linux/ctype.h>
>  #include <linux/leds.h>
> +#include <linux/led-class-multicolor.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
>  #include <linux/property.h>
> @@ -101,8 +102,11 @@ struct pca963x;
>  struct pca963x_led {
>  	struct pca963x *chip;
>  	struct led_classdev led_cdev;
> +	struct led_classdev_mc mc_cdev;
> +	struct mc_subled subleds[4];
>  	int led_num; /* 0 .. 15 potentially */
>  	bool blinking;
> +	bool is_mc;
>  	u8 gdc;
>  	u8 gfrq;
>  };
> @@ -199,20 +203,24 @@ static void pca963x_blink(struct pca963x_led *led)
>  	led->blinking = true;
>  }
>  
> -static int pca963x_power_state(struct pca963x_led *led)
> +static void pca963x_track_power_state(struct pca963x_led *led, unsigned int led_num,
> +				      enum led_brightness brightness)
>  {
> -	struct i2c_client *client = led->chip->client;
>  	unsigned long *leds_on = &led->chip->leds_on;
> -	unsigned long cached_leds = *leds_on;
>  
> -	if (led->led_cdev.brightness)
> -		set_bit(led->led_num, leds_on);
> +	if (brightness)
> +		set_bit(led_num, leds_on);
>  	else
> -		clear_bit(led->led_num, leds_on);
> +		clear_bit(led_num, leds_on);
> +}
>  
> -	if (!(*leds_on) != !cached_leds)
> +static int pca963x_sync_power_state(struct pca963x_led *led, unsigned long cached_leds)
> +{
> +	struct i2c_client *client = led->chip->client;
> +
> +	if (!led->chip->leds_on != !cached_leds)
>  		return i2c_smbus_write_byte_data(client, PCA963X_MODE1,
> -						 *leds_on ? 0 : BIT(4));
> +						 led->chip->leds_on ? 0 : BIT(4));
>  
>  	return 0;
>  }
> @@ -221,22 +229,54 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
>  			   enum led_brightness value)
>  {
>  	struct pca963x_led *led;
> +	unsigned long cached_leds;
>  	int ret;
>  
>  	led = container_of(led_cdev, struct pca963x_led, led_cdev);
>  
>  	mutex_lock(&led->chip->mutex);
>  
> +	cached_leds = led->chip->leds_on;
>  	ret = pca963x_brightness(led, value);
>  	if (ret < 0)

Should we check 'if (ret)' here instead of 'if (ret < 0)'? It is generally
preferred to only check for negative values if a positive return value has
specific meaning that needs handling.

>  		goto unlock;
> -	ret = pca963x_power_state(led);
> +
> +	pca963x_track_power_state(led, led->led_num, value);
> +	ret = pca963x_sync_power_state(led, cached_leds);
>  
>  unlock:
>  	mutex_unlock(&led->chip->mutex);
>  	return ret;
>  }
>  
> +static int pca963x_led_mc_set(struct led_classdev *led_cdev,
> +			      enum led_brightness value)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
> +	struct pca963x_led *led = container_of(mc_cdev, struct pca963x_led, mc_cdev);
> +	unsigned long cached_leds;
> +	int ret = 0, sync_ret;
> +
> +	led_mc_calc_color_components(mc_cdev, value);
> +
> +	guard(mutex)(&led->chip->mutex);
> +
> +	cached_leds = led->chip->leds_on;
> +	for (unsigned int i = 0; i < mc_cdev->num_colors; i++) {
> +		led->led_num = mc_cdev->subled_info[i].channel;

Why does this get set twice?

Question from AI:

  Would it be better to re-factor 'pca963x_brightness()' to accept the channel
  number as an explicit parameter? Temporarily overwriting 'led->led_num' in the
  shared structure feels a bit fragile.

> +		ret = pca963x_brightness(led, mc_cdev->subled_info[i].brightness);
> +		if (ret)
> +			break;

Deserves a comment.  Why are we syncing power state on failure?

> +		pca963x_track_power_state(led, mc_cdev->subled_info[i].channel,
> +					  mc_cdev->subled_info[i].brightness);
> +	}
> +
> +	sync_ret = pca963x_sync_power_state(led, cached_leds);
> +
> +	return ret ? : sync_ret;
> +}
> +
>  static unsigned int pca963x_period_scale(struct pca963x_led *led,
>  					 unsigned int val)
>  {
> @@ -300,6 +340,77 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
>  	return 0;
>  }
>  
> +static int pca963x_parse_mc_subleds(struct device *dev, struct pca963x_led *led,
> +				    struct fwnode_handle *fwnode,
> +				    const struct pca963x_chipdef *chipdef)
> +{
> +	unsigned int num_colors = 0;
> +	int ret;
> +
> +	fwnode_for_each_child_node_scoped(fwnode, sub) {
> +		u32 color, subreg;
> +
> +		if (num_colors >= ARRAY_SIZE(led->subleds))
> +			return dev_err_probe(dev, -EINVAL, "Too many LEDs for node %pfw\n", fwnode);
> +
> +		ret = fwnode_property_read_u32(sub, "reg", &subreg);
> +		if (ret || subreg >= chipdef->n_leds)
> +			return dev_err_probe(dev, -EINVAL, "Invalid 'reg' for sub-LED %pfw\n", sub);

Why are you masking the real error?

> +		ret = fwnode_property_read_u32(sub, "color", &color);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Missing 'color' for sub-LED %pfw\n", sub);
> +
> +		led->subleds[num_colors].channel = subreg;
> +		led->subleds[num_colors].color_index = color;
> +		led->subleds[num_colors].intensity = LED_FULL;
> +		num_colors++;
> +	}
> +
> +	led->mc_cdev.subled_info = led->subleds;
> +	led->mc_cdev.num_colors = num_colors;
> +	led->mc_cdev.led_cdev.max_brightness = LED_FULL;
> +	led->mc_cdev.led_cdev.brightness_set_blocking = pca963x_led_mc_set;
> +
> +	return 0;
> +}
> +
> +static int pca963x_register_led(struct device *dev, struct pca963x_led *led,
> +				u32 reg, struct fwnode_handle *fwnode,
> +				const struct pca963x_chipdef *chipdef,
> +				bool hw_blink)
> +{
> +	struct i2c_client *client = led->chip->client;
> +	struct led_init_data init_data = {};
> +	char label[32];
> +	int ret;
> +
> +	led->led_num = reg;
> +	led->is_mc = fwnode_get_child_node_count(fwnode) > 0;

Deservers a comment.

> +	if (led->is_mc) {
> +		ret = pca963x_parse_mc_subleds(dev, led, fwnode, chipdef);
> +		if (ret)
> +			return ret;
> +	} else {
> +		led->led_cdev.brightness_set_blocking = pca963x_led_set;
> +		if (hw_blink)
> +			led->led_cdev.blink_set = pca963x_blink_set;
> +	}
> +
> +	init_data.fwnode = fwnode;
> +	/* for backwards compatibility */

Because ...

Which part?

Sentences start with an upper-case char.

> +	init_data.devicename = "pca963x";
> +	snprintf(label, sizeof(label), "%d:%.2x:%u", client->adapter->nr, client->addr, reg);
> +	init_data.default_label = label;
> +
> +	if (led->is_mc)
> +		return devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev,
> +								 &init_data);
> +
> +	return devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
> +}
> +
>  static int pca963x_register_leds(struct i2c_client *client,
>  				 struct pca963x *chip)
>  {
> @@ -338,37 +449,18 @@ static int pca963x_register_leds(struct i2c_client *client,
>  		return ret;
>  
>  	device_for_each_child_node_scoped(dev, child) {
> -		struct led_init_data init_data = {};
> -		char default_label[32];
> -
>  		ret = fwnode_property_read_u32(child, "reg", &reg);
> -		if (ret || reg >= chipdef->n_leds) {
> -			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
> -				child);
> -			return -EINVAL;
> -		}
> +		if (ret || reg >= chipdef->n_leds)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid 'reg' property for node %pfw\n", child);

We should be propagating the real error instead of investing our own.

> -		led->led_num = reg;
>  		led->chip = chip;
> -		led->led_cdev.brightness_set_blocking = pca963x_led_set;
> -		if (hw_blink)
> -			led->led_cdev.blink_set = pca963x_blink_set;
>  		led->blinking = false;
>  
> -		init_data.fwnode = child;
> -		/* for backwards compatibility */
> -		init_data.devicename = "pca963x";
> -		snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
> -			 client->adapter->nr, client->addr, reg);
> -		init_data.default_label = default_label;
> -
> -		ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
> -						     &init_data);
> -		if (ret) {
> -			dev_err(dev, "Failed to register LED for node %pfw\n",
> -				child);
> -			return ret;
> -		}
> +		ret = pca963x_register_led(dev, led, reg, child, chipdef, hw_blink);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to register LED for node %pfw\n",
> +					     child);
>  
>  		++led;
>  	}
> 
> -- 
> 2.34.1
> 
> 

-- 
Lee Jones
