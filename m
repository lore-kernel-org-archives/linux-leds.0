Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7155648097B;
	Tue, 18 Aug 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072247; cv=none; b=hOlM3bD5FmJ7PBP3PYBjj9IINIDYEXH/o9apy30NRqJSX45ZLns7BtWrR20wkosv7Pijk1kWwEip+cEdXyqgSjngSWqV1SYibs+k4opsDSnbu9r2zSFzxfQSNBjLvQEa/x7Zvkmum8rVC72IOGyQoBpnKB3Un1ATuMSbUzRZKiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072247; c=relaxed/simple;
	bh=oKlXzeHrmmfEXvfqWtpFZnSaS7s//jpWxh6uOCrLJBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IifvkzL6az2zrDLVt5VmIYZIETrK2ftWlHx1x0MFbOhSssErBd3GYhhmMrT2OtW4ykMllqB28fOg+lqPvoJB0v/WRqRaJrZDE+SfUzcCFzEfqvCTTBk8led4mSOEXoAr/A+WFeMeIJsa3+vfp5F4a1vEi2WWQaQ8smS/V4+BxoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHRviqeg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHRviqeg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC1A1F00A3E;
	Tue, 18 Aug 2026 16:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787072242;
	bh=b6m1Px0EFnLG5TWRFpGkrpS1gmw3vzgZu83zI6OLSaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cHRviqegWfd6HAtAIWgkqCYCCOWkQl2g5wqx+o7OYQBGeCpueVhQZBCZni1Uhydcr
	 kaWNSlPGC6v0igX7gLfvRJrd7APg3xXoAl2aj95ndWsmof37mCPAteHYOhbsEfFkMh
	 ewwq/m5i8zCWcvXZ3+PFn/j/cvP8IBR97b5gUYO+aOyKbZ5ggx3nhiwFFQqSk97/sY
	 NbZVhm7Cm98mDsCMoO8INHHmEeFV5vvciTkPX5rZh8DEUa8rXPvD9eAk40jP268n6V
	 okDumU3Uk4/XwqHAQg4SK67nsAgFBoivBRTQqKLQf7PO3YkS2ZvTxZiVICTWgLAtNd
	 1muQOTZMCiHOw==
From: Jakub Kicinski <kuba@kernel.org>
To: ahmadexp@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	peda@lysator.liu.se,
	trannamatk@gmail.com,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v5 5/7] ptp: ocp: Add profile-driven I2C topology support
Date: Tue, 18 Aug 2026 09:57:20 -0700
Message-ID: <20260818165720.4008477-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f3570bdde36b104f5d0309f4f6514c76c44a5e92.1786747084.git.ahmadexp@gmail.com>
References: <f3570bdde36b104f5d0309f4f6514c76c44a5e92.1786747084.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
ptp: ocp: Add profile-driven I2C topology support

This adds software-node based construction of a PCA9546 mux topology plus
per-device i2c and platform bus notifiers and a delayed work item that
waits for the root adapter and instantiates the selected profile.  The
platform bus unbind notifier is meant to stop the work before the i2c
controller driver deletes its root adapter.

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 31a4c9dfe391c..444b26a5e2a9f 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c

[ ... ]

> @@ -2059,6 +2141,465 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp, unsigned int fields)
>  	return ret;
>  }
>  

[ ... ]

> +static int
> +ptp_ocp_i2c_populate_channel(struct ptp_ocp *bp, unsigned int channel)
> +{
> +	struct ptp_ocp_i2c_topology *topology = bp->i2c_topology;
> +	const struct ptp_ocp_i2c_profile *profile = topology->profile;
> +	const struct software_node *node;
> +	struct fwnode_handle *fwnode;
> +	struct i2c_adapter *adapter;
> +	unsigned int i;
> +	int err, ret = 0;
> +
> +	fwnode = software_node_fwnode(&topology->channel_nodes[channel]);
> +	adapter = i2c_get_adapter_by_fwnode(fwnode);
> +	if (!adapter)
> +		return -EAGAIN;
> +
> +	for (i = 0; i < profile->sensor_count; i++) {
> +		const struct ptp_ocp_i2c_device *sensor;
> +
> +		sensor = &profile->sensors[i];
> +		if (sensor->channel != channel)
> +			continue;
> +
> +		node = &topology->sensor_nodes[i];
> +		err = ptp_ocp_i2c_add_device(adapter, node, sensor->type,
> +					     sensor->address);
> +		if (err && !ret)
> +			ret = err;
> +	}
> +
> +	if (channel == profile->led_mux_channel) {
> +		err = ptp_ocp_i2c_add_device(adapter, &topology->led_node,
> +					     "is32fl3207",
> +					     profile->led_address);
> +		if (err && !ret)
> +			ret = err;
> +	}
> +
> +	i2c_put_adapter(adapter);
> +	return ret;
> +}

[ ... ]

> +static void
> +ptp_ocp_i2c_kick(struct ptp_ocp *bp)
> +{
> +	if (!ptp_ocp_i2c_supported(bp))
> +		return;
> +	if (!READ_ONCE(bp->i2c_resources_ready))
> +		return;
> +	if (!READ_ONCE(bp->i2c_root_present))
> +		return;
> +
> +	mod_delayed_work(system_wq, &bp->i2c_work, 1);
> +}

[Severity: High]
The commit message says the platform bus unbind notifier "prevents a new
client from being created after i2c_del_adapter() has swept the adapter
children".  Does that barrier cover the channel adapters too?

ptp_ocp_i2c_populate_channel() creates clients on the mux channel
adapters, and those adapters are deleted by the mux client's own remove
path, which never touches bp->i2c_root_present, bp->i2c_work or
bp->i2c_topology_lock:

pca954x_remove()
  pca954x_cleanup()
    i2c_mux_del_adapters()
      i2c_del_adapter()      /* channel adapter */

In i2c_del_adapter() the child sweep happens before the unbounded wait:

drivers/i2c/i2c-core-base.c:i2c_del_adapter() {
	...
	i2c_deregister_clients(adap);
	...
	init_completion(&adap->dev_released);
	device_unregister(&adap->dev);
	wait_for_completion(&adap->dev_released);
	...
}

So if the work is between i2c_get_adapter_by_fwnode() and
i2c_new_client_device() while the sweep runs, can the added client keep
the reference that i2c_adapter_dev_release() is waiting for, leaving the
unbind thread stuck in wait_for_completion() forever?

The i2c bus notifier added here only handles ADD_DEVICE, DEL_DEVICE and
BOUND_DRIVER.  BUS_NOTIFY_DEL_DEVICE for an adapter is emitted from
device_del(), which runs after i2c_deregister_clients(), so can it act as
a barrier at all?  Would handling BUS_NOTIFY_UNBIND_DRIVER for the mux
client (and taking bp->i2c_topology_lock there) close that window?

Two related windows look open as well:

The ADD_DEVICE branch calls ptp_ocp_i2c_kick(bp) from inside device_add()
of the root adapter, i.e. from the middle of i2c_register_adapter().  With
a one jiffy delay, can the work call i2c_new_client_device() on that
adapter before registration finished?  If i2c_setup_smbus_alert() then
fails, i2c_register_adapter() takes its error path which also does
put_device() plus wait_for_completion(&adap->dev_released), so a
straggling child would block it the same way.

ptp_ocp_i2c_ctrl_notifier_call() reacts only to BUS_NOTIFY_UNBIND_DRIVER.
When the i2c controller's probe fails, the driver core tears the adapter
down and emits BUS_NOTIFY_DRIVER_NOT_BOUND instead.  Should that action be
handled too?

Since ptp_ocp_i2c_retry() re-arms the work every 30 seconds indefinitely
on persistent failure, this coincidence window keeps reopening for the
lifetime of the device.

[ ... ]

> @@ -4922,8 +5465,19 @@ ptp_ocp_detach_sysfs(struct ptp_ocp *bp)
>  static void
>  ptp_ocp_detach(struct ptp_ocp *bp)
>  {
> +	struct platform_device *i2c_ctrl;
>  	int i;
>  
> +	if (bp->i2c_ctrl_notifier_registered) {
> +		bus_unregister_notifier(&platform_bus_type,
> +					&bp->i2c_ctrl_notifier);
> +		bp->i2c_ctrl_notifier_registered = false;
> +	}
> +	if (bp->i2c_notifier_registered) {
> +		bus_unregister_notifier(&i2c_bus_type, &bp->i2c_notifier);
> +		bp->i2c_notifier_registered = false;
> +	}
> +	ptp_ocp_i2c_unregister(bp);

[Severity: Medium]
Is the ordering here inverted?  The platform bus notifier is dropped
first, and the work is only quiesced later inside
ptp_ocp_i2c_unregister(), which clears i2c_root_present and calls
disable_delayed_work_sync().

Between those two points bp->i2c_resources_ready and
bp->i2c_root_present are still true and bp->i2c_work is still armed:

ptp_ocp_detach()
  bus_unregister_notifier(&platform_bus_type, &bp->i2c_ctrl_notifier);
  /* preempted here */
  ...
  ptp_ocp_i2c_unregister(bp);   /* only now is the work stopped */

A concurrent unbind of the child i2c controller takes
device_lock(&i2c_ctrl->dev), not the PCI device lock held by the detach
path, so can it reach i2c_del_adapter() in that window without
ptp_ocp_i2c_ctrl_notifier_call() ever running, which is the callback the
commit message describes as providing the required ordering?

Would calling ptp_ocp_i2c_unregister(bp) before dropping the notifiers
give the intended sequence?

[ ... ]

> +static int
> +ptp_ocp_i2c_ctrl_notifier_call(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{
> +	struct ptp_ocp *bp = container_of(nb, struct ptp_ocp,
> +					  i2c_ctrl_notifier);
> +	struct platform_device *i2c_ctrl = READ_ONCE(bp->i2c_ctrl);
> +	struct device *dev = data;
> +
> +	if (action != BUS_NOTIFY_UNBIND_DRIVER || !i2c_ctrl ||
> +	    dev != &i2c_ctrl->dev)
> +		return 0;
> +
> +	/*
> +	 * Stop topology creation before the controller driver's remove path
> +	 * deletes its root adapter. Otherwise a newly-created mux client can
> +	 * pin that adapter after i2c_del_adapter() has swept its children.
> +	 */
> +	WRITE_ONCE(bp->i2c_root_present, false);
> +	cancel_delayed_work_sync(&bp->i2c_work);
> +	mutex_lock(&bp->i2c_topology_lock);
> +	ptp_ocp_i2c_remove_mux(bp);
> +	bp->i2c_retry_count = 0;
> +	mutex_unlock(&bp->i2c_topology_lock);
> +	sysfs_remove_link(&bp->dev.kobj, "i2c");
> +
> +	return 0;
> +}

[ ... ]
