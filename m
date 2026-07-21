Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A321F3D56;
	Tue, 21 Jul 2026 17:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653744; cv=none; b=uj7HGXjDWOpz45sytNcbNxYsmupk8x5ZbDBnX3jblARw+vw7dOM7bgO3lFotSQ++04BlcRg4CftZX/gfsQXfE83+RqcrF7+axnWp+hysNQmXK5UOchjgifdal6CpwvI8nrDsYxFFul3hNJ9Ylk8cJg27iqGROqkumwbI5kvxylE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653744; c=relaxed/simple;
	bh=oS5qfGPo2/FONxU6uhn0aPwmjPtazjeSLUnqQtQR2Ec=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UnxHFiBCoe+PP0va4aAYmMQ58NfJ1xO8U8IxEsKH8mrC7jEe5s4KrL31grUw3en79Lb/skzkrjlNNqLgcG7l82lkHeiCmY/h4rn4Aor3nmn+C7fm+rLID9yQzFPyQWhDj1SAhcKnaZ7WCQGBdpaHQeVvBenMZnUYmtyI8LzdJUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2YGj0r0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2YGj0r0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784653742; x=1816189742;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oS5qfGPo2/FONxU6uhn0aPwmjPtazjeSLUnqQtQR2Ec=;
  b=k2YGj0r0KaSCw5OBBM6F1Wr3P8k1HThag1vH34vvklXDh7pfDzNn/ws1
   L+Z0LGwaumFvWH7ZnNl04/WeuxEoRYtk0PBb+YLcF3Tg9H5p8FbHbnot0
   PKS8mheivraOR1l13DMK+vE53lKbzBb4T70P0EX77rQ0lx1y2HRHElJ8F
   uo3115g0RDI+BRXYMl7ZJO+qF/5h29azzw8TZe+lkVVyamBAAtobVtmhe
   kOy7P5dTyCQBbZLEwxVv4CN54XIiPHhXwQXP/eGpiWKxqR3FrIS9Dz6Nv
   Fo7Z+lxgAk22lZBlLPCpz1LxHXsJjvzAvxxMRRdYoqnjU5GCAPAuNMq90
   w==;
X-CSE-ConnectionGUID: lSyIo2aOTymrv9IPkx7WAA==
X-CSE-MsgGUID: i/TYZL5oSLaZGlQyKGliIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="110813619"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="110813619"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:09:01 -0700
X-CSE-ConnectionGUID: +eYTkAHAQqmZLENj9AicwA==
X-CSE-MsgGUID: 9Mm6QpwiTJ69cTnCqkqkww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="257280225"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:08:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 20:08:49 +0300 (EEST)
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
Subject: Re: [PATCH RFC v3 09/11] platform/x86: ideapad-laptop: Decouple
 hardware & classdev brightness for keyboard backlight
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-9-5fb55722e36e@rong.moe>
Message-ID: <f0b2cece-882b-02cc-8fe7-a5544fae5f5d@linux.intel.com>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe> <20260719-leds-trigger-hw-changed-v3-9-5fb55722e36e@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 19 Jul 2026, Rong Zhang wrote:

> Some recent models come with an ambient light sensor (ALS). On these
> models, their EC will automatically set the keyboard backlight to an
> appropriate brightness when the effective "hardware brightness" is 3.
> "Hardware brightness" can't be perfectly mapped to an LED classdev
> brightness, but the EC does use this predefined brightness value to
> represent auto mode.
> 
> Currently, the code processing keyboard backlight is coupled with LED
> classdev, making it hard to expose the auto brightness (ALS) mode to the
> userspace.
> 
> As the first step toward the goal, decouple hardware brightness from LED
> classdev brightness, and update comments about corresponding backlight
> modes.
> 
> Since upcoming changes will heavily rely on kbd_bl.last_hw_brightness,
> also convert it into an atomic_t to prevent potential race conditions.
> 
> To minimalize the diff set in upcoming changes, a trivial refactor
> also converts the initialization path into another equivalent form.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/Kconfig          |   1 +
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 144 ++++++++++++++++++---------
>  2 files changed, 100 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
> index 4443f40ef8aa..e92b1e900795 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -16,6 +16,7 @@ config IDEAPAD_LAPTOP
>  	select INPUT_SPARSEKMAP
>  	select NEW_LEDS
>  	select LEDS_CLASS
> +	select LEDS_TRIGGERS
>  	help
>  	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>  	  rfkill switch, hotkey, fan control and backlight control.
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 4fbc904f1fc3..5aa2fedb8472 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -9,6 +9,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/acpi.h>
> +#include <linux/atomic.h>
>  #include <linux/backlight.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> @@ -134,10 +135,31 @@ enum {
>  };
>  
>  /*
> - * These correspond to the number of supported states - 1
> - * Future keyboard types may need a new system, if there's a collision
> - * KBD_BL_TRISTATE_AUTO has no way to report or set the auto state
> - * so it effectively has 3 states, but needs to handle 4
> + * The enumeration has two purposes:
> + *   - as an internal identifier for all known types of keyboard backlight
> + *   - as a mandatory parameter of the KBLC command
> + *
> + * For each type, the hardware brightness values are defined as follows:
> + * +--------------------------+----------+-----+------+------+
> + * |      Hardware brightness |        0 |   1 |    2 |    3 |
> + * | Type                     |          |     |      |      |
> + * +--------------------------+----------+-----+------+------+
> + * | KBD_BL_STANDARD          |      off |  on |  N/A |  N/A |
> + * +--------------------------+----------+-----+------+------+
> + * | KBD_BL_TRISTATE          |      off | low | high |  N/A |
> + * +--------------------------+----------+-----+------+------+
> + * | KBD_BL_TRISTATE_AUTO     |      off | low | high | auto |
> + * +--------------------------+----------+-----+------+------+
> + *
> + * We map LED classdev brightness for KBD_BL_TRISTATE_AUTO as follows:
> + * +--------------------------+----------+-----+------+
> + * |  LED classdev brightness |        0 |   1 |    2 |
> + * | Operation                |          |     |      |
> + * +--------------------------+----------+-----+------+
> + * | Read                     | off/auto | low | high |
> + * +--------------------------+----------+-----+------+
> + * | Write                    |      off | low | high |
> + * +--------------------------+----------+-----+------+
>   */
>  enum {
>  	KBD_BL_STANDARD      = 1,
> @@ -145,6 +167,8 @@ enum {
>  	KBD_BL_TRISTATE_AUTO = 3,
>  };
>  
> +#define KBD_BL_AUTO_MODE_HW_BRIGHTNESS	3
> +
>  #define KBD_BL_QUERY_TYPE		0x1
>  #define KBD_BL_TRISTATE_TYPE		0x5
>  #define KBD_BL_TRISTATE_AUTO_TYPE	0x7
> @@ -203,7 +227,7 @@ struct ideapad_private {
>  		bool initialized;
>  		int type;
>  		struct led_classdev led;
> -		unsigned int last_brightness;
> +		atomic_t last_hw_brightness;
>  	} kbd_bl;
>  	struct {
>  		bool initialized;
> @@ -1592,7 +1616,24 @@ static int ideapad_kbd_bl_check_tristate(int type)
>  	return (type == KBD_BL_TRISTATE) || (type == KBD_BL_TRISTATE_AUTO);
>  }
>  
> -static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
> +static int ideapad_kbd_bl_brightness_parse(struct ideapad_private *priv, int hw_brightness)
> +{
> +	/* Off, low or high */
> +	if (hw_brightness <= priv->kbd_bl.led.max_brightness)
> +		return hw_brightness;
> +
> +	/* Auto (controlled by EC according to ALS), report as off */
> +	if (priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO &&
> +	    hw_brightness == KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
> +		return 0;
> +
> +	/* Unknown value */
> +	dev_warn(&priv->platform_device->dev,

Please (finally) add the include.

> +		 "Unknown keyboard backlight value: %d", hw_brightness);
> +	return -EINVAL;
> +}
> +
> +static int ideapad_kbd_bl_hw_brightness_get(struct ideapad_private *priv)
>  {
>  	unsigned long value;
>  	int err;
> @@ -1606,21 +1647,7 @@ static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
>  		if (err)
>  			return err;
>  
> -		/* Convert returned value to brightness level */
> -		value = FIELD_GET(KBD_BL_GET_BRIGHTNESS, value);
> -
> -		/* Off, low or high */
> -		if (value <= priv->kbd_bl.led.max_brightness)
> -			return value;
> -
> -		/* Auto, report as off */
> -		if (value == priv->kbd_bl.led.max_brightness + 1)
> -			return 0;
> -
> -		/* Unknown value */
> -		dev_warn(&priv->platform_device->dev,
> -			 "Unknown keyboard backlight value: %lu", value);
> -		return -EINVAL;
> +		return FIELD_GET(KBD_BL_GET_BRIGHTNESS, value);
>  	}
>  
>  	err = eval_hals(priv->adev->handle, &value);
> @@ -1630,6 +1657,16 @@ static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
>  	return !!test_bit(HALS_KBD_BL_STATE_BIT, &value);
>  }
>  
> +static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
> +{
> +	int hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
> +
> +	if (hw_brightness < 0)
> +		return hw_brightness;
> +
> +	return ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
> +}
> +
>  static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_classdev *led_cdev)
>  {
>  	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
> @@ -1637,32 +1674,37 @@ static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_cla
>  	return ideapad_kbd_bl_brightness_get(priv);
>  }
>  
> -static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned int brightness)
> +static int ideapad_kbd_bl_hw_brightness_set(struct ideapad_private *priv, int hw_brightness)
>  {
> -	int err;
>  	unsigned long value;
>  	int type = priv->kbd_bl.type;
> +	int err;
>  
>  	if (ideapad_kbd_bl_check_tristate(type)) {
> -		if (brightness > priv->kbd_bl.led.max_brightness)
> -			return -EINVAL;
> -
> -		value = FIELD_PREP(KBD_BL_SET_BRIGHTNESS, brightness) |
> +		value = FIELD_PREP(KBD_BL_SET_BRIGHTNESS, hw_brightness) |
>  			FIELD_PREP(KBD_BL_COMMAND_TYPE, type) |
>  			KBD_BL_COMMAND_SET;
>  		err = exec_kblc(priv->adev->handle, value);
>  	} else {
> -		err = exec_sals(priv->adev->handle, brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
> +		value = hw_brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF;
> +		err = exec_sals(priv->adev->handle, value);
>  	}
> -
>  	if (err)
>  		return err;
>  
> -	priv->kbd_bl.last_brightness = brightness;
> +	atomic_set(&priv->kbd_bl.last_hw_brightness, hw_brightness);
>  
>  	return 0;
>  }
>  
> +static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, int brightness)
> +{
> +	if (brightness > priv->kbd_bl.led.max_brightness)
> +		return -EINVAL;
> +
> +	return ideapad_kbd_bl_hw_brightness_set(priv, brightness);
> +}
> +
>  static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
>  						  enum led_brightness brightness)
>  {
> @@ -1673,26 +1715,29 @@ static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
>  
>  static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
>  {
> -	int brightness;
> +	int hw_brightness, brightness, last_hw_brightness;
>  
>  	if (!priv->kbd_bl.initialized)
>  		return;
>  
> -	brightness = ideapad_kbd_bl_brightness_get(priv);
> -	if (brightness < 0)
> +	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
> +	if (hw_brightness < 0)
>  		return;
>  
> -	if (brightness == priv->kbd_bl.last_brightness)
> -		return;
> +	brightness = ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
> +	if (brightness < 0)
> +		return; /* Reject insane values early. */
>  
> -	priv->kbd_bl.last_brightness = brightness;
> +	last_hw_brightness = atomic_xchg(&priv->kbd_bl.last_hw_brightness, hw_brightness);
> +	if (hw_brightness == last_hw_brightness)
> +		return;
>  
>  	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
>  }
>  
>  static int ideapad_kbd_bl_init(struct ideapad_private *priv)
>  {
> -	int brightness, err;
> +	int hw_brightness, err;
>  
>  	if (!priv->features.kbd_bl)
>  		return -ENODEV;
> @@ -1700,21 +1745,30 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
>  	if (WARN_ON(priv->kbd_bl.initialized))
>  		return -EEXIST;
>  
> -	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
> -		priv->kbd_bl.led.max_brightness = 2;
> -	else
> -		priv->kbd_bl.led.max_brightness = 1;
> +	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
> +	if (hw_brightness < 0)
> +		return hw_brightness;
>  
> -	brightness = ideapad_kbd_bl_brightness_get(priv);
> -	if (brightness < 0)
> -		return brightness;
> +	atomic_set(&priv->kbd_bl.last_hw_brightness, hw_brightness);
>  
> -	priv->kbd_bl.last_brightness = brightness;
>  	priv->kbd_bl.led.name                    = "platform::" LED_FUNCTION_KBD_BACKLIGHT;
>  	priv->kbd_bl.led.brightness_get          = ideapad_kbd_bl_led_cdev_brightness_get;
>  	priv->kbd_bl.led.brightness_set_blocking = ideapad_kbd_bl_led_cdev_brightness_set;
>  	priv->kbd_bl.led.flags                   = LED_BRIGHT_HW_CHANGED | LED_RETAIN_AT_SHUTDOWN;
>  
> +	switch (priv->kbd_bl.type) {
> +	case KBD_BL_TRISTATE_AUTO:
> +	case KBD_BL_TRISTATE:
> +		priv->kbd_bl.led.max_brightness = 2;
> +		break;
> +	case KBD_BL_STANDARD:
> +		priv->kbd_bl.led.max_brightness = 1;
> +		break;
> +	default:
> +		/* This has already been validated by ideapad_check_features(). */
> +		unreachable();

Please add include.

> +	}
> +
>  	err = led_classdev_register(&priv->platform_device->dev, &priv->kbd_bl.led);
>  	if (err)
>  		return err;
> 
> 

-- 
 i.

