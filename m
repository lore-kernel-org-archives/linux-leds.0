Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899022;
	b=ctIn127WZeX7BGaHVKdQHoSaovGTcoCu9WZPnt13JKZMX06NlGRhUHpv30RnEbfKfiz2
	 P6LTgK1uX3vyUhKfAfYD2fbra5Yekb4xg+eT2XWBuordo5wBv/5PZKPVla2b6kSMXz1Uu
	 P5Wbf0KXzz6hGEnSmJB2xDySgy2b1rutbyCQkRqRskah5fxfn7mQdA+uPnS1GZVkAssPa
	 ccBT0Vaeo9LpwACeZyWTJhbJ11kfQOngPF+9cUgyZ3qWNt60Qwhe5tIFibJAMUpL3Xe1f
	 Bl0/38VvDFiMAhNwa0yEKEo2pkbUknZUJpsAZ5D1X/4c/vT1SRXECGd0MEZ2W+gV2VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899022;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u5FRxG87DyyxMxV7Ld+dAeUJyImEXGgOQ8BNjZ4DJ+g=;
	b=2tsyrJ9ujszCuOPCI0hUGKryQoneqkz0uy7SLgez1R/2ISe1pNp6WtLs1oMkV3T+c0jX
	 PQ0DQ/iah61oDyJ2yWrawyZPgVwJpH2JrDnxtZSF7mfw+y4QMe+PLgBITWOG8K00LQtn3
	 HbJMZ8Vc4B8GOsBh5o03szuPv/T81ECKasRQaVCPgwY3QPSq+6PxmFGKBRFI0S5Nu+now
	 07vbdHWZbzOmaFO94fwemjmXLUxBm2yNoosVXRQWXXqCFDYkysaQWKSvaH9liSMwZyGQL
	 RdBiCWeH/qqTIkF6zh7AEL43qnnIoNpnCu/lchepCATypL6XpdPNRV2l55ydC3vqY4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Er7qy64H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD93606A31C
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Er7qy64H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945421F000C4;
	Tue, 17 Nov 2026 07:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794899021;
	bh=u5FRxG87DyyxMxV7Ld+dAeUJyImEXGgOQ8BNjZ4DJ+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Er7qy64Hyr8cpyJiOhyLXb+acWPRNIgWgWbXplYsxifxaaHevahk1b+xZ/j9P0unF
	 SchGUf26ClwemtY5K2dKnxIxMs+G/UK33SrPFVtIZqeg6TeUoevzqWEXPTpamOgfQp
	 6Q3+VRf6Qw1CiYvPhe8quYo4R41+eldr+BNlQTNpUNPGh3jVhX32nPW7bnSNMdKX1m
	 DzPVTKZPu2R0nZNkCklbSMUYe1j8SuKx4xEurL+EosKOHpXZF+lCptjBzN/y7MPUPA
	 Eh4nlBYyXaexv271bR9wudaUR2iWc6cddhdn4LFjY+tcH/825Pz+HxottMiew+8UCl
	 h75ttqf4/pbDQ==
Message-ID: <sashiko-outbox-218289@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] leds: tps6131x: clear torch brightness cache on
 flash takeover
Reply-To: sashiko-reviews@lists.linux.dev
To: jiegu <jie.gu@leica-geosystems.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117064328.4096518-3-jie.gu@leica-geosystems.com>
References: <20261117064328.4096518-1-jie.gu@leica-geosystems.com>
 <20261117064328.4096518-3-jie.gu@leica-geosystems.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:03:41 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] leds: tps6131x: Signed-off-by trailer uses handle instead of
  real name
- [Medium] leds: tps6131x: race between torch brightness work and flash
  takeover
- [Low] leds: tps6131x: missing Fixes trailer for commit b338a2ae9b31
- [Low] leds: tps6131x: lowercase commit subject description after
  prefix
- [Low] leds: tps6131x: stale torch brightness on error in
  tps6131x_strobe_set()
--

commit f89ca151830eb0b217f7a4d48fff59fc543e3ca3
Author: gujie <jie.gu@leica-geosystems.com.cn>

> leds: tps6131x: clear torch brightness cache on flash takeover

[Severity: Low]
Per LED subsystem conventions, the description after the "leds: tps6131x: "
prefix should be capitalized ("leds: tps6131x: Clear torch brightness cache
on flash takeover").

>
> When the device switches from torch mode to flash or external strobe
> mode, the hardware torch output is disabled, but the LED class
> brightness cache may still keep the previous non-zero torch value.
>
> This leaves sysfs brightness reporting an enabled torch state even
> though the light is already off.
>
> Update the cached LED brightness to LED_OFF when flash control takes
> over so userspace state matches the actual hardware state.
>
> Signed-off-by: gujie <jie.gu@leica-geosystems.com.cn>

[Severity: High]
The Signed-off-by trailer and Author header use a single-word handle
("gujie") instead of a full real human name, which does not meet the
Developer's Certificate of Origin requirements in
Documentation/process/submitting-patches.rst.

[Severity: Low]
Since this fixes a bug introduced with the driver, should it include a
Fixes tag?

  Fixes: b338a2ae9b31 ("leds: tps6131x: Add support for Texas Instruments T=
PS6131X flash LED driver")

> diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds=
-tps6131x.c
> index 704c3e7dfcda0..4b36fd2e3778b 100644
> --- a/drivers/leds/flash/leds-tps6131x.c
> +++ b/drivers/leds/flash/leds-tps6131x.c
> @@ -294,6 +294,11 @@ static int tps6131x_set_mode(struct tps6131x *tps613=
1x, enum tps6131x_mode mode,
>  				       NULL, false, force);
>  }
> =20
> +static void tps6131x_sync_torch_brightness_off(struct tps6131x *tps6131x)
> +{
> +	tps6131x->fled_cdev.led_cdev.brightness =3D LED_OFF;
> +}
> +
>  static void tps6131x_torch_refresh_handler(struct work_struct *work)
>  {
>  	struct tps6131x *tps6131x =3D container_of(work, struct tps6131x, torch=
_refresh_work.work);
> @@ -398,6 +403,8 @@ static int tps6131x_strobe_set(struct led_classdev_fl=
ash *fled_cdev, bool state)
>  	if (ret)
>  		return ret;
> =20
> +	tps6131x_sync_torch_brightness_off(tps6131x);
> +
>  	return 0;
>  }

[Severity: Low]
Can fled_cdev.led_cdev.brightness still remain stale if a TPS6131X_REG_3
update fails in tps6131x_strobe_set()?

drivers/leds/flash/leds-tps6131x.c:tps6131x_strobe_set() {
    ...
	ret =3D tps6131x_set_mode(tps6131x, state ? TPS6131X_MODE_FLASH : TPS6131X=
_MODE_SHUTDOWN,
				true);
	if (ret < 0)
		return ret;

	if (state) {
		ret =3D regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_3, TPS6131=
X_REG_3_SFT,
					      TPS6131X_REG_3_SFT, NULL, false, true);
		if (ret)
			return ret;
	}
    ...
}

Once tps6131x_set_mode() succeeds, the hardware torch output is already
disabled.  If either subsequent regmap_update_bits_base() call on
TPS6131X_REG_3 fails, returning before tps6131x_sync_torch_brightness_off()
leaves fled_cdev.led_cdev.brightness reporting a non-zero torch value while
the torch is off.  Similarly, because cancel_delayed_work_sync() runs
before tps6131x_set_mode() here and in tps6131x_flash_external_strobe_set(),
a failure in tps6131x_set_mode() leaves torch_refresh_work canceled so the
hardware watchdog shuts the torch down after 13 seconds without updating
fled_cdev.led_cdev.brightness.

> @@ -697,12 +704,19 @@ static int tps6131x_flash_external_strobe_set(struc=
t v4l2_flash *v4l2_flash, boo
>  {
>  	struct led_classdev_flash *fled_cdev =3D v4l2_flash->fled_cdev;
>  	struct tps6131x *tps6131x =3D fled_cdev_to_tps6131x(fled_cdev);
> +	int ret;
> =20
>  	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
>  	guard(mutex)(&tps6131x->lock);
> =20
> -	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS61=
31X_MODE_SHUTDOWN,
> -				 false);
> +	ret =3D tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6=
131X_MODE_SHUTDOWN,
> +				false);
> +	if (ret)
> +		return ret;
> +
> +	tps6131x_sync_torch_brightness_off(tps6131x);
> +
> +	return 0;
>  }

[Severity: Medium]
Can a concurrent torch brightness update race with flash takeover and
re-enable hardware torch mode after fled_cdev.led_cdev.brightness has been
reset to LED_OFF?

Because tps6131x_led_class_setup() registers brightness_set_blocking,
writing a non-zero value to sysfs brightness updates led_cdev.brightness
immediately and queues set_brightness_work to run tps6131x_brightness_set()
asynchronously.  In addition, tps6131x_strobe_set() and
tps6131x_flash_external_strobe_set() call cancel_delayed_work_sync() on
torch_refresh_work before acquiring tps6131x->lock, whereas
tps6131x_brightness_set() schedules torch_refresh_work under tps6131x->lock:

CPU0 (kworker)                    CPU1 (strobe / v4l2)
tps6131x_brightness_set()
  guard(mutex)(&tps6131x->lock)
  tps6131x_set_mode(..., TORCH)
                                  tps6131x_strobe_set()
                                    cancel_delayed_work_sync(...)
                                    guard(mutex)(&tps6131x->lock)
  schedule_delayed_work(...)
                                    tps6131x_set_mode(..., FLASH)
                                    tps6131x_sync_torch_brightness_off()
                                      led_cdev.brightness =3D LED_OFF
tps6131x_torch_refresh_handler()
  tps6131x_set_mode(..., TORCH)  <-- torch re-enabled while brightness =3D=
=3D 0

The same mismatch happens if set_brightness_work runs
tps6131x_brightness_set() with a queued non-zero delayed_set_value right
after tps6131x_strobe_set() or tps6131x_flash_external_strobe_set() clears
led_cdev.brightness: the hardware switches back to TPS6131X_MODE_TORCH
while sysfs brightness still reports LED_OFF.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117064328.4096=
518-1-jie.gu@leica-geosystems.com?part=3D2
