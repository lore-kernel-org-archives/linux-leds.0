Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D305B466B77;
	Mon, 14 Sep 2026 17:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405511; cv=none; b=jWsONQx1dbTHgWkVZX7Aro4Svz46Q3hXQ5jrZb0CdHZPBqSahyQwu/W1xiWL5yd5QQ911DeNt8DZ9MpESkktBiswg72RqxDgim0VUK+lPGCKYTmy+nv9RmuKoKGyhpDrKBtFKLXXNtqJv2hUY8LKbwCxD7nJY2scEwi7JorZgDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405511; c=relaxed/simple;
	bh=tN3269X1oMZsiMxNTQZ2LHaEBILneMhGKqoKilFZtUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbd78AOsw+LtbxWhvT0dB7CUSQUMtUlC8s/IC4za+vMzRhlFI3CvzdgtdIiLSkVvwnYNTLvfD5WluXVFQfXGvUJrQ05SGujsBt/5rHVRYF8Tww5TNQ0lsIQStA+Zxvou0OwBL4NYsFyQB1ajAoDHLh/lCPxAL3kxZlQUu29iMkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=MSVJ8MMs; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="MSVJ8MMs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NtyvM1gWRTv42DPmMW9AW6Ak4ICur0T18sy/bJuUgu4=; b=MSVJ8MMsRWGZlRPmOgXKVQ00ZE
	byr0aRaYAP9lSaIJ0V1zTuhd91b6Nc0tze4IowSPJTLYGKLD2HdXuFgROLEO88B67QRF+rPmgUVd9
	kapHRDuyG0DOzIcsGUwO8QR735TSMtesIl80D0A16t61HLmV2SD5Iv/3mcISSVJiR71I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6A77-0057IK-NT; Mon, 14 Sep 2026 19:05:05 +0200
Date: Mon, 14 Sep 2026 19:05:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Kees Cook <kees@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] leds: trigger: netdev: fix sysfs_update_group() vs
 led_trigger_set() races
Message-ID: <c0845cd6-8027-4813-b086-3890839ad595@lunn.ch>
References: <20260914132356.807004-1-alexander.sverdlin@siemens.com>
 <20260914132356.807004-3-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914132356.807004-3-alexander.sverdlin@siemens.com>

On Mon, Sep 14, 2026 at 03:23:51PM +0200, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> The netdev LED trigger calls sysfs_update_group() to refresh link_speed
> attribute visibility on NETDEV_CHANGE events and device_name writes.  The
> link_speed attribute group was listed in netdev_led_trigger.groups, so it
> was also created and destroyed by the LED core via device_add_groups() /
> device_remove_groups() in led_trigger_set(), which runs under
> trigger_lock(W).  These two owners of the same group share no lock and are
> not serialized against each other.
> 
> This was observed as a "cannot create duplicate filename" sysfs splat
> during boot when the netdev trigger is re-armed while PHY link-up events
> are being delivered concurrently:
> 
>   sysfs: cannot create duplicate filename '...green:lan/link_10'
>   ...
>   led_trigger_set
>   led_trigger_write
> 
> Race 1: activate() vs NETDEV_CHANGE (confirmed with reproducer)
> 
>     CPU 0 (led_trigger_set)              CPU 1 (linkwatch workqueue)
>     -----------------------              ---------------------------
>     [holds trigger_lock(W)]
>     activate():
>       register_netdevice_notifier()
>       <- returns
>                                          netdev_trig_notify(NETDEV_CHANGE):
>                                            sysfs_update_group()
>                                              creates "link_10"
>     device_add_groups()
>       creates "link_10" <- EEXIST!
> 
> Race 2: device_remove_groups() vs NETDEV_CHANGE
> 
>     CPU 0 (led_trigger_set)              CPU 1 (linkwatch workqueue)
>     -----------------------              ---------------------------
>     [holds trigger_lock(W)]
>     device_remove_groups()
>       removes "link_10"
>                                          netdev_trig_notify(NETDEV_CHANGE):
>                                            sysfs_update_group()
>                                              creates "link_10" <- ORPHANED
>     deactivate()
>       kfree(trigger_data) <- UAF via orphaned sysfs files
> 
> Serializing the trigger's sysfs_update_group() against the core under
> trigger_lock is not viable: NETDEV_CHANGE is delivered from linkwatch with
> rtnl_mutex held, whereas led_trigger_set() holds trigger_lock(W) and then
> takes rtnl_mutex via activate() -> set_device_name().  Acquiring
> trigger_lock from the NETDEV_CHANGE handler would invert that order and
> deadlock.
> 
> Fix it by construction instead: drop the link_speed group from
> netdev_led_trigger.groups and let the trigger own its lifecycle.  Create
> it with sysfs_create_group() in activate() (before registering the
> notifier) and remove it with sysfs_remove_group() in deactivate() (after
> unregistering the notifier).  The LED core therefore never touches this
> group, so sysfs_update_group() can no longer collide with
> device_add_groups() / device_remove_groups() -- eliminating both races
> above without taking trigger_lock, and hence without the rtnl_mutex
> inversion.
> 
> The only remaining concurrency -- device_name_store() and
> netdev_trig_notify() both calling sysfs_update_group() on the now
> trigger-owned group -- stays serialized by trigger_data->lock.  Creating
> the group before notifier registration and removing it after notifier
> unregistration guarantees that no sysfs_update_group() can run while the
> group is being created or destroyed.
> 
> Fixes: 06cdca014eca ("leds: trigger: netdev: Display only supported link speed attribute")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Please reduce the verbosity of the comments in the code.

I know locking is hard, but we don't need a verbose commit message and
verbose code.

	Andrew
