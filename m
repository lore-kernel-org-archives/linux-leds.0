Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C2C4A6899;
	Thu, 10 Sep 2026 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052753; cv=none; b=dL3o+ygVr4si7s/ejR1j3Upp1WtIAmIelcLwvqcZj82/1JnvycjJ0tbUxDu+HG/OrFtpY/PhwBf43b1WX0WZxIvz3WIo6R1j3raFdLaLgPSVzj//kMajvQsybqhd6r+O7iOmNhyu+9YA0UmnM+58XIFbwVGSNnTldrxwSYAzoY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052753; c=relaxed/simple;
	bh=Etl5JzVJqML9PmVs917q+ZC+bbgxKo3NsM+f9uGvFK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlLvMwHUZCqm0GF20iLLUl+9dor2qC8E24NaG3/7IzDwW+OnA57J/K9ecH/pOSK7BZgFZ/t7854uWgd+ogAOYPdVlrDoD2PsIVS+HaupYLBqAlpd1v2KgiyeprcntUxozNu1oCm4WLEHtG/+SpLKA2AsA8mDO8BU/ElrxptuRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AClqOoG8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AClqOoG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E541F00893;
	Thu, 10 Sep 2026 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789052743;
	bh=2qSXLjhAjygcr+iubfm3t6D+tdBAD9pO+lEAOs4Tgrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AClqOoG8fAdd+WfzrsI/BVzr5vLb7kNVYRigDBFAzV18qOToEIlxubozh0+9DY7IR
	 3v1hDPcfcfi/rCkmuUy2hqqssTWP3Pkss9oR9rAdmADcf+OzRlbE40BSxPNR926s3E
	 fDLPRm9CJGDrQGsKMHdwL/q6h9RJIPGXAc0jnT+J0JMFBaEspFW92JtS5NQiaNov9V
	 UT5AfZd7Edlgsg/cFuDz1EE7ajLmEyEBNceBDW9KHEZUNn6q/X7JskX6Va4Nnvo22J
	 4QLhlC3klw9Qy4NS8KdiZWNn+h9GdpFJQCqXNngyck3wnegzKTvm4pPgu43J2uVV02
	 IY03/t/R7ixCw==
Date: Thu, 10 Sep 2026 16:05:35 +0100
From: Lee Jones <lee@kernel.org>
To: Rong Zhang <i@rong.moe>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6 04/12] leds: trigger: Add offloaded() callback and
 provide trigger_may_offload attribute
Message-ID: <20260910150535.GG1051768@google.com>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-4-55693cd78877@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-4-55693cd78877@rong.moe>

On Wed, 02 Sep 2026, Rong Zhang wrote:

> There are multiple triggers implementing hardware control. However, the
> LED trigger core doesn't really know the hardware control (offloaded)
> state since the coordination is done directly between the trigger and
> the LED driver. It can only assume private triggers as offloaded and
> generic ones as not offloaded.
> 
> Add an offloaded() callback so that triggers can report their offloaded
> states to the LED trigger core. When unimplemented, it defaults to true
> for private triggers and false for generic ones to keep the current
> behavior unchanged.
> 
> With that, provide a new attribute "trigger_may_offload", so that
> userspace can determine:
> 
> - if the LED device supports hardware control (supported => visible)
> - which trigger is the hardware control trigger selected by the LED
>   device
> - if the trigger is selected ("<foo_trigger>")
> - if the trigger is offloaded ("[foo_trigger]")
> 
> Note: the documentation describes the attribute as "returning a list"
> despite the LED core currently only supports one hardware control
> trigger per LED device. This is intentional to make the attribute
> extensible in the future without breaking userspace.
> 
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v6:
> - Update Date: and KernelVersion: for the document of
>   /sys/class/leds/<led>/trigger_may_offload
> 
> Changes in v3:
> - Rearrange the series so that the code using the offloaded() callback is
>   introduced before the driver implementation (thanks Thomas Weißschuh)
> - Reword documentation (ditto)
> - Adopt guard() and lockdep (ditto)
> - Adopt __led_trigger_is_hw_controlled() from newly-integrated PATCH 1
> ---
>  Documentation/ABI/testing/sysfs-class-led | 22 ++++++++++++++++++++++
>  Documentation/leds/leds-class.rst         | 20 ++++++++++++++++++++
>  drivers/leds/led-class.c                  | 22 ++++++++++++++++++++++
>  drivers/leds/led-triggers.c               | 30 ++++++++++++++++++++++++++++++
>  drivers/leds/leds.h                       |  2 ++
>  include/linux/leds.h                      |  1 +
>  6 files changed, 97 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index d4c918cc11a1..e3605fc55fa8 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -78,6 +78,28 @@ Description:
>  		(which would often be configured in the device tree for the
>  		hardware).
>  
> +What:		/sys/class/leds/<led>/trigger_may_offload

*_to_hw?

> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Names and states of triggers that may be offloaded to hardware.
> +		Such triggers are also called "hardware control trigger" in some
> +		context.
> +
> +		Only exists when the LED supports trigger offload.
> +
> +		Reading this file returns a list of triggers that are capable to
> +		be offloaded. The optional brackets around the trigger name
> +		indicate the state of the current trigger:
> +
> +		- `foo_trigger`: the trigger is not selected.
> +		- `<foo_trigger>`: the trigger is selected, but falls back to
> +		  software blink for some reason (e.g., incompatible trigger
> +		  parameters)
> +		- `[foo_trigger]`: the trigger is selected and offloaded to
> +		  hardware.
> +
>  What:		/sys/class/leds/<led>/inverted
>  Date:		January 2011
>  KernelVersion:	2.6.38
> diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
> index 3913966cfdac..2d41a6db602c 100644
> --- a/Documentation/leds/leds-class.rst
> +++ b/Documentation/leds/leds-class.rst
> @@ -242,6 +242,9 @@ ops and needs to declare specific support for the supported triggers.
>  
>  With hw control we refer to the LED driven by hardware.
>  
> +A sysfs attribute `trigger_may_offload` is provided for userspace to
> +query supported triggers and their states.
> +
>  LED driver must define the following value to support hw control:
>  
>      - hw_control_trigger:
> @@ -298,6 +301,15 @@ LED driver must implement the following API to support hw control:
>                  Returns a pointer to a struct device or NULL if nothing
>                  is currently attached.
>  
> +LED trigger should implement the following API to indicate hw control:
> +    - offloaded:

hw_offloaded?

> +                return a boolean indicating if the trigger is currently
> +                offloaded to hardware.
> +
> +                If a trigger doesn't implement this callback, the default
> +                value will be true for private triggers and false for generic
> +                ones.
> +
>  LED driver can activate additional modes by default to workaround the
>  impossibility of supporting each different mode on the supported trigger.
>  Examples are hardcoding the blink speed to a set interval, enable special
> @@ -311,6 +323,14 @@ the end use hw_control_set to activate hw control.
>  A trigger can use hw_control_get to check if a LED is already in hw control
>  and init their flags.
>  
> +Alternatively, a private trigger can be implemented along with the LED driver if
> +the LED's hardware control doesn't fit any generic trigger. To associate the
> +private trigger with the LED classdev, their `trigger_type` must be the same. To
> +declare that the private trigger provides hardware control for the associated
> +LED classdev, set the `hw_control_trigger` string to the trigger's name. Since
> +both the LED classdev and the private trigger are in the same LED driver, it's
> +not necessary for them to coordinate via `hw_control_*` callbacks.
> +
>  When the LED is in hw control, no software blink is possible and doing so
>  will effectively disable hw control.
>  
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 39cc2f3ea63f..7e571bd1de5b 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -96,8 +96,30 @@ static const struct bin_attribute *const led_trigger_bin_attrs[] = {
>  	&bin_attr_trigger,
>  	NULL,
>  };
> +
> +static DEVICE_ATTR_RO(trigger_may_offload);
> +static struct attribute *led_trigger_attrs[] = {
> +	&dev_attr_trigger_may_offload.attr,
> +	NULL
> +};
> +
> +static umode_t led_trigger_is_visible(struct kobject *kobj,

Why doesn't all of this live in the triggers file as well?

> +				      struct attribute *attr,
> +				      int idx)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +
> +	if (attr == &dev_attr_trigger_may_offload.attr)
> +		return led_cdev->hw_control_trigger ? attr->mode : 0;
> +
> +	return attr->mode;
> +}
> +
>  static const struct attribute_group led_trigger_group = {
>  	.bin_attrs = led_trigger_bin_attrs,
> +	.attrs = led_trigger_attrs,
> +	.is_visible = led_trigger_is_visible,
>  };
>  #endif
>  
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 804a04b326c4..de17a8bbb4d4 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -42,6 +42,10 @@ static bool __led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
>  	if (!led_cdev->trigger)
>  		return false;
>  
> +	if (led_cdev->trigger->offloaded)
> +		return led_cdev->trigger->offloaded(led_cdev);
> +
> +	/* Otherwise assume private triggers as always offloaded. */

s/as/are/

>  	return led_cdev->trigger->trigger_type;
>  }
>  
> @@ -341,6 +345,32 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
>  }
>  EXPORT_SYMBOL_GPL(led_trigger_set_default);
>  
> +ssize_t trigger_may_offload_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct led_trigger *trig;
> +	bool hit, offloaded;
> +	int len;
> +
> +	guard(mutex)(&led_cdev->led_access);
> +	guard(rwsem_read)(&led_cdev->trigger_lock);
> +
> +	trig = led_cdev->trigger;
> +
> +	offloaded = __led_trigger_is_hw_controlled(led_cdev);
> +	hit = offloaded || (trig && !strcmp(led_cdev->hw_control_trigger, trig->name));
> +
> +	/* [offloaded] <active_but_not_offloaded> inactive */

Why do they have to live in different 'containers'?

> +	len = sysfs_emit(buf, "%s%s%s\n",
> +			 offloaded ? "[" : (hit ? "<" : ""),
> +			 led_cdev->hw_control_trigger,
> +			 offloaded ? "]" : (hit ? ">" : ""));
> +
> +	return len;
> +}
> +EXPORT_SYMBOL_GPL(trigger_may_offload_show);
> +
>  /* LED Trigger Interface */
>  
>  int led_trigger_register(struct led_trigger *trig)
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index bee46651e068..b08a289397e4 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -27,6 +27,8 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
>  ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>  			const struct bin_attribute *bin_attr, char *buf,
>  			loff_t pos, size_t count);
> +ssize_t trigger_may_offload_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf);
>  
>  extern struct rw_semaphore leds_list_lock;
>  extern struct list_head leds_list;
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index d778709f5b1b..bee2b4309a09 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -485,6 +485,7 @@ struct led_trigger {
>  	const char	 *name;
>  	int		(*activate)(struct led_classdev *led_cdev);
>  	void		(*deactivate)(struct led_classdev *led_cdev);
> +	bool		(*offloaded)(struct led_classdev *led_cdev);
>  
>  	/* Brightness set by led_trigger_event */
>  	enum led_brightness brightness;
> 
> -- 
> 2.55.0
> 

-- 
Lee Jones
