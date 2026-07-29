Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0C73DDAEA;
	Wed, 29 Jul 2026 07:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311573; cv=none; b=EHuCdEJ2olgIIwiBnTqWeV7tCsM33XUi4Z24inz682UD0Duju/q2oEYTImvI7UVr4P5hRyAqnT6cOyznQS/jx0khqOdJ8Jk/qnqZxckZkULU8jJMk1q6x382cdkIKq9he2xaoGyxhxF+vg8B2iNe+5dGgasNef9ZbivbvVfgbsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311573; c=relaxed/simple;
	bh=Gos1e25U0o2cpUAn8uF6ZMD+LMgDu2CEh9xAtIQRHI8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AWunudAYSqe37L0HM+CnxMdWAKeEKS/GEpgQrOy+PCWqI6Xn7kISCcTOyv38gXm2S9k3Lgf4fywpqfG+hHJT884WAYWqjje77onuMZbJ80NPrlYDD6qr+lLnukkYA7D3RtEMdgpUpzemcH3WICGSc0XxltOuCD4AWKrdpxk4SUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGk6Y0Df; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGk6Y0Df"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD191F000E9;
	Wed, 29 Jul 2026 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311572;
	bh=qp+TqS76JFFTouHj3Yf0x0C/k01bGu1P1mKxSi1rKz0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IGk6Y0Df63fuYmDulabgOfOZ+UtV6oM0lGw4Z8G888PrJK2qwUuKXOVY22dPq5NQS
	 vWzC+29TJPO6DcFzzeX7H39pkjgNC1YF60w0HKNV1p0xLQEu6Tc3DsiBEpqO0XMXv3
	 EwxzLj4EOiPdpbEZhHo0VYN2hwMzafFf4gbirTxc9ReLuT5bnpvasbPhBFNYIaQ+20
	 6EqS4LE8kbgKk0k3sdrULdtYl4x8CO6pv4Tqmi5qMwjbFACDrrib6WDkEd0pAFJmtp
	 tjYqtPL24+WSrXqVfm7YnZED/qgc5EhmsMlpI5IBOXWnQyJHNm1m/GsHWBVyGUgdKU
	 Te+Tq7UtIn9BQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] leds: pca9532: check return value in
 pca9532_gpio_get_value()
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260729-led-fix-v2-3-09ad218457bd@nxp.com>
References: <20260729-led-fix-v2-0-09ad218457bd@nxp.com>
 <20260729-led-fix-v2-3-09ad218457bd@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 07:52:51 +0000
Message-Id: <20260729075252.3BD191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Unratelimited warning log in the GPIO read callback can flood th=
e kernel log.
- [Low] The commit message description after the subsystem prefix is not ca=
pitalized.

Pre-existing issues:
- [High] Race condition in driver teardown leaves input workqueue active af=
ter device data is freed, causing a Use-After-Free.
--

--- Patch [3]: [PATCH v2 3/4] leds: pca9532: check return value in pca9532_=
gpio_get_value() ---
commit 40e01af05e0100f229b670bf1dcf0b63a92a90f8
Author: Haibo Chen <haibo.chen@nxp.com>

leds: pca9532: check return value in pca9532_gpio_get_value()

pca9532_gpio_get_value() reads the input register with
i2c_smbus_read_byte_data() but stores the result in an unsigned char and
never checks for failure. On an I2C read error the negative error code
(e.g. -EIO) is truncated to an unsigned byte, and a bit is extracted and
returned as a valid GPIO level. This masks hardware errors and lets
kernel or userspace consumers silently receive corrupt data.

> leds: pca9532: check return value in pca9532_gpio_get_value()

[Severity: Low]
This isn't a bug, but the subsystem guidelines request capitalizing the
description after the prefix. Should "check" be capitalized to "Check"?

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index adfb5aa50e8e1..cee398d8275b8 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -345,9 +345,14 @@ static int pca9532_gpio_set_value(struct gpio_chip *=
gc, unsigned int offset,
>  static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
>  {
>  	struct pca9532_data *data =3D gpiochip_get_data(gc);
> -	unsigned char reg;
> +	int reg;
> =20
>  	reg =3D i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset=
));
> +	if (reg < 0) {
> +		dev_warn(&data->client->dev,
> +			 "failed to read input register: %d\n", reg);

[Severity: Medium]
Could this dev_warn() flood the kernel log if the I2C bus fails while
userspace is actively polling the GPIO value? Would it be safer to use
dev_warn_ratelimited() here?

> +		return reg;
> +	}
> =20
>  	return !!(reg & (1 << (offset % 8)));
>  }

[Severity: High]
This is a pre-existing issue, but does driver teardown leave the input
workqueue active after device data is freed, causing a use-after-free?

Looking at pca9532_destroy_devices(), cancel_work_sync() is called but
the input device remains registered because it relies on devres for
unregistration:

drivers/leds/leds-pca9532.c:pca9532_destroy_devices() {
    ...
    cancel_work_sync(&data->work);
    data->idev =3D NULL;
    ...
}

If an event comes in after pca9532_remove() finishes but before devres
cleans up the input device, could pca9532_event() blindly reschedule
the work?

drivers/leds/leds-pca9532.c:pca9532_event() {
    ...
    schedule_work(&data->work);
    ...
}

Since devres unregisters the device and frees data, the scheduled work
could be left dangling. When pca9532_input_work() finally executes,
would it dereference the freed data pointer?

drivers/leds/leds-pca9532.c:pca9532_input_work() {
    ...
    mutex_lock(&data->update_lock);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-led-fix-v2=
-0-09ad218457bd@nxp.com?part=3D3
