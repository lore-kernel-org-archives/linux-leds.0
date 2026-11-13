Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571216;
	b=BC7tADgS2vcsMezVkODTqqRfGKT3+4u5DWMtmzhHS2IsHjxUKHIaBLVQMssdSgAaszI5
	 yQzW87sffAliwr17Ioye2h9SuWMg113LV2qbrPB11lmnGxFQI2vD2GMwtThuSh37wFnnm
	 RaR9tkvYD6+GA3IeutHExgbSH5wA1r/Z47bcZVrydW+Q6dZ6bzOJcvaDpUwvzTp9GdJW3
	 mBiPc0anXSejMoZLN8vys7Tg+jqqPJHFkzFm0A5r1viYHzM9Cfl2m/yoMmPKdW6YQpOOA
	 Wp7/4TzKWdBFQxX8UCKVOJbAHMBiga5votNCkzjH0LwOOV+8TWoEI9nI3WTMcb3d1bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571216;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ei1Ls7NI75VAq7JY/wWQw/5uRDsYxfarNhdnZ6VNtqM=;
	b=uCmebKjCAnoQRkQqi1C27W/8fKFN/t6UGYDO8psnhRzqX8vMLSZe2LhPWueN+UGYJnFV
	 XxFoMwNztwtDby7VsYIm7SH4yYDKy63k/v9HjhzCAx63IAZK8OBSEuQ1bPy5YvSwh5z9C
	 NQyNUZZrMPonBmLKYa6/NuihPOhLtvU/Oa4sQyUT3kJB2y7lENdGQT8kAbkRbh+zE/phe
	 uOVAO7XEVWbfN+PKwW+FAVcTitjTWwVLrXD+o7gYBMZm9n/sKv1bwgBWgu7ISYe3PbXqM
	 pci6GD9qSq6TItFgIQ/OBW8g1e5nDGCchSKE2Jj27p6mkytDBi1qh8klb7/Hmjm9E1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPgD3zeR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC66E606A323;
	Fri, 13 Nov 2026 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPgD3zeR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56D21F000CC;
	Fri, 13 Nov 2026 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571216;
	bh=Ei1Ls7NI75VAq7JY/wWQw/5uRDsYxfarNhdnZ6VNtqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BPgD3zeR67YKATPf1n3qviOikQrtWRL6WXKOzLyzTmC49DfCtL9sfYpJd21XwXeVx
	 ou4VTU9Pi7Sk0HOAxpOe33GwJmfOsbwfOgEUD2kb70J1Ny9gJwyRIdXBDTkDoe7DX1
	 2+bUUSc30ziJK1JByZd12SQ7KeyMUwB/bbPSkBjLZT4vT9bgDquqb306tdmtRffKXe
	 x2hlC+eRDrUQebKwc/4KwFDmivYn2++ZBC22qWMUNDV6SQ4k4Bl6Oy1HivW6moGFFr
	 DULszpjmRVEVxOV3b7GqGv1neIoum4ZMBBmJLkog6k0qILG03z6+GDGUss0LiJrfJz
	 FSg8Gufu5Zt5w==
Date: Fri, 13 Nov 2026 12:00:11 +0000
From: Lee Jones <lee@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Kees Cook <kees@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] leds: trigger: netdev: fix sysfs_update_group()
 races
Message-ID: <20261113120011.GG6323@joneslee-macbookpro.roam.internal>
References: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
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
In-Reply-To: <20261027113349.383147-1-alexander.sverdlin@siemens.com>

On Tue, 27 Oct 2026, A. Sverdlin wrote:

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> The netdev LED trigger refreshes the link_speed attribute group with
> sysfs_update_group() from several contexts (the NETDEV_CHANGE notifier,
> device_name writes and, indirectly, trigger (de)activation) that share no
> common lock. On a board that emits PHY link events while the trigger is
> being (re)armed during boot this is observed as a hard sysfs failure:
> 
>   sysfs: cannot create duplicate filename '...green:lan/link_10'
>   ...
>   led_trigger_set
>   led_trigger_write
> 
> The window between activate() and device_add_groups() in led_trigger_set()
> is narrow, so to reproduce it reliably I artificially widened it with the
> debug patch below:
> 
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -12,6 +12,7 @@
>  #include <linux/list.h>
>  #include <linux/spinlock.h>
>  #include <linux/device.h>
> +#include <linux/delay.h>
>  #include <linux/timer.h>
>  #include <linux/rwsem.h>
>  #include <linux/leds.h>
> @@ -223,6 +224,8 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
>  		if (ret)
>  			goto err_activate;
> 
> +		msleep(5000);
> +
>  		ret = device_add_groups(led_cdev->dev, trig->groups);
>  		if (ret) {
>  			dev_err(led_cdev->dev, "Failed to add trigger attributes\n");
> 
> With that msleep() in place, writing the trigger while a NETDEV_CHANGE is
> delivered from the linkwatch workqueue reproduces the duplicate-filename
> splat every time.
> 
> The whole series is LOCKDEP-verified.
> 
> Changelog:
> v6:
> - report invalid interval to user space
> - fixed unlocked hw_control check in interval_store()
> - added missing carrier_link_up check in netdev_trig_sw_blink()

This set is ready to apply, but needs a rebase.

Please add my RB on each patch when resending.

Acked-by: Lee Jones <lee@kernel.org>

> v5:
> - removed unset_device_name()
> - https://lore.kernel.org/all/20261020124651.1987272-1-alexander.sverdlin@siemens.com/
> v4:
> - introduced netdev_trig_sw_blink() and used it in netdev_trig_work()
> - https://lore.kernel.org/all/20261001131206.2513248-1-alexander.sverdlin@siemens.com/
> v3:
> - introduced unset_device_name() as a counterpart of set_device_name()
> - guard() has been converted to either explicit mutex_lock()/mutex_unlock()
>   or scoped_guard()
> - rebased onto next-20260925
> - https://lore.kernel.org/all/20260929120902.2793138-1-alexander.sverdlin@siemens.com/
> v2:
> - addressed pre-existing issues found by Sashiko (patches 1&2)
> - reduced verbosity both in comments and in commit messages
> - patch 3 is a combined rework of patches 1&2 from v1
> - dropped sync from cancel_delayed_work() (worker now takes the lock)
> - https://lore.kernel.org/all/20260921093249.3481413-1-alexander.sverdlin@siemens.com/
> v1:
> - https://lore.kernel.org/all/20260914132356.807004-1-alexander.sverdlin@siemens.com/
> 
> 
> Alexander Sverdlin (5):
>   leds: trigger: netdev: Put netdev on activate error path
>   leds: trigger: netdev: Access net_dev under trigger_data->lock in the
>     worker
>   leds: trigger: netdev: Fix sysfs_update_group() races
>   leds: trigger: netdev: Report invalid interval to user space
>   leds: trigger: netdev: Serialize mode/interval stores with trigger
>     lock
> 
>  drivers/leds/trigger/ledtrig-netdev.c | 140 ++++++++++++++++++--------
>  1 file changed, 96 insertions(+), 44 deletions(-)
> 
> -- 
> 2.56.0
> 
> 

-- 
Lee Jones
