Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA71436BE6;
	Wed, 29 Jul 2026 07:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311739; cv=none; b=p1rOQf5dtNwzrsUkH1GrdSVmP3tAJMcBlRm7g1oCXoKwz3OLWoLOogqDGpbVBYN/cpHH2rLUOYgM+iGQh5MA9QR1HyY7i8WPtL/9TBUc4umYNr9FR/9u5gj+AH5gRvVVHnnHn6hsJloKpAmc+Hydb4te5PsbjHDHo4DtOWsfe0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311739; c=relaxed/simple;
	bh=8kTcedMw7KPKMZG39PXPuGHcOoU8QbZa2TrBKI/9ZbA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hiVNA6en8ONiCZIBYyqtDU7zRPtE/gKG7gzsjn+aijE2se93uPNz5wbKK1bjHiqDuEXah4aLeZHBIYE6EC5YN41p7fW1KeXWrNt5Cu2dFPMjFTmRnPY/R+KpdfEXWdx7Usfl72zn5knYhuTC5082iNRGxQuDSKsmJrXummmgCnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXFf2hLZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXFf2hLZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DE11F000E9;
	Wed, 29 Jul 2026 07:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311735;
	bh=iBntEOqey5rms6EC+asOLAx9hgS+8OAEC0aGj6ReWZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QXFf2hLZd8jNZi4JLfLPNALpoqPvdStq5o2mAMcofo+VNW0A0WT34XhONWdNnfjoj
	 WG85pckd40/uax7wro8pW/h3vDkM93+G1WS4gLLJhdiLZexsH1QTksiCyytyNsfBQs
	 ubyeShj+nEqaVAg3mMzUyra9exKUuVM7s2IKA47kNZIpZ+kYxprOCW1Bm7vdYdu4F0
	 TFonZ7MvTdSDCU6E6qWBpGSa6+eBaiyWM2D/+I0bWrrupKtpRouP2GiUyZPlz1GwVh
	 XkbfpNiZGe+0Imn1e1YZtYiCoN3sFAGVRJ2GAE+cRsT6/RMPmSAo8kSHNQu9k5XOE6
	 nQz+BRi7z8X9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] leds: pca9532: check return value in
 pca9532_setled()
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com
Cc: linux-leds@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260729-led-fix-v2-2-09ad218457bd@nxp.com>
References: <20260729-led-fix-v2-0-09ad218457bd@nxp.com>
 <20260729-led-fix-v2-2-09ad218457bd@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 07:55:34 +0000
Message-Id: <20260729075535.53DE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The newly added error return values from `pca9532_setled()` and =
`pca9532_gpio_set_value()` are ignored in the configuration and GPIO direct=
ion paths.
- [Low] The commit message violates the LED subsystem capitalization rule.

Pre-existing issues:
- [High] Incorrect teardown ordering of a devm-managed input device and a c=
ustom workqueue leads to a Use-After-Free during device removal.
--

--- Patch [2]: [PATCH v2 2/4] leds: pca9532: check return value in pca9532_=
setled() ---
commit 3e826891d5b6286d8b08ddc7c668e35465352554
Author: Haibo Chen <haibo.chen@nxp.com>

leds: pca9532: check return value in pca9532_setled()

This commit updates pca9532_setled() to check the return value of
i2c_smbus_read_byte_data(). By checking for read failures, it prevents
writing bogus bitwise-modified negative error codes back to the device.

> leds: pca9532: check return value in pca9532_setled()

[Severity: Low]
This isn't a bug, but the commit description after the subsystem prefix isn=
't=20
capitalized. It should probably be "Check return value in pca9532_setled()".

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index e8ee17b8bd547..adfb5aa50e8e1 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
[ ... ]
> @@ -159,21 +159,29 @@ static int pca9532_setpwm(struct i2c_client *client=
, int pwm)
>  }
> =20
>  /* Set LED routing */
> -static void pca9532_setled(struct pca9532_led *led)
> +static int pca9532_setled(struct pca9532_led *led)

[Severity: Medium]
Since this function now returns an error code, do we also need to update
other callers that still ignore it?=20

For example, pca9532_gpio_direction_input() calls pca9532_gpio_set_value()
(which returns the error from pca9532_setled()), but the error is discarded:

drivers/leds/leds-pca9532.c:pca9532_gpio_direction_input() {
    ...
    pca9532_gpio_set_value(gc, offset, 1);
    return 0;
}

Similarly, pca9532_configure() invokes pca9532_setled() during initializati=
on
without checking the result, which might leave the hardware in an undefined
state if the I2C bus fails.

[ ... ]
> @@ -257,9 +264,7 @@ static int pca9532_set_blink(struct led_classdev *led=
_cdev,
>  	if (err)
>  		return err;
> =20
> -	pca9532_setled(led);
> -
> -	return 0;
> +	return pca9532_setled(led);
>  }
> =20
>  static int pca9532_event(struct input_dev *dev, unsigned int type,

[Severity: High]
This is a pre-existing issue, but can this event callback fire after the
workqueue is cancelled during device removal, causing a use-after-free?

During driver unbind, pca9532_remove() calls pca9532_destroy_devices()
which manually cancels the work:

drivers/leds/leds-pca9532.c:pca9532_destroy_devices() {
    ...
    cancel_work_sync(&data->work);
    data->idev =3D NULL;
    ...
}

However, because the input device is allocated with
devm_input_allocate_device(), it remains active and registered until
devres cleanup runs after .remove() finishes.=20

If userspace injects an EV_SND event concurrently, the input core could
invoke pca9532_event(), rescheduling the work item via
schedule_work(&data->work). When the scheduled work executes later, the data
structure will have already been freed by devres.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-led-fix-v2=
-0-09ad218457bd@nxp.com?part=3D2
