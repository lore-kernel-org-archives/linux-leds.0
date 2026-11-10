Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301635;
	b=Ar9pw+SxiCx7TE2rEsPoKHbLNxLCLsJgfHUxK4Lzpxkit5NqGTA0J7S31pAFvK6cBHnl
	 gatQoAxbNNPesqFDQ/zjUM4e7d316NSVyC8/6Z95PZJa4oj4ECYTBTS+a2yRBgz/3ROLD
	 iJCMDDiZLdr/CSkd584BK8qo412Nnw0Iulwl2AuldraH5cTPcc2tgtIn2bw+esMRIKN9K
	 oqSE0vUdIaeIHI6mXPWzOYSHUAzQjY99tH+ytW0wB5I1+lwwXzDRqSatMfVtxYDp7c/6w
	 HmAVyGGoEx0RRuGjmpW5RY+AL1dcIwnPg6FoDWspQp+Lr7DXk91dLNx3w3xOxAYqrnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301635;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=OD0A0N5jCafTuhqB9U387BTo/UUFlEn4+AHiFajNJbc=;
	b=P3mYBETiDKg5ZdSRYAyr/0F2pP4N+N2cCLgoqe8C8NDGqB++qjwVafXXoOW0k71l6bxv
	 QsSbWY8iPZpmeVfpOUEdTEM4XhjjvDXmjO1G9JGVKmTuVnXLO5FzczQjyMmS8RYikN19K
	 v4adT2gVmks8VVzk6sG/0a8lEUoIw/VIRH3jUQTl6GaxTgHwBp8G86vCIizQHsXeNFm5Y
	 FB+0e+EeAT4cts4F1YPifJyQkY6MxWz/iWlJ58VxB/R8znLiNNVmOLunhCKq9dDRAmC0s
	 8LIcWLtEATltA3fZ/p7TpFtClsIEwQa3yFxN5kUL5tUeHB2RpwoUbJQK7k1Kjx0lwnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EMe5Ued2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B841606A31C;
	Tue, 10 Nov 2026 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EMe5Ued2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4716F1F0089F;
	Tue, 10 Nov 2026 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794301635;
	bh=OD0A0N5jCafTuhqB9U387BTo/UUFlEn4+AHiFajNJbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EMe5Ued2ovNBDBFFJbHDxkdMQTtfxPaa/IcyHmBQZndOkHtQf56/hjPEe5d1pZD6U
	 HvmQCaG47iKvJgBtUon4vIu7nAujZR+mdoe9KSz5X6yXMQds+KhlvOIaQdfnbm653+
	 tzIdEy6J+Y+h2ZcCWjh25WM/W5oLOzXjWwX9ZY9A0d8KGcpl7eS9SAQB8VnU/eKTD4
	 7m6pUBzLqFesDewE6PnFKgin7AZc0iLWI7caLyT1CwKhyCul+iREfEQrV26lYBo/fj
	 OrXvl+wJ34PDFgqnoS78e+E1Eq3/ffwjKAZov3gTUTftGTNI4uXhlucI53iRjDUbhQ
	 2pnZ+gLHIc1bg==
Date: Tue, 10 Nov 2026 09:07:11 +0000
From: Lee Jones <lee@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org
Subject: Re: [PATCH 08/10] leds: class: Split led_classdev_register_ext()
Message-ID: <20261110090711.GC6323@joneslee-macbookpro.roam.internal>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-9-W_Armin@gmx.de>
 <sashiko-outbox-176189@kernel.org>
 <bc1371ba-1355-4e45-be2c-d3e806c485a9@gmx.de>
 <4d9e01c3-acaf-4f5c-bbc1-fc4c78582571@gmx.de>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d9e01c3-acaf-4f5c-bbc1-fc4c78582571@gmx.de>

On Sat, 07 Nov 2026, Armin Wolf wrote:

> Am 18.10.26 um 19:14 schrieb Armin Wolf:
> 
> > Am 18.10.26 um 16:15 schrieb sashiko-bot@kernel.org:
> > 
> > > Thank you for your contribution! Sashiko AI review found 2 potential
> > > issue(s) to consider:
> > > - [High] leds: dangling led_cdev->dev pointer on error in
> > > led_classdev_init()
> > > - [High] leds: premature device_set_node() in led_classdev_init()
> > > breaks fw_devlink
> > > -- 
> > > 
> > > commit 7efb333e9420ea13e705d9a114384e841e92d2b2
> > > Author: Armin Wolf <W_Armin@gmx.de>
> > > 
> > > leds: class: Split led_classdev_register_ext()
> > > 
> > > This commit splits led_classdev_register_ext() into
> > > led_classdev_init() and
> > > led_classdev_add() so that LED class devices can be initialized before
> > > being added to the subsystem.
> > > 
> > > > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > > > index 77a0fce039528..ace417a2388e0 100644
> > > > --- a/drivers/leds/led-class.c
> > > > +++ b/drivers/leds/led-class.c
> > > [ ... ]
> > > 
> > > > @@ -539,23 +550,54 @@ int led_classdev_register_ext(struct
> > > > device *parent,
> > > >       if (!led_cdev->max_brightness)
> > > >           led_cdev->max_brightness = LED_FULL;
> > > >   -    mutex_lock(&led_cdev->led_access);
> > > > -    led_cdev->dev = device_create_with_groups(&leds_class,
> > > > parent, 0, led_cdev,
> > > > -                          led_cdev->groups, "%s", final_name);
> > > > -    if (IS_ERR(led_cdev->dev)) {
> > > > -        mutex_unlock(&led_cdev->led_access);
> > > > -        return PTR_ERR(led_cdev->dev);
> > > > +    led_cdev->dev = kzalloc_obj(*led_cdev->dev);
> > > > +    if (!led_cdev->dev)
> > > > +        return -ENOMEM;
> > > > +
> > > > +    device_initialize(led_cdev->dev);
> > > > +    led_cdev->dev->class = &leds_class;
> > > > +    led_cdev->dev->parent = parent;
> > > > +    led_cdev->dev->groups = led_cdev->groups;
> > > > +    dev_set_drvdata(led_cdev->dev, led_cdev);
> > > > +    ret = kobject_set_name(&led_cdev->dev->kobj, "%s", final_name);
> > > > +    if (ret < 0)
> > > > +    {
> > > > +        put_device(led_cdev->dev);
> > > > +        return ret;
> > > >       }
> > > [Severity: High]
> > > Does this leave led_cdev->dev as a dangling pointer when
> > > kobject_set_name()
> > > fails here, or when led_classdev_add() fails in
> > > led_classdev_register_ext()
> > > below?
> > > 
> > > Previously, led_cdev->dev was assigned the return value of
> > > device_create_with_groups(), so on any failure it remained either
> > > NULL or an
> > > ERR_PTR(). Commit 1dbb9fb4082ce2 ("leds: Allow to call
> > > led_classdev_unregister() unconditionally") added an
> > > IS_ERR_OR_NULL() check
> > > to led_classdev_unregister() so drivers can call it unconditionally
> > > in their
> > > error and removal paths:
> > > 
> > > drivers/leds/led-class.c:led_classdev_unregister() {
> > >     if (IS_ERR_OR_NULL(led_cdev->dev))
> > >         return;
> > > ...
> > >     led_stop_software_blink(led_cdev);
> > > ...
> > >     flush_work(&led_cdev->set_brightness_work);
> > > 
> > >     device_unregister(led_cdev->dev);
> > > 
> > >     down_write(&leds_list_lock);
> > >     list_del(&led_cdev->node);
> > >     up_write(&leds_list_lock);
> > > ...
> > > }
> > > 
> > > Many drivers rely on this guarantee during error unwind or removal,
> > > such as
> > > asus_wmi_led_init() -> asus_wmi_led_exit() in
> > > drivers/platform/x86/asus-wmi.c,
> > > asus_led_init() -> asus_led_exit() in
> > > drivers/platform/x86/asus-laptop.c, and
> > > samsung_leds_init() -> samsung_leds_exit() in
> > > drivers/platform/x86/samsung-laptop.c.
> > > 
> > > With this change, put_device(led_cdev->dev) frees the device via
> > > led_classdev_release(), but led_cdev->dev is not reset to NULL. A
> > > subsequent
> > > call to led_classdev_unregister() will bypass the
> > > IS_ERR_OR_NULL(led_cdev->dev)
> > > check, operate on uninitialized blink_timer and set_brightness_work
> > > structures
> > > if kobject_set_name() failed before led_init_core(), trigger a
> > > use-after-free
> > > and double-free in device_unregister(led_cdev->dev), and crash in
> > > list_del(&led_cdev->node).
> > > 
> > > >         if (init_data && init_data->fwnode)
> > > >           device_set_node(led_cdev->dev, init_data->fwnode);
> > > [Severity: High]
> > > Could calling device_set_node() in led_classdev_init() before
> > > device_add() is
> > > called in led_classdev_add() break fw_devlink for child LED nodes?
> > > 
> > > Previously, device_create_with_groups() called device_add() while
> > > led_cdev->dev->fwnode was still NULL, and device_set_node() was only
> > > called
> > > after device_add() returned. When the parent LED controller finished
> > > probing,
> > > device_links_driver_bound() ->
> > > fw_devlink_pickup_dangling_consumers() marked
> > > the child LED fwnodes with FWNODE_FLAG_NOT_DEVICE and attached
> > > consumer links
> > > to the parent LED controller device.
> > > 
> > > Now that led_cdev->dev->fwnode is populated before
> > > led_classdev_add() calls
> > > device_add(led_cdev->dev), this block in device_add() will trigger
> > > during the
> > > parent driver's probe:
> > > 
> > > drivers/base/core.c:device_add() {
> > > ...
> > >     if (dev->fwnode && !dev->fwnode->dev) {
> > >         dev->fwnode->dev = dev;
> > >         fw_devlink_link_device(dev);
> > >     }
> > > ...
> > > }
> > > 
> > > Because led_cdev->dev is a class device that never binds to a driver:
> > > 
> > > 1. __fw_devlink_link_to_consumers(led_cdev->dev) converts consumer
> > > fwnode_links
> > >     on init_data->fwnode into managed device links with
> > > led_cdev->dev as the
> > >     supplier instead of the parent LED controller. During boot (while
> > >     fw_devlink_drv_reg_done is false), consumers remain blocked with
> > >     -EPROBE_DEFER until fw_devlink_drivers_done() runs, and are
> > > never linked to
> > >     the parent controller for runtime PM, suspend/resume, or unbind
> > > ordering.
> > > 
> > > 2. __fw_devlink_link_to_suppliers(led_cdev->dev, fwnode) creates
> > > managed device
> > >     links with led_cdev->dev as the consumer for any supplier
> > > properties on the
> > >     child LED node (such as gpios in gpio-leds or pwms in pwm-leds).
> > > Since
> > >     led_cdev->dev never probes a driver, those links stay in
> > > DL_STATE_AVAILABLE
> > >     and prevent the GPIO or PWM suppliers from reaching sync_state().
> > 
> > I have no experience with devicetree, so i cannot verify if this is
> > true, why do we call
> > device_set_node() in the first place after having already registered the
> > device?
> > 
> > Thanks,
> > Armin Wolf
> > 
> Any thoughts on this?

You're talking to an AI.  =:-)

-- 
Lee Jones
