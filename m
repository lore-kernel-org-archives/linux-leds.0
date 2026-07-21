Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515F73DC4C2;
	Tue, 21 Jul 2026 17:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654104; cv=none; b=hezt+jsOgUTvgcGGwFjjxTu1BxEzfAexcWr6TLnjrJo+Fi5InrMffBWNCKzCcTYgH3+CxOicGWBvqizH2ES5ghjeL9XNaIWEiH8JzCMNZG9V/juJvcd9rntc1dD+3NcxDzMHKhuNSuclvJmbORBNueonrC4EIXY45L0/EKLIQfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654104; c=relaxed/simple;
	bh=QXVr+st/401NkrVcm1s6B7Rservjc1nLuLd9Jjs0Gg0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ogO+pe8NC6NcCDcIGsCRX3d5l20CHb/S8aby1VFnHYVFAx+8dSfTRgyWoJvRY3QzvSLQkSwe5+LklWo2AS5lz8Epp7+ixUU0PxhjyKQ5dM2Ds3aT+/Zjp2DmmmwlDPw7AvvbVWXTosod6JC1qkE+QNjuH5a0X7V/FAlg7x4ibvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uk8c3Lnw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uk8c3Lnw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784654102; x=1816190102;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QXVr+st/401NkrVcm1s6B7Rservjc1nLuLd9Jjs0Gg0=;
  b=Uk8c3Lnwt/cWkHperosdQtPBrWplMqWyG981IN+4Er+/TQjFtQvfhIod
   1TMpX1OyvYjov0a407Td8MV3+HOOkHDQ43m8p68t61iR/uOsFBFBmFOws
   vC6iE7K9U+EJdpRat3uC6TCoOsap4cHHIBNHvi9xO6URVsNMHuiZym7Vb
   nn91CDjCwPod8N4oJnVBaXPK+gKQ+bD7bc8rL1fBD7WZvlVscEyP8KQCX
   2LulhShn7JkHiFH2khMS/eU3NT61JVHmwXF22F73SnYVnRFkjrsPO8jIU
   hvIVjm3bx+LK3/ACw7gTBkivwDshMlU6m9MA3Y+JZweZCVMyO51C+Ih9u
   g==;
X-CSE-ConnectionGUID: 7qb76LcdSleM5x+bWdLBNg==
X-CSE-MsgGUID: 3bK/vApQRNipz2dSX85q+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="102815067"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="102815067"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:15:01 -0700
X-CSE-ConnectionGUID: WwM1UaXIRnmhjhPUg0x0kw==
X-CSE-MsgGUID: fbfu61zQQOi1mbLays6b7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="282343251"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:14:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 20:14:50 +0300 (EEST)
To: Rong Zhang <i@rong.moe>
cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
    =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Ike Panhc <ikepanhc@gmail.com>, 
    Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
    linux-leds@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH RFC v3 11/11] platform/x86: ideapad-laptop: Fully support
 auto keyboard backlight
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-11-5fb55722e36e@rong.moe>
Message-ID: <e4d81cf2-a44d-bcdb-1bc9-f5847b447984@linux.intel.com>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe> <20260719-leds-trigger-hw-changed-v3-11-5fb55722e36e@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 19 Jul 2026, Rong Zhang wrote:

> Currently, the auto brightness mode of keyboard backlight maps to
> brightness=0 in LED classdev. The only method to switch to such a mode
> is by pressing the manufacturer-defined shortcut (Fn+Space). However, 0
> is a multiplexed brightness value; writing 0 simply results in the
> backlight being turned off.
> 
> With brightness processing code decoupled from LED classdev, we can now
> fully support the auto brightness mode. In this mode, the keyboard
> backlight is controlled by the EC according to the ambient light sensor
> (ALS).
> 
> To utilize this, a private hardware control trigger "ideapad-auto" is
> added, with the event handling procedure calling the
> led_trigger_notify_hw_control_changed() interface to activate/deactivate
> the private trigger according to the current LED trigger state.
> 
> Meanwhile, block brightness changes on exit to prevent the side effect
> of LED device unregistration when the private trigger is active from
> resetting the brightness to zero, so that we can retain the state of
> auto mode among boots.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v3:
> - Address concerns from Sashiko
>   - Fix a race condition in ideapad_kbd_bl_led_cdev_brightness_set()
>   - Fix trigger re-registration of ideapad_kbd_bl_auto_trigger
>   - https://sashiko.dev/#/patchset/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3%40rong.moe
> - Make registration failures of ideapad_kbd_bl_auto_trigger non-fatal
> ---
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 112 ++++++++++++++++++++++++---
>  1 file changed, 103 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 66e16abda5e3..253d2962b927 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1714,9 +1714,58 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
>  {
>  	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
>  
> +	/*
> +	 * When deinitializing: It must be the side effect of led_cdev
> +	 * unregistration when our private trigger is active. We've set
> +	 * LED_RETAIN_AT_SHUTDOWN to retain led_cdev brightness level.
> +	 * To do the same for auto mode, gate changes and return early.
> +	 */
> +	if (unlikely(!priv->kbd_bl.initialized))

This too would need include, but I think addressing some earlier include 
request will cover it.

> +		return 0;
> +
>  	return ideapad_kbd_bl_brightness_set(priv, brightness);
>  }
>  
> +static bool ideapad_kbd_bl_auto_trigger_offloaded(struct led_classdev *led_cdev)
> +{
> +	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);

Add include for container_of().

> +
> +	return atomic_read(&priv->kbd_bl.last_hw_brightness) == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
> +}
> +
> +static int ideapad_kbd_bl_auto_trigger_activate(struct led_classdev *led_cdev)
> +{
> +	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
> +
> +	return ideapad_kbd_bl_hw_brightness_set(priv, KBD_BL_AUTO_MODE_HW_BRIGHTNESS);
> +}
> +
> +static struct led_hw_trigger_type ideapad_kbd_bl_auto_trigger_type;
> +
> +static struct led_trigger ideapad_kbd_bl_auto_trigger = {
> +	.name = "ideapad-auto",
> +	.trigger_type = &ideapad_kbd_bl_auto_trigger_type,
> +	.activate = ideapad_kbd_bl_auto_trigger_activate,
> +	.offloaded = ideapad_kbd_bl_auto_trigger_offloaded,
> +};
> +
> +static bool ideapad_kbd_bl_auto_trigger_registered;
> +
> +static void ideapad_kbd_bl_notify_hw_control(struct ideapad_private *priv,
> +					     int hw_brightness, int last_hw_brightness)
> +{
> +	bool hw_control, last_hw_control;
> +
> +	if (priv->kbd_bl.type != KBD_BL_TRISTATE_AUTO)
> +		return;
> +
> +	hw_control = hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
> +	last_hw_control = last_hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
> +
> +	if (hw_control != last_hw_control)
> +		led_trigger_notify_hw_control_changed(&priv->kbd_bl.led, hw_control);
> +}
> +
>  static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
>  {
>  	int hw_brightness, brightness, last_hw_brightness;
> @@ -1738,6 +1787,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
>  	if (hw_brightness == last_hw_brightness)
>  		return;
>  
> +	ideapad_kbd_bl_notify_hw_control(priv, hw_brightness, last_hw_brightness);
> +
>  	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
>  }
>  
> @@ -1768,6 +1819,24 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
>  
>  	switch (priv->kbd_bl.type) {
>  	case KBD_BL_TRISTATE_AUTO:
> +		priv->kbd_bl.led.max_brightness = 2;
> +
> +		if (!ideapad_kbd_bl_auto_trigger_registered) {
> +			dev_warn(&priv->platform_device->dev,
> +				 "Could not provide LED trigger %s for keyboard backlight\n",
> +				 ideapad_kbd_bl_auto_trigger.name);
> +			break;
> +		}
> +
> +		priv->kbd_bl.led.flags             |= LED_TRIG_HW_CHANGED;
> +		priv->kbd_bl.led.hw_control_trigger = ideapad_kbd_bl_auto_trigger.name;
> +		priv->kbd_bl.led.trigger_type       = &ideapad_kbd_bl_auto_trigger_type;

I'm skeptical aligning makes things better here.

> +
> +		/* Hardware remembers the last brightness level, including auto mode. */
> +		if (hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
> +			priv->kbd_bl.led.default_trigger = ideapad_kbd_bl_auto_trigger.name;
> +
> +		break;
>  	case KBD_BL_TRISTATE:
>  		priv->kbd_bl.led.max_brightness = 2;
>  		break;
> @@ -1779,13 +1848,22 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
>  		unreachable();
>  	}
>  
> -	err = led_classdev_register(&priv->platform_device->dev, &priv->kbd_bl.led);
> -	if (err)
> -		return err;
> +	/* Queue notifications, as kbd_bl.initialized is about to be set. */
> +	guard(mutex)(&priv->kbd_bl.notif_mutex);
>  
> +	/*
> +	 * Setting kbd_bl.initialized after led_classdev_register() could lead
> +	 * to race conditions in ideapad_kbd_bl_led_cdev_brightness_set() where
> +	 * kbd_bl.initialized is checked, so set it now. It can be reverted back
> +	 * if the LED classdev failed to register.
> +	 */
>  	priv->kbd_bl.initialized = true;
>  
> -	return 0;
> +	err = led_classdev_register(&priv->platform_device->dev, &priv->kbd_bl.led);
> +	if (err)
> +		priv->kbd_bl.initialized = false;
> +
> +	return err;
>  }
>  
>  static void ideapad_kbd_bl_exit(struct ideapad_private *priv)
> @@ -2612,17 +2690,30 @@ static int __init ideapad_laptop_init(void)
>  {
>  	int err;
>  
> +	err = led_trigger_register(&ideapad_kbd_bl_auto_trigger);
> +	if (err) {
> +		pr_warn("Failed to register LED trigger %s: %d\n",

include missing.

> +			ideapad_kbd_bl_auto_trigger.name, err);
> +	} else {
> +		ideapad_kbd_bl_auto_trigger_registered = true;
> +	}
> +
>  	err = ideapad_wmi_driver_register();
>  	if (err)
> -		return err;
> +		goto err_ledtrig;
>  
>  	err = platform_driver_register(&ideapad_acpi_driver);
> -	if (err) {
> -		ideapad_wmi_driver_unregister();
> -		return err;
> -	}
> +	if (err)
> +		goto err_wmi;
>  
>  	return 0;
> +
> +err_wmi:
> +	ideapad_wmi_driver_unregister();
> +err_ledtrig:
> +	if (ideapad_kbd_bl_auto_trigger_registered)
> +		led_trigger_unregister(&ideapad_kbd_bl_auto_trigger);
> +	return err;
>  }
>  module_init(ideapad_laptop_init)
>  
> @@ -2630,6 +2721,9 @@ static void __exit ideapad_laptop_exit(void)
>  {
>  	ideapad_wmi_driver_unregister();
>  	platform_driver_unregister(&ideapad_acpi_driver);

Why is the order not the reverse of the init order?

> +
> +	if (ideapad_kbd_bl_auto_trigger_registered)
> +		led_trigger_unregister(&ideapad_kbd_bl_auto_trigger);
>  }
>  module_exit(ideapad_laptop_exit)
>  
> 
> 

-- 
 i.

