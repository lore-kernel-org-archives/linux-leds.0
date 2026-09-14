Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BAB47F3BC
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396042; cv=none; b=UWQEvdZfn51bUUuxhwKXjFmhi2HEZ3J9xZ2fMYeEx+P4Mk8OYPEWBqZo9NieIHCAjJR43i1n/+zi3mkfEbuvy9vlAW49CkYac8mIU1fnqc9B5au9f7ziwQBKPjfyZ7pb8tI79RxVEMsAYXD2J2ImIA1ZTGXGtgvEjJyS2aH9alE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396042; c=relaxed/simple;
	bh=Omck4OvE51FLsO3qPONSPRKFS+6p5iR3M8HHX8gkLIs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RirvvCyNmyuri9Z5+bUeEWY/5st5PHdy+7phapeQMjaeJV2X2leHuVxn2kZycbq0vgIWYLc5DQII8y8El1XLYfW22sZ6Np4l/hH4xCqmN3rcIU5eLdT02G7VqoLojG1YjbTC0Bt6TfoK/elvzjRgZJMJKCedf+9MVECSNOytNkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMjWl7hZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMjWl7hZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBD51F00893;
	Mon, 14 Sep 2026 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789396038;
	bh=BlI1Kx8YoP3CkyCM6o1FCl/agjfcSpIW6SQ6wmg0sCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fMjWl7hZa/V9glAXvAbqD76FxKYSjeF4at9MCdxh1VH82DtLvBAr8paYkeQ77hTEN
	 xSHVMXp/ufbkO8nMJpkXUugAGsbC9HGIdVXCoaLozjoEBuc/ounvxUkSsPVQDxWtka
	 +4igfXn6I5MRF66re7HAQI68kziDgnTAp9cbJGTRGHcc2p3VX/TVCsUbvUl0MZMbMG
	 kK8EJQ805fXCud2ElD61xwCqtyvrhmKd3VE5Yqi/V/PMn3+pHZ3Lsde6a3iYA7hlE+
	 7A+05Qofy6lzLC2LSYAM8w7omc65HUOTY0kgy4oHKvuUMFSQCYJuemzcjGNdaG3OLY
	 0Dmu4h7b6zjMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: ncp5623: release multi-led fwnode on remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260914140742.1743052-1-lgs201920130244@gmail.com>
References: <20260914140742.1743052-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:27:18 +0000
Message-Id: <20260914142718.9EBD51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Commit message description is not capitalized.

Pre-existing issues:
- [Critical] Missing bounds check when populating the subled_info array all=
ows a heap buffer overflow if child nodes are added dynamically.
- [High] The driver calls mutex_destroy() during shutdown while the LED dev=
ice remains fully registered, leading to access of a destroyed lock upon co=
ncurrent sysfs or trigger activity.
- [High] State modifications in ncp5623_remove() meant to prepare for LED t=
eardown are performed locklessly or with premature unlock, leaving a race w=
indow that can cause unregistration to fail.
--

commit 800df95225d3c84b4eef4ec24709d401a0efa76c
Author: Guangshuo Li <lgs201920130244@gmail.com>

leds: ncp5623: release multi-led fwnode on remove

This commit addresses a firmware node leak in the ncp5623 driver during rem=
oval.
It saves the multi-led firmware node pointer before unregistering the LED d=
evice
and puts the reference afterwards, ensuring it is properly released.

> leds: ncp5623: release multi-led fwnode on remove

[Severity: Low]
This isn't a bug, but does the commit message violate the subsystem guideli=
ne
for capitalization? The word "release" is lowercase, but the description af=
ter
the subsystem prefix should be capitalized.

> diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-ncp5=
623.c
> index f2528f06507dd..f96f15b7e9a1b 100644
> --- a/drivers/leds/rgb/leds-ncp5623.c
> +++ b/drivers/leds/rgb/leds-ncp5623.c
> @@ -227,6 +227,8 @@ static int ncp5623_probe(struct i2c_client *client)
>  static void ncp5623_remove(struct i2c_client *client)
>  {
>  	struct ncp5623 *ncp =3D i2c_get_clientdata(client);
> +	struct fwnode_handle *mc_node =3D
> +		dev_fwnode(ncp->mc_dev.led_cdev.dev);
> =20
>  	mutex_lock(&ncp->lock);
>  	ncp->delay =3D 0;
>  	mutex_unlock(&ncp->lock);
> =20
>  	ncp5623_write(client, NCP5623_DIMMING_TIME_REG, 0);

[Severity: High]
This is a pre-existing issue, but does this unlock open a race window that =
can
cause unregistration to fail?

In ncp5623_remove(), the lock is temporarily acquired to set ncp->delay =3D=
 0,
but it is released before the unprotected I2C write. If a concurrent sysfs
write to the "pattern" trigger occurs during this window, it will call
ncp5623_pattern_set(), acquire the lock, start a new pattern, and set
ncp->delay to a future time.

When led_classdev_multicolor_unregister() subsequently attempts to turn off=
 the
LED, would ncp5623_brightness_set() return -EBUSY due to the non-zero delay
and abort the turn-off sequence?

drivers/leds/rgb/leds-ncp5623.c:ncp5623_brightness_set() {
    ...
	if (ncp->delay && time_is_after_jiffies(ncp->delay))
		return -EBUSY;
    ...
}

>  	led_classdev_multicolor_unregister(&ncp->mc_dev);
> +	fwnode_handle_put(mc_node);
>  	mutex_destroy(&ncp->lock);
>  }

[Severity: Critical]
This is a pre-existing issue, but can this code overflow subled_info[]?

drivers/leds/rgb/leds-ncp5623.c:ncp5623_probe() {
    ...
	num_subleds =3D fwnode_get_child_node_count(mc_node);

	subled_info =3D devm_kcalloc(dev, num_subleds, sizeof(*subled_info), GFP_K=
ERNEL);
    ...
	fwnode_for_each_child_node(mc_node, led_node) {
        ...
		subled_info[ncp->mc_dev.num_colors++].color_index =3D color_index;
	}
    ...
}

The array is allocated with a fixed capacity based on the initial count.
If a child node is added concurrently (e.g., via a DT overlay) during the
iteration, could the loop execute more times than the allocated capacity
and write sequentially out of bounds on the heap?

[Severity: High]
This is a pre-existing issue, but can this sequence lead to accessing a
destroyed mutex?

drivers/leds/rgb/leds-ncp5623.c:ncp5623_shutdown() {
    ...
	if (!(ncp->mc_dev.led_cdev.flags & LED_RETAIN_AT_SHUTDOWN))
		ncp5623_write(client, NCP5623_SHUTDOWN_REG, 0);

	mutex_destroy(&ncp->lock);
}

The mutex is destroyed during shutdown while the LED device remains fully
registered. If a kernel timer from the active "pattern" trigger fires or
a pending sysfs access continues, functions like ncp5623_brightness_set()
will attempt to access the destroyed mutex:

drivers/leds/rgb/leds-ncp5623.c:ncp5623_brightness_set() {
    ...
	guard(mutex)(&ncp->lock);
    ...
}

Would this cause a kernel panic if CONFIG_DEBUG_MUTEXES is enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914140742.1743=
052-1-lgs201920130244@gmail.com?part=3D1
