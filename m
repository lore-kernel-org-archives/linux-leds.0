Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BA6524B14;
	Thu, 15 Oct 2026 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080348; cv=none; b=PuKYx5xo7VVTaEKUjvyycIGnaB3+F6SW4GIne+iSwUHG+QQOtwbjghw/QtBqwMSmoEX5NEURe9WABJ7MYAyX7DoHXepa9EA+1sl5TidA4ZzGpqfvT6DDVvGbzBf6RCHLU0XAfcBzeuQi2/0XtK2+ctP0cvsTMe0n4VzO4nYhQDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080348; c=relaxed/simple;
	bh=pii2WeTzEcDB5GIk4OSjp/CmMbtefKP6NirjtPvEHpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIQQrnugqyjdrHm6NnkINz77AjZZMtrvlxRByhKRZSRxyuiAxyER2+wLjrAfdWU7cTwK1OcI4+WnLM2WvWP7KwtyV2LAJwpqrNAmn13o+qp36pSDfYRtjghCUZk1hWP86shXqArMDbrnlcuA4rQ0SuKrf+auSvzlgMx9jcrpDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLhnR2Af; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLhnR2Af"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1C81F000C4;
	Thu, 15 Oct 2026 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080337;
	bh=XUlxJX0sV23/Ido8B7tNQRar/Q/7R1Ur3G2zGashXqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FLhnR2AfZhflczK40jQhPPw29WpdvtrvOSbc2el5nLQsqGswIdF0OQR5RSK3UGWCa
	 LrLsg3GWHTRRUto6FyZ+z5Axha2LFZ9jHPuQLbaC154MKU74c9JFW+Q10JyZUxsj5e
	 bNlgWK7sEstlwoiJRHeH7Em03FUDGSqyevJ08+gnd25NtGPBCSCXACrDPYJawS5KWf
	 B+HSotdUeFoziHM5Ld3PGwqZoFOzIs316GLxc8vdYPU+n1AeWd+1/X6mBi8djfRjQg
	 N5DHTAJ2TneiIHankNL8494wzf5BQ/SelAgsZYERR/Mnh3MVk3+WmG4pJ+QV784bzH
	 ml0bxzwAtLI9g==
Date: Thu, 15 Oct 2026 17:05:33 +0100
From: Lee Jones <lee@kernel.org>
To: Marcus Flyckt <marcus.flyckt@kvaser.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jimmy Assarsson <extja@kvaser.com>
Subject: Re: [PATCH v2] leds: trigger: netdev: Support devices in other
 network namespaces
Message-ID: <179198415957.839288.9912294144956773410@kernel.org>
References: <20261006064603.1081262-1-marcus.flyckt@kvaser.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006064603.1081262-1-marcus.flyckt@kvaser.com>
X-AI-Review-Draft: <20261006064603.1081262-1-marcus.flyckt@kvaser.com>

On Tue, 06 Oct 2026, Marcus Flyckt wrote:

> The netdev LED trigger currently cannot resolve a network device that
> has been moved into another network namespace.
>
> For example:
>
>   ip link add vm1 type veth peer vm2
>   tools/leds/uledmon test:green:netdev &
>
>   echo netdev > /sys/class/leds/test:green:netdev/trigger
>   echo 1 > /sys/class/leds/test:green:netdev/link
>
>   ip netns add ledns
>   ip link set vm2 netns ledns
>   ip netns exec ledns \
>           sh -c 'echo vm2 > /sys/class/leds/test:green:netdev/device_name'
>
> Before this change, the lookup fails because it is always performed in
> the initial network namespace.
>
> Resolve the device name in the network namespace of the task writing
> device_name. Once resolved, follow the device through renames and
> network namespace moves.
>
> With the example above, bringing both ends up makes the LED reflect the
> link state of vm2:
>
>   ip link set vm1 up
>   ip netns exec ledns ip link set vm2 up
>
> A possibly confusing aspect of this change is that the feature uses the
> global LED sysfs interface, which is not network namespace aware. The
> namespace is therefore effectively selected by the task that last wrote
> device_name.
>
> Signed-off-by: Marcus Flyckt <marcus.flyckt@kvaser.com>
> Reviewed-by: Jimmy Assarsson <extja@kvaser.com>
> Tested-by: Jimmy Assarsson <extja@kvaser.com>
> ---
> Changes in v2:
> - Instead of taking a reference to a network namespace, use net_cookie
> - Include used headers explicitly
> - Use C-style comments
>
>  drivers/leds/trigger/ledtrig-netdev.c | 50 +++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index 5b0132484594..16357d45b3cd 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -22,10 +22,13 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
> +#include <linux/nsproxy.h>
>  #include <linux/mutex.h>
>  #include <linux/phy.h>
>  #include <linux/rtnetlink.h>
> +#include <linux/string.h>
>  #include <linux/timer.h>
> +#include <net/net_namespace.h>
>  #include <net/netdev_lock.h>
>  #include "../leds.h"
>
> @@ -64,6 +67,8 @@ struct led_netdev_data {
>  	struct led_classdev *led_cdev;
>  	struct net_device *net_dev;
>
> +	/* net namespace cookie associated with device_name */
> +	u64 net_cookie;
>  	char device_name[IFNAMSIZ];
>  	atomic_t interval;
>  	unsigned int last_activity;
> @@ -274,7 +279,7 @@ static ssize_t device_name_show(struct device *dev,
>  }
>
>  static int set_device_name(struct led_netdev_data *trigger_data,
> -			   const char *name, size_t size)
> +			   struct net *net, const char *name, size_t size)
>  {
>  	struct net_device *new_dev = NULL;
>  	char device_name[IFNAMSIZ];
> @@ -294,9 +299,12 @@ static int set_device_name(struct led_netdev_data *trigger_data,
>  	 */
>  	rtnl_lock();
>  	if (device_name[0]) {
> -		new_dev = dev_get_by_name(&init_net, device_name);
> +		trigger_data->net_cookie = net->net_cookie;
> +		new_dev = dev_get_by_name(net, device_name);
>  		if (new_dev)
>  			netdev_lock_ops(new_dev);
> +	} else {
> +		trigger_data->net_cookie = 0;
>  	}

Should this be done under a lock?

>  	mutex_lock(&trigger_data->lock);
>
> @@ -331,7 +339,8 @@ static ssize_t device_name_store(struct device *dev,
>  	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
>  	int ret;
>
> -	ret = set_device_name(trigger_data, buf, size);
> +	ret = set_device_name(trigger_data, current->nsproxy->net_ns, buf,
> +			      size);
>
>  	if (ret < 0)
>  		return ret;
> @@ -616,15 +625,24 @@ static int netdev_trig_notify(struct notifier_block *nb,
>  		container_of(nb, struct led_netdev_data, notifier);
>  	struct led_classdev *led_cdev = trigger_data->led_cdev;
>
> -	if (evt != NETDEV_UP && evt != NETDEV_DOWN && evt != NETDEV_CHANGE
> -	    && evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER
> -	    && evt != NETDEV_CHANGENAME)
> +	if (evt != NETDEV_UP && evt != NETDEV_DOWN && evt != NETDEV_CHANGE &&
> +	    evt != NETDEV_REGISTER && evt != NETDEV_UNREGISTER &&
> +	    evt != NETDEV_CHANGENAME)
>  		return NOTIFY_DONE;
>
> -	if (!(dev == trigger_data->net_dev ||
> -	      (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name)) ||
> -	      (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name))))
> -		return NOTIFY_DONE;
> +	if (trigger_data->net_dev) {
> +		if (dev != trigger_data->net_dev)
> +			return NOTIFY_DONE;
> +		/* Ignore namespace transfers */
> +		if (evt == NETDEV_UNREGISTER &&
> +		    dev->reg_state != NETREG_UNREGISTERING)
> +			return NOTIFY_DONE;
> +	} else {
> +		if ((evt != NETDEV_REGISTER && evt != NETDEV_CHANGENAME) ||
> +		    dev_net(dev)->net_cookie != trigger_data->net_cookie ||
> +		    strcmp(dev->name, trigger_data->device_name) != 0)
> +			return NOTIFY_DONE;
> +	}
>
>  	cancel_delayed_work_sync(&trigger_data->work);
>
> @@ -636,9 +654,12 @@ static int netdev_trig_notify(struct notifier_block *nb,
>  	switch (evt) {
>  	case NETDEV_CHANGENAME:
>  	case NETDEV_REGISTER:
> -		dev_put(trigger_data->net_dev);
> -		dev_hold(dev);
> -		trigger_data->net_dev = dev;
> +		if (!trigger_data->net_dev) {
> +			dev_hold(dev);
> +			trigger_data->net_dev = dev;
> +		}
> +		trigger_data->net_cookie = dev_net(dev)->net_cookie;
> +		strscpy(trigger_data->device_name, dev->name, IFNAMSIZ);
>  		if (evt == NETDEV_CHANGENAME)
>  			get_device_state(trigger_data);
>  		break;
> @@ -765,7 +786,8 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
>  			const char *name = dev_name(dev);
>
>  			trigger_data->hw_control = true;
> -			set_device_name(trigger_data, name, strlen(name));
> +			set_device_name(trigger_data, dev_net(to_net_dev(dev)),
> +					name, strlen(name));
>
>  			rc = led_cdev->hw_control_get(led_cdev, &mode);
>  			if (!rc)
> -- 
> 2.43.0
>

-- 
Lee Jones
