Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03ED455176;
	Mon, 14 Sep 2026 16:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405180; cv=none; b=LQJpyYwT4VnphNvDYjGwCLpROtfMlxpD9svoTajRfjD1eQjs3x17KWHl/dI6vTJOKuqq/farq6MRbKeOHSqUvxOVaMSQCMK2XnhI7vnlmZ3RlFXsockDhiBWH00Gp1cioC6cticx5pNZkmvV3mI+RqVJqVV2uUE4KLYBzY8T0aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405180; c=relaxed/simple;
	bh=pD00SK2GMg03vQvO70zaKA4+okhutEYwZ32abpO1nOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0Hz4ZCc+kf8qCfNMaLPkLRnNqiAAJUX4PS/d/rJkIt7Ukp7bknlTmF4Qen6LgRjrEHtl3qIfhnjJdfsL7N1bjoGIrZa5gl2H3ePd1RunID3NYjUzsubz+Enthk8gKB8YPqNV+GD5YawvCZDlX/fx1qiK6yeU6KWOu7bAlfOpBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=IoiLcyVR; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="IoiLcyVR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=8Y5FMgccEF6eGoXb7O49mgpl8XdIlZMq+raOLqUUEiw=; b=Io
	iLcyVRc7c93HQ4qEPYW3+P5zwSQYpewVY40jQx6W+rxTekKyheWNXGy9W3M/kL6kTt2TA58W/bjn1
	CfTFm8Yf33rs6JkIrZdn2Pq8uqOLVnxBPCYoUczF0WDVAgqm5orx4mNQB5oMl5cDJTVkWe/3rZCdn
	/zT1dQBO3aFVf0Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6A1m-0057GX-K3; Mon, 14 Sep 2026 18:59:34 +0200
Date: Mon, 14 Sep 2026 18:59:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Kees Cook <kees@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] leds: trigger: netdev: hold lock across
 sysfs_update_group() in device_name_store()
Message-ID: <794eb1c2-1fdb-4fd7-b4f2-649c66524218@lunn.ch>
References: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
 <20260914132356.807004-2-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914132356.807004-2-alexander.sverdlin@siemens.com>

On Mon, Sep 14, 2026 at 03:23:50PM +0200, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> device_name_store() calls sysfs_update_group() without holding
> trigger_data->lock. The is_visible callback reads
> trigger_data->supported_link_modes, and the sysfs group modification
> itself is not atomic. This races against netdev_trig_notify() in two
> ways:
> 
> 1) Concurrent sysfs_update_group() on the same group:
> 
>     CPU 0 (device_name_store)            CPU 1 (linkwatch workqueue)
>     -------------------------            ---------------------------
>     set_device_name():
>       rtnl_lock()
>       mutex_lock(trigger_data->lock)
>       [sets supported_link_modes]
>       mutex_unlock(trigger_data->lock)
>       rtnl_unlock()
> 
>     sysfs_update_group():
>       remove("link_10")
>                                          netdev_trig_notify():
>                                            mutex_lock(trigger_data->lock)
>                                            sysfs_update_group():
>                                              remove("link_10") [nop]
>                                              add("link_10") ← CREATED
>                                            mutex_unlock(trigger_data->lock)
>       add("link_10") <- EEXIST!
> 
> 2) The netdev_trig_link_speed_visible() reads supported_link_modes without
>    the lock, racing against get_device_state() called from
>    netdev_trig_notify() which modifies supported_link_modes (a multi-word
>    bitmap) under trigger_data->lock. This can cause
>    netdev_trig_link_speed_visible() to observe a partially-updated bitmap.
> 
> Fix by holding trigger_data->lock around the sysfs_update_group() call
> in device_name_store(), matching the locking context used by
> netdev_trig_notify().
> 
> Fixes: 06cdca014eca ("leds: trigger: netdev: Display only supported link speed attribute")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index 5b4e92c14dbb4..354d3b640fa53 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -336,8 +336,14 @@ static ssize_t device_name_store(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	/* Refresh link_speed visibility */
> +	/*
> +	 * Refresh link_speed visibility, serialized against netdev_trig_notify()
> +	 * which may concurrently call sysfs_update_group() on the same group
> +	 * while reading supported_link_modes via netdev_trig_link_speed_visible().
> +	 */
> +	mutex_lock(&trigger_data->lock);
>  	sysfs_update_group(&dev->kobj, &netdev_trig_link_speed_attrs_group);
> +	mutex_unlock(&trigger_data->lock);

If you look at all the other places where the lock it taken and
released, there are no comments about why the lock is used. I think
your verbose commit message is sufficient.


    Andrew

---
pw-bot: cr
