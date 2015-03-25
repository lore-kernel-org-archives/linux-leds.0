From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Wed, 25 Mar 2015 02:54:29 +0200
Message-ID: <20150325005429.GF18321@valkosipuli.retiisi.org.uk>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:46725 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751928AbbCYAzG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Tue, 24 Mar 2015 20:55:06 -0400
Content-Disposition: inline
In-Reply-To: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, j.anaszewski@samsung.com

Hi Ricardo,

(Cc Jacek.)

I had similar thoughts when reviewing Jacek's V4L2 flash API patches. See
below.

On Sat, Mar 14, 2015 at 12:05:39AM +0100, Ricardo Ribalda Delgado wrote:
> The current code expected that every LED had an unique name. This is a
> legit expectation when the device tree can no be modified or extended.
> But with device tree overlays this requirement can be easily broken.
> 
> This patch finds out if the name is already in use and adds the suffix
> _1, _2... if not.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> v3: Suggested by Bryan Wu <cooloney@gmail.com>
> 
> -Do not allocate dynamically the name
>  drivers/leds/led-class.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 768d33a..4ca37b8 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -212,6 +212,26 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
>  	.resume         = led_resume,
>  };
>  
> +static int match_name(struct device *dev, const void *data)
> +{
> +	if (!dev_name(dev))
> +		return 0;
> +	return !strcmp(dev_name(dev), (char *)data);
> +}
> +
> +static int led_classdev_next_name(const char *init_name, char *name,
> +				  size_t len)
> +{
> +	int i = 0;
> +
> +	strncpy(name, init_name, len);
> +
> +	while (class_find_device(leds_class, NULL, name, match_name))
> +		snprintf(name, len, "%s_%d", init_name, ++i);
> +
> +	return i;
> +}
> +
>  /**
>   * led_classdev_register - register a new object of led_classdev class.
>   * @parent: The device to register.
> @@ -219,12 +239,19 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
>   */
>  int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>  {
> +	char name[64];
> +	int ret;
> +
> +	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
>  	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
> -					led_cdev, led_cdev->groups,
> -					"%s", led_cdev->name);
> +					led_cdev, led_cdev->groups, name);
>  	if (IS_ERR(led_cdev->dev))
>  		return PTR_ERR(led_cdev->dev);
>  
> +	if (ret)
> +		dev_info(parent, "Led %s renamed to %s due to name collision",
> +				led_cdev->name, dev_name(led_cdev->dev));

I'd use dev_warn() or even WARN_ON(ret). This is a rather serious issue as
now the probe order defines the name of the device. There might be something
better such as the I2C bus/address.

If the registration order for some reason changes, that'd revert the device
names. In Media controller this is part of the user space API.

I suggested Jacek adding the uniqueness requirement to documentation as
well, ePAPR by itself does not require it for label properties.

> +
>  #ifdef CONFIG_LEDS_TRIGGERS
>  	init_rwsem(&led_cdev->trigger_lock);
>  #endif

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
