Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100964;
	b=X5dIbeQkyu5AzV+fSE2x6wyc4wCcVtcKxkVFQo3geKCaeEiho8mW0R7WfV5nogyKl1+W
	 mZNDJsBPHdJI3OfYVKyQx12FMv6tOQ4WP0w+SBCr1ayQ5Dm2ArjPtN995XfBg5EaihRkf
	 AJCTJVHtwcVyC8kosHpFAQ0XowxsfEB/lmUjNWxR6fGaFZO4GaBQd46iTkJd92K1iDbFg
	 pL25+K0SkdAARwepg1oNFGBCfsru980Hs5iMFvD8piMBSSsyX+Ar518bdU2yFBOpoBxpC
	 x8I7kPDrMR2Zzn3gMa2owYs6uBQfrBZVTZVBkOXVR7al4Riag0SgCSJyEF0BJ4MfHWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100964;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hrSUTpE+XTUM3SLfQy7lBS71+DWUqoUVA9m66TJmz+o=;
	b=d3YgXwv2FYmsJqL3SJu50IGbJltWTXI6lNGNmELW+m1YHgF7Or8mF6O30wGZjk1HZV9w
	 1EuXW/QkadCvUxUfzoyapC+nkHim/qATJ2ElWnHu8iwxfAb35PO6ZzfmITOlUGdb3ju15
	 Q3p9HlMQOue4C5gMPMhUQz/tqyhrVmDNpVprMW6u5tXw83YBqvEesKWR6b9zQ5vqpS5Bn
	 II10Fe0ZCQTeK2amrb4bvJz7GME/O+dGwGFBR2xZEMpf8p3gCGsiXxMw3sd9fVmhdy2ef
	 udaITLWMzpWA8tK7AIdQAKRX2u4zhVNTR3ftFGvz60yG+ZCfJ9M+x3myaU2/egWAOgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Up0TrIjX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3476C606A338;
	Thu, 19 Nov 2026 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Up0TrIjX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165F21F000C8;
	Thu, 19 Nov 2026 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795100964;
	bh=hrSUTpE+XTUM3SLfQy7lBS71+DWUqoUVA9m66TJmz+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Up0TrIjXfbo2Qs0NGGdkwqxHS2D4oBMjzts+k6lZ+3a/0sU0wrqKnYrHGgvqcOfwh
	 Jgt4U57W15cHr5T5t95XIftj3fQ1ub/SCfE36gnT8ht0HtZxPK14Zfuc6QMb/HRV4b
	 KAkbzCWL6zVo5RaOXWMf5n/avQYXO9hk3dE3fGBR/x60/ekmjwVbHrBxe6yWIc9RC4
	 jpIEbyuTcYiHsHPMZc6/pe7GGi3H7m92IrdgrGr2XesUH5rnFbTc6UJJedI4vifWtD
	 uPt8LuU5EvZz5ye1+u3UkBZXZCcWiAkPI91XTUpCtS/0TcP20qElEhRFdCMBPwACo6
	 bLbIluWs8+P1w==
Date: Thu, 19 Nov 2026 15:09:20 +0000
From: Lee Jones <lee@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] leds: class: Split led_classdev_register_ext()
Message-ID: <20261119150920.GU98456@joneslee-macbookpro.roam.internal>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-9-W_Armin@gmx.de>
 <983f521e-0e83-4600-b59b-08675a8d0d70@gmx.de>
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
In-Reply-To: <983f521e-0e83-4600-b59b-08675a8d0d70@gmx.de>

--- checkpatch.pl (3 issues) ---
Line 4: WARNING: 'seperate' may be misspelled - perhaps 'separate'?
Line 55: ERROR: open brace '{' following function definitions go on the next line
Line 79: ERROR: that open brace { should be on the previous line
----------------------------------

On Tue, 10 Nov 2026, Armin Wolf wrote:

> Am 18.10.26 um 15:46 schrieb Armin Wolf:
> > Split led_classdev_register_ext() into two seperate internal functions

Typo: 'seperate' should be 'separate'.

> > to prepare for future changes around LED class device initialization.
> > 
> > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > ---
> >   drivers/leds/led-class.c | 105 +++++++++++++++++++++++++++++++--------
> >   drivers/leds/leds.h      |   3 ++
> >   2 files changed, 88 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 77a0fce03952..ace417a2388e 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -228,9 +228,15 @@ static struct led_classdev *led_module_get(struct device *led_dev)
> >   	return led_cdev;
> >   }
> > +static void led_classdev_release(struct device *dev)
> > +{
> > +	kfree(dev);
> > +}
> > +
> >   static const struct class leds_class = {
> >   	.name = "leds",
> >   	.dev_groups = led_groups,
> > +	.dev_release = led_classdev_release,
> >   	.pm = &leds_class_dev_pm_ops,
> >   };
> > @@ -465,16 +471,21 @@ static int led_classdev_next_name(const char *init_name, char *name,
> >   }
> >   /**
> > - * led_classdev_register_ext - register a new object of led_classdev class
> > - *			       with init data.
> > - *
> > - * @parent: parent of LED device
> > + * led_classdev_init - Initialize a new LED class device.
> > + * @parent: parent of LED device.
> >    * @led_cdev: the led_classdev structure for this device.
> > - * @init_data: LED class device initialization data
> > + * @init_data: LED class device initialization data.
> > + *
> > + * Initializes a new LED class device, but does not register with the
> > + * subsystem yet. Useful for performing additional initialization before
> > + * adding the LED class device to the subsystem using led_classdev_add().
> > + * After calling this function put_device() needs to be called on the dev
> > + * field inside the LED class device in order to dispose it.
> > + *
> > + * Return: Zero on success or a negative error code on failure.
> >    */
> > -int led_classdev_register_ext(struct device *parent,
> > -			      struct led_classdev *led_cdev,
> > -			      struct led_init_data *init_data)
> > +int led_classdev_init(struct device *parent, struct led_classdev *led_cdev,
> > +		      struct led_init_data *init_data)
> >   {
> >   	char composed_name[LED_MAX_NAME_SIZE];
> >   	char final_name[LED_MAX_NAME_SIZE];
> > @@ -539,23 +550,54 @@ int led_classdev_register_ext(struct device *parent,
> >   	if (!led_cdev->max_brightness)
> >   		led_cdev->max_brightness = LED_FULL;
> > -	mutex_lock(&led_cdev->led_access);
> > -	led_cdev->dev = device_create_with_groups(&leds_class, parent, 0, led_cdev,
> > -						  led_cdev->groups, "%s", final_name);
> > -	if (IS_ERR(led_cdev->dev)) {
> > -		mutex_unlock(&led_cdev->led_access);
> > -		return PTR_ERR(led_cdev->dev);
> > +	led_cdev->dev = kzalloc_obj(*led_cdev->dev);
> > +	if (!led_cdev->dev)
> > +		return -ENOMEM;
> > +
> > +	device_initialize(led_cdev->dev);
> > +	led_cdev->dev->class = &leds_class;
> > +	led_cdev->dev->parent = parent;
> > +	led_cdev->dev->groups = led_cdev->groups;
> > +	dev_set_drvdata(led_cdev->dev, led_cdev);
> > +	ret = kobject_set_name(&led_cdev->dev->kobj, "%s", final_name);
> > +	if (ret < 0)

Please use if (ret) to check for errors, not if (ret < 0), as positive return
values do not have a specific meaning here.

> > +	{

The open brace '{' following an 'if' statement should be on the previous line.

> > +		put_device(led_cdev->dev);
> > +		return ret;
> >   	}
> >   	if (init_data && init_data->fwnode)
> >   		device_set_node(led_cdev->dev, init_data->fwnode);
> 
> Sashiko has the following complain about this:
> 
> Because led_cdev->dev is a class device that never binds to a driver:
> 
> 1. __fw_devlink_link_to_consumers(led_cdev->dev) converts consumer
> fwnode_links
>     on init_data->fwnode into managed device links with
> led_cdev->dev as the
>     supplier instead of the parent LED controller. During boot (while
>     fw_devlink_drv_reg_done is false), consumers remain blocked with
>     -EPROBE_DEFER until fw_devlink_drivers_done() runs, and are
> never linked to
>     the parent controller for runtime PM, suspend/resume, or unbind
> ordering.
> 
> 2. __fw_devlink_link_to_suppliers(led_cdev->dev, fwnode) creates
> managed device
>     links with led_cdev->dev as the consumer for any supplier
> properties on the
>     child LED node (such as gpios in gpio-leds or pwms in pwm-leds).
> Since
>     led_cdev->dev never probes a driver, those links stay in
> DL_STATE_AVAILABLE
>     and prevent the GPIO or PWM suppliers from reaching sync_state().
> 
> I have no experience with devicetree, so i cannot verify if this is
> true, why do we call device_set_node() in the first place after having
> already registered the device?

As requested:

  Sashiko is spot on here.
  
  Previously, led_classdev_register_ext() used device_create_with_groups(), which
  calls device_add() internally before returning.  Because of that,
  device_set_node() was only ever called *after* device_add() had already run with
  a NULL 'fwnode', meaning fw_devlink_link_device() was completely bypassed.
  
  The fwnode still needs to be attached to 'led_cdev->dev' so that in-kernel LED
  consumers (such as of_led_get() / fwnode_led_get() via
  class_find_device_by_fwnode()) can look up the LED class device by its DT/fwnode
  handle, and so the 'of_node' sysfs symlink can be populated.
  
  However, moving device_set_node() before device_add() causes device_add() ->
  fw_devlink_link_device() to see a non-NULL 'fwnode' on a class device that has
  no 'bus' and never binds to a driver:
  
  1. 'init_data->fwnode->dev' gets set to 'led_cdev->dev' before registration,
  hijacking consumer fwnode links away from the parent controller device (which
  actually probes a driver) onto the driverless class device.  2. Any supplier
  properties on the child LED node (like 'gpios' or 'pwms') get linked with
  'led_cdev->dev' as the consumer, leaving those device links stuck in
  'DL_STATE_AVAILABLE' forever and blocking suppliers' sync_state() callbacks.
  
  Notice also that setting the node after device_add() was the reason
  'drivers/leds/led-class.c' historically never got the automatic 'of_node' sysfs
  link created during device_add() unless handled carefully, and why 'fwnode->dev'
  remained NULL (as device_add() is what assigns 'dev->fwnode->dev = dev' when
  'fwnode->dev' is not yet set!).
  
  To preserve the existing behaviour and avoid breaking fw_devlink(), keep the
  device_set_node() call in led_classdev_add() *after* device_add() (or pass
  'fwnode' into led_classdev_add()), rather than calling it in
  led_classdev_init().



-- 
Lee Jones
