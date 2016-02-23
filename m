From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH RFC 3/3] leds: Add driver for the ISSI IS31FL32xx family
 of LED drivers
Date: Tue, 23 Feb 2016 18:45:17 +0000
Message-ID: <20160223184517.GB10246@leverpostej>
References: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
 <1456251445-23970-4-git-send-email-drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:39279 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754881AbcBWSpX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 23 Feb 2016 13:45:23 -0500
Content-Disposition: inline
In-Reply-To: <1456251445-23970-4-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>

On Tue, Feb 23, 2016 at 01:17:25PM -0500, David Rivshin (Allworx) wrote:
> From: David Rivshin <drivshin@allworx.com>
> +static int is31fl32xx_parse_child_dt(const struct device *dev,
> +				     const struct device_node *child,
> +				     struct is31fl32xx_led_data *led_data)
> +{
> +	struct led_classdev *cdev = &led_data->cdev;
> +	int ret = 0;
> +	u32 reg;
> +
> +	cdev->name = of_get_property(child, "label", NULL) ? : child->name;

We really shouldn't be spreading of_get_property into more drivers. It's
generally not what you want, and doesn't do appropriate sanity checking.

Use of_property_read_string, though you may need to copy the result.

> +
> +	ret = of_property_read_u32(child, "reg", &reg);
> +	if (ret || reg < 1 || reg > led_data->priv->cdef->channels) {
> +		dev_err(dev,
> +			"Child node %s does not have a valid reg property\n",
> +			child->name);
> +		return -EINVAL;
> +	}
> +	led_data->channel = reg;
> +
> +	cdev->default_trigger = of_get_property(child, "linux,default-trigger",
> +						NULL);

Likewise.

Thanks,
Mark. 
