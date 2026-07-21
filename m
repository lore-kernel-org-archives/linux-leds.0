Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0371F3D56;
	Tue, 21 Jul 2026 17:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653802; cv=none; b=Sn5Jv4LjO08rABfYCvtm5RhGE/sdOw/+JjqyGtbGJmfTmzkxw/0ExIPLmtA4HfkqBUTereeAS8SQr81xFolFgiGtEzfpq8Pe6TfW8+idDIhjJZKP9E/U1EvrXrQ+ZYPQ0+0peTKd0ZvnqrSsqVSq43iK0/ZeulDu4zggcZDDbYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653802; c=relaxed/simple;
	bh=NKwy1FldV/R02JZtnrK1yWJboYKD2LxE9nusJwcnRQ0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UlmUII42+1iu/jdmwED3jBYcOrGtUfrbj8NKc4r1s0zPt2tUuEUVudK50Jg3Tcx0310eUoKO7elwjI281/u3DuMiEqqWnizj50PFHymTm9LQRygjBys3tGZnJwiSGJgBxozUAFtzu8+NphlQ6YDcTwQVcBcvDF4lpAFAp5+FVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4qr1LLJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4qr1LLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784653800; x=1816189800;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NKwy1FldV/R02JZtnrK1yWJboYKD2LxE9nusJwcnRQ0=;
  b=O4qr1LLJAB2QZ85ho6De7aY8wmxiNqx9VkKP2UjZ7AhurGSZLYN6tNBn
   IcD8SMaeQs+wY12/rKjrmbjy2O9CrcsxgBkDlOi8aTwyM1RKrtucIw4nJ
   f/3MLiHqv8t6XgShm93AQRqIUMllvu6ysxgC9YrEjdjauVqFay9+obCR0
   TpzzbX5HtZmVYGEN+CREAlKYev2fCk6XAHz19mndvRpj7+bPXWyKzTZ1h
   Iidnt216O+dY9E6qqILk3uSSonSE/6b/fXL8g0F+lPIP5u0ViqsghuFwf
   wH+d+zfglML5Sm8PDqlRYCVzCBbRVnNX2YwGgkMy8flMM682rOe7Rqyaw
   g==;
X-CSE-ConnectionGUID: /DwKiuHSSa2baDKazCa8jA==
X-CSE-MsgGUID: HGau7TSGQEO2YXAOslv4IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="87796881"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="87796881"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:09:58 -0700
X-CSE-ConnectionGUID: gPEdjVDfTgyubcNKz2Ia3A==
X-CSE-MsgGUID: tHLwrEwfSSin0bNaUG74ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="281101420"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:09:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 20:09:48 +0300 (EEST)
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
Subject: Re: [PATCH RFC v3 10/11] platform/x86: ideapad-laptop: Serialize
 keyboard backlight notifications
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-10-5fb55722e36e@rong.moe>
Message-ID: <acbd4451-1193-ff70-f0fa-26653d0ecc31@linux.intel.com>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe> <20260719-leds-trigger-hw-changed-v3-10-5fb55722e36e@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 19 Jul 2026, Rong Zhang wrote:

> ACPI notifications are delivered in dedicated work contexts and may
> arrive simultaneously. In the following change, much work will be done
> while handling the notification, which could lead to potential race
> conditions.
> 
> Introduce a new mutex to serialize keyboard backlight notifications to
> prevent potential race conditions.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 5aa2fedb8472..66e16abda5e3 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -26,7 +26,9 @@
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
> +#include <linux/lockdep.h>

Why is this being added?

>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
>  #include <linux/power_supply.h>
> @@ -228,6 +230,8 @@ struct ideapad_private {
>  		int type;
>  		struct led_classdev led;
>  		atomic_t last_hw_brightness;
> +
> +		struct mutex notif_mutex; /* protects notifications */
>  	} kbd_bl;
>  	struct {
>  		bool initialized;
> @@ -1720,6 +1724,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
>  	if (!priv->kbd_bl.initialized)
>  		return;
>  
> +	guard(mutex)(&priv->kbd_bl.notif_mutex);
> +
>  	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
>  	if (hw_brightness < 0)
>  		return;
> @@ -1745,6 +1751,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
>  	if (WARN_ON(priv->kbd_bl.initialized))
>  		return -EEXIST;
>  
> +	err = devm_mutex_init(&priv->platform_device->dev, &priv->kbd_bl.notif_mutex);
> +	if (err)
> +		return err;
> +
>  	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
>  	if (hw_brightness < 0)
>  		return hw_brightness;
> 
> 

-- 
 i.

