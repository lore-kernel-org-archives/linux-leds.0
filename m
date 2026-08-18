Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7247F783;
	Tue, 18 Aug 2026 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072242; cv=none; b=C9o/ed2FcG+8mqo5OuT8pUss/cJDFQZRk8Q+yfIRV4+Uy3sQekAHkt0A41gDb2dCmaUeNB9jRtbsTXtsgCVeyfAeY1/fRrj3A76G+QJG0WUfqLVdqb0hAK0eU1Njw7rmFUZXjhxUbktpAJMQoAOXAaMfqjJsWVKSZgjzUZewpdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072242; c=relaxed/simple;
	bh=svZyUctIoOIg1QcrZ/s96xW9GPjTdiqwHf4SUw42ly8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/RXmhPJ17gAZFyGzRCFaQL3/8WIHiWM7p/7ZFD01HKlJ6SVdLOezVPjIghlg3yjLnSCS9016EyIahxhwzzD8Xz1WE1v70akfSDkrg/gPm398CJ5aLuH0o/mXbTfBZzyzbFsgoIhyGBQMHuh4IwHWyiIVLMqN3TYxPnHa8DnktI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDKK1pzk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDKK1pzk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7616B1F00A3D;
	Tue, 18 Aug 2026 16:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787072237;
	bh=omnQHGT9zzXPdJCCD8VhV9crlI+LaUc1U4BjvWKsfwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iDKK1pzk3ftEILQe5NNe6MT86nk5HIWg31Fg3CzeUnYE1d+wm0KZbhNWtW08xBMhp
	 FVsa2ydd9pg3jP1lvRe6QjTvYILArJ3IHGIGnZSz8XBKrivIa/24+WX6jT0eOT/lbe
	 RICGK5QjgN+DN465beRfvjRNb9IoYbSNcNE0gZ/IwatOsUm8Yft+p3EQVIEsI+BD1P
	 s9jaXvuDUX8X47bW3hxteWxUiCpPDDbmiKwkWw6d3nAOb9bTHVY6kxfFgtgBvo+nKg
	 g8Q9m+4THx8bpmvybVngsuVxM3UMqVfnZBdHIDaZe9Kdl9QLdJ5s2cLlGMe81xKlZ0
	 rjp+YODDrh3PQ==
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
Subject: Re: [PATCH net-next v5 3/7] i2c: mux: Propagate software nodes to channel adapters
Date: Tue, 18 Aug 2026 09:57:15 -0700
Message-ID: <20260818165715.4008405-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <a758b93f394ecfd4dfa65517782530d4a8c45e39.1786747084.git.ahmadexp@gmail.com>
References: <a758b93f394ecfd4dfa65517782530d4a8c45e39.1786747084.git.ahmadexp@gmail.com>
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
i2c: mux: Propagate software nodes to channel adapters

This attaches the matching software-node child of the mux device to each
i2c-mux channel adapter, tracks whether the mux owns that attachment for
cleanup, and extends the I2C firmware-node adapter lookup so it also
matches a device's secondary fwnode.

> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 3ec04787a7373..f39575ee02444 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1876,12 +1876,22 @@ int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter)
>  }
>  EXPORT_SYMBOL_GPL(devm_i2c_add_adapter);
>  
> -static int i2c_dev_or_parent_fwnode_match(struct device *dev, const void *data)
> +static bool i2c_device_match_fwnode(struct device *dev, const void *data)
>  {
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +
>  	if (device_match_fwnode(dev, data))
> +		return true;
> +
> +	return !IS_ERR_OR_NULL(fwnode) && fwnode->secondary == data;
> +}

[Severity: Medium]
Is the new fwnode->secondary dereference safe here?  The old code only used
device_match_fwnode(), which compares pointers and never dereferences the
fwnode.

i2c_dev_or_parent_fwnode_match() runs as a bus_find_device() match callback
from i2c_find_adapter_by_fwnode()/i2c_get_adapter_by_fwnode(), so it is
invoked for every device on i2c_bus_type, including clients, with no
device_lock held and nothing pinning dev->fwnode.

Meanwhile i2c_unregister_device() detaches and frees the software node
while the client is still in the bus klist:

drivers/i2c/i2c-core-base.c:i2c_unregister_device() {
	...
	device_remove_software_node(&client->dev);
	device_unregister(&client->dev);
}

For a client created with info->swnode and no primary fwnode,
dev->fwnode == &swnode->fwnode, and device_remove_software_node() drops the
last reference:

drivers/base/swnode.c:device_remove_software_node() {
	...
	set_secondary_fwnode(dev, NULL);
	swnode_put(swnode);
}

Can a lookup then observe fwnode = dev_fwnode(dev) before the free and read
fwnode->secondary after it?  The writers are unsynchronized too:

drivers/base/core.c:set_secondary_fwnode() {
	if (fwnode_is_primary(dev->fwnode))
		dev->fwnode->secondary = fwnode;
	else
		dev->fwnode = fwnode;
}

There is no lock common to the reader and the writer and no WRITE_ONCE, so
this also looks like a plain data race that could make the lookup return an
adapter whose software node has already been detached.

Also, does the extra dereference help in that case at all?  A software node
installed in the primary slot always has secondary == ERR_PTR(-ENODEV), so
it can never match through fwnode->secondary; only the window seems new.

> @@ -1891,8 +1901,9 @@ static int i2c_dev_or_parent_fwnode_match(struct device *dev, const void *data)

[ ... ]

> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 681a201c239ba..3bca123907b3d 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c

[ ... ]

> @@ -364,6 +417,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>  
>  		priv->adap.dev.of_node = child;
>  		of_node_put(mux_node);
> +	} else {
> +		channel_node = i2c_mux_get_channel_swnode(muxc, chan_id);
>  	}
>  
>  	/*

[ ... ]

> @@ -408,6 +473,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>  	return 0;
>  
>  err_free_priv:
> +	if (priv->swnode)
> +		device_remove_software_node(&priv->adap.dev);
>  	kfree(priv);
>  	return ret;
>  }

[Severity: Medium]
This isn't a bug introduced by this patch, but since err_free_priv is being
extended here, should it also drop the DT channel node reference?

In the DT branch of i2c_mux_add_adapter(), priv->adap.dev.of_node holds a
reference obtained either from the for_each_child_of_node() early break, or
from of_node_get(dev_node)/of_node_get(mux_node).  When
i2c_add_adapter()/i2c_add_numbered_adapter() fails, control reaches
err_free_priv, which only does kfree(priv).

That the mux owns that reference is visible in the success-path teardown,
which saves np = adap->dev.of_node and puts it after i2c_del_adapter():

> @@ -429,7 +496,13 @@ void i2c_mux_del_adapters(struct i2c_mux_core *muxc)
>  		sysfs_remove_link(&priv->adap.dev.kobj, "mux_device");
> +		/*
> +		 * Keep the software node through child removal. The adapter
> +		 * device is cleared on deletion, so release the software-node
> +		 * attachment reference via the saved handle afterwards.
> +		 */
>  		i2c_del_adapter(adap);
> +		fwnode_handle_put(priv->swnode);
>  		of_node_put(np);
>  		kfree(priv);
>  	}

Neither i2c_register_adapter()'s error labels nor the driver core drops a
device's of_node reference when device_add() fails, so does the failure path
leak that struct device_node reference?  Would adding
of_node_put(priv->adap.dev.of_node) at err_free_priv be appropriate while
this label is being touched?
