Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4984B1B33
	for <linux-leds@vger.kernel.org>; Mon, 31 Aug 2026 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191378; cv=none; b=X4DPZzPJ81DyDdTkJxc/rTE1IJP7HimVTlwUKuXg1QwsS4SKYoe/NhOwd10o5XKCsmWlz4fgBpk6neFABbkBAAMHoaN4v+w4y6Whfq+/MAZ2gFh+oMDCb8csWWds1lfTL3NQTkMTIyogCJTHTCWMFD1rkMJeomlylN6oEWex2pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191378; c=relaxed/simple;
	bh=0Jrs73i/6gIfLGJmuXhyR43Tfy/f8pQsdvo1zO/DY8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IG7D6r8Io1NRDqDFlApOJeGi8QBVZlMvz7gNfcUqtbUnfL2ZEF8CoMkxUGx4DzxDDpHvKZERQX1LEDkypRVokCGFliZIrcE8kriPilmk6JPlVVyiTe4nGHJypHj1730CVc6FfUcd0/J+Xpb+BmUFx9l+qAsj8rTm3qL2J8vWQXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iovlhsO9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iovlhsO9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFF21F000E9;
	Mon, 31 Aug 2026 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788191376;
	bh=ZIrHn5ydh4PFOjORr55aS3D6Bc5ebL/oZtSLSK8ial8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iovlhsO93oztgyfU7DLfLFkzF5OR17dE5iZRGKN42BkMR7y97yk3Tfh0IK2ZDLaBC
	 4HQKdj2hiT+DIU8gduZJ143mm5sepnmLb9khuA0gYS0p3EKZ9uyDxUruRf3jnBxd8f
	 YFFELPy39d8zre9iCt5EgOLxPmJZ+UMPRM9pS7FiZyomYnr2cqNjql2qIGJIRKrKk1
	 WXtw9rOlOIXCDnf8Iqa0SWp9kMbctG9Xi52fxsfGLtdkW4UTol3IYQWcXYegRNGdnu
	 oyTtmcJh1GPI5a3JMyWreZWy2IUVQqCF31+6NFkcz36TeNiQ7gi6t4tjYxWX1/NxW+
	 khG59x8xe6x6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.12] leds: trigger: gpio: Use
 GPIOD_FLAGS_BIT_NONEXCLUSIVE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260831133314.4125787-347-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-347-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 15:49:35 +0000
Message-Id: <20260831154936.4EFF21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Using GPIOD_FLAGS_BIT_NONEXCLUSIVE causes premature hardware un-co=
nfiguration and refcount underflow when the shared GPIO is released, breaki=
ng the primary owner.
- [High] The patch fails to achieve its stated goal (supporting SFP shared =
GPIOs) because the SFP driver does not share IRQs, causing activation to al=
ways fail with -EBUSY.
- [Medium] The LED trigger driver blindly overwrites the shared GPIO's cons=
umer name, erasing the primary driver's label.
--

commit 02d3bd93d29878c57dc994ff5d3e680adeef7f2e
Author: Piotr Kubik <piotr@kubik.pl>
Subject: leds: trigger: gpio: Use GPIOD_FLAGS_BIT_NONEXCLUSIVE

This commit adds the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag when requesting
the GPIO in the LED trigger driver. This is intended to allow the trigger
to share a GPIO with another driver, such as an SFP module.

Link: https://patch.msgid.link/20260408115106.379834-1-piotr@kubik.pl

> diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/l=
edtrig-gpio.c
> index 7f6a2352b0acd..3199275fd250b 100644
> --- a/drivers/leds/trigger/ledtrig-gpio.c
> +++ b/drivers/leds/trigger/ledtrig-gpio.c
> @@ -86,7 +86,8 @@ static int gpio_trig_activate(struct led_classdev *led)
>  	 * The generic property "trigger-sources" is followed,
>  	 * and we hope that this is a GPIO.
>  	 */
> -	gpio_data->gpiod =3D gpiod_get_optional(dev, "trigger-sources", GPIOD_I=
N);
> +	gpio_data->gpiod =3D gpiod_get_optional(dev, "trigger-sources",
> +					      GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);

[Severity: High]
Does acquiring this GPIO non-exclusively expose the hardware state to being
inadvertently destroyed?

Because gpiolib does not implement reference counting for non-exclusive
consumers, any call to gpiod_put() will execute gpiod_free_commit():

drivers/gpio/gpiolib.c:gpiod_free_commit() {
    ...
    clear_bit(GPIOD_FLAG_REQUESTED, &flags);
    ...
}

This unconditionally frees the GPIO hardware state. Since gpio_trig_activat=
e()
calls gpiod_put() on its error path and during deactivation, won't this tear
down the primary owner's (e.g., the SFP driver's) hardware state?


[Severity: High]
Will this IRQ sharing strategy actually work with the SFP driver?

In gpio_trig_activate(), the LED trigger requests the IRQ with IRQF_SHARED:

    ret =3D request_threaded_irq(gpiod_to_irq(gpio_data->gpiod), NULL,
                    gpio_trig_irq,
                    IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_RISING
                    | IRQF_TRIGGER_FALLING, "ledtrig-gpio", led);

However, the primary SFP driver requests the same IRQ exclusively:

drivers/net/phy/sfp.c:sfp_probe() {
    ...
    err =3D devm_request_threaded_irq(sfp->dev, sfp->gpio_irq[i],
                                    NULL, sfp_irq,
                                    IRQF_ONESHOT |
                                    IRQF_TRIGGER_RISING |
                                    IRQF_TRIGGER_FALLING,
                                    sfp_irq_name, sfp);
    ...
}

Since the kernel's IRQ core strictly requires all consumers to use IRQF_SHA=
RED
for sharing to succeed, won't request_threaded_irq() always return -EBUSY?=
=20

If this always fails, it will trigger the error path that calls gpiod_put(),
which leads to the destructive GPIO teardown mentioned above.


[Severity: Medium]
Could this overwrite the original owner's consumer label?

Right after acquiring the GPIO, the trigger driver forcibly sets the
consumer name:

    gpiod_set_consumer_name(gpio_data->gpiod, "led-trigger");

The underlying gpiolib implementation completely overwrites and frees the
old label:

drivers/gpio/gpiolib.c:desc_set_label() {
    ...
    old =3D rcu_replace_pointer(desc->label, new, 1);
    if (old)
        call_srcu(&desc->gdev->desc_srcu, &old->rh, desc_free_label);
    ...
}

Won't this erase the primary driver's label and corrupt the consumer
tracking for debugging interfaces like debugfs and sysfs? Furthermore, if t=
he
LED trigger fails or deactivates, won't desc_set_label() clear the label
entirely to NULL, permanently masking the primary driver's ownership?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-347-sashal@kernel.org?part=3D1
