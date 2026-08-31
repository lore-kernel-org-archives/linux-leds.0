Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E2D468C29
	for <linux-leds@vger.kernel.org>; Mon, 31 Aug 2026 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196395; cv=none; b=Hx1Tya/kwlqreJWSwEKHIePGv/IbFm5H/fpDhFHiyLq3TtkLZ54DiaXEg4a9J3eacX81f8UbEI5/jiWnRlb3e/FEC5YhKkLmyu4cOWb4jlk8R6EJ6Vh9pVsV/HKWzlKVABgvvwie9YQ4abL2UJl8Rn0pcdoTPMn4+Hl5PNR5g7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196395; c=relaxed/simple;
	bh=QhLdPMZ4xRSHIWkpOKskVTyX2LM1Kjp5KyG5FcolAsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WSpNWoWEFbZUcJyHvGfG14fd5jaDcCOo/Ji5v2bDk0vor98gc3Oh0RwLOfESFYEGfPhFa/qrsyd6jAUX5G7tpSNUK6HFibbum3cIec19EqY9gSeDBYKuxcUXI7JI1gZsvkZ+wCoiBTmE6ZbHHO69m3kC13E2wSC5BCvX+oBY+fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+ujNWke; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+ujNWke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8ACB1F000E9;
	Mon, 31 Aug 2026 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788196393;
	bh=1YTAJIA2V8ifFvelLsHmTV6Pzx5/hnxLb5shwr/Kf1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g+ujNWkeoLDZN+ssJ2eOePu6nXY6UqB6+jQ9Q37KJzfpi41IP1TnBR5h+cT8ro3NN
	 XWgvqQrg9rFyHd0lmpsLKGyxJy+ZyxyS0wOuiOx+OaJu4C3c2lL54YS4MFeZQETXEE
	 LH4vnn01GTci2F7FuPdW5VneKRB6xurvEcaaTlysQ0aoHjp9Q9WOc0Rd+OKRcDeBU7
	 Pg7DDpTtWTF8DE3uPSMo5N/JtHc5wM/S5I3LMVCcnbKYzM4w9lSGqgygizwjwJ3cdd
	 Lt6MC4VasFi7o4r8KD41qIISOFQ4iog8urYAb1Ad9w0WJOnkz68CMOwFgT0lb0QIhw
	 9X0EJgU0TYwZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] leds: tps6131x: Increase overvoltage
 protection threshold to 6V
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260831133314.4125787-567-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-567-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 17:13:13 +0000
Message-Id: <20260831171313.A8ACB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cleanup and inverted teardown order for `torch_refresh_wor=
k` causes use-after-free.
- [High] The flash strobe is immediately cancelled when turned on due to a =
missing return statement.
- [High] `led_cdev->max_brightness` is set to milliamperes instead of steps=
, breaking the standard sysfs brightness scaling interface.
--

commit d25747de0af565ce7fa5d6951483e0ef6ee5bb6d
Author: Matthias Fend <matthias.fend@emfend.at>

leds: tps6131x: Increase overvoltage protection threshold to 6V

This commit increases the overvoltage protection threshold in the tps6131x
driver to 6V. It adjusts the register initialization value to prevent spuri=
ous
overvoltage detection on valid 5V hardware setups.

Link: https://patch.msgid.link/20260527-leds-tps6131x-ovp-v1-1-1ac70d03c9eb=
@emfend.at

> diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds=
-tps6131x.c
> index 6f4d4fd553610..ad96455b3b02a 100644
> --- a/drivers/leds/flash/leds-tps6131x.c
> +++ b/drivers/leds/flash/leds-tps6131x.c
> @@ -277,7 +277,7 @@ static int tps6131x_init_chip(struct tps6131x *tps613=
1x)
>  	if (ret)
>  		return ret;
> =20
> -	val =3D TPS6131X_REG_6_ENTS;
> +	val =3D TPS6131X_REG_6_ENTS | (TPS6131X_OV_4950MV << TPS6131X_REG_6_OV_=
SHIFT);
> =20
>  	ret =3D regmap_write(tps6131x->regmap, TPS6131X_REG_6, val);
>  	if (ret)

[ ... ]

> static void tps6131x_remove(struct i2c_client *client)
> {
> 	struct tps6131x *tps6131x =3D i2c_get_clientdata(client);
>=20
> 	v4l2_flash_release(tps6131x->v4l2_flash);
>=20
> 	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
> }

[Severity: High]
This isn't a bug introduced by this patch, but doesn't this teardown order
leave a use-after-free vulnerability in tps6131x_remove()?

Because devm_led_classdev_flash_register_ext() uses devres, the LED device
remains registered when tps6131x_remove() returns. If a user writes to the
LED brightness sysfs attribute during this window, tps6131x_brightness_set()
can reschedule torch_refresh_work.=20

The subsequent devres teardown will free the tps6131x struct while the dela=
yed
work timer is still active.

Additionally, in tps6131x_probe():

> 	ret =3D tps6131x_v4l2_setup(tps6131x);
> 	if (ret)
> 		return dev_err_probe(&client->dev, ret, "Failed to setup v4l2 flash\n");

[Severity: High]
This is a pre-existing issue, but is the timer leaked in this error path?

If tps6131x_v4l2_setup() fails, the probe exits without canceling the delay=
ed
work. Since the LED class device was already registered and could have been
accessed, the timer might still be active.

[ ... ]

> static int tps6131x_strobe_set(struct led_classdev_flash *fled_cdev, bool=
 state)
> {
[ ... ]
> 	if (state) {
> 		ret =3D regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_3, TPS61=
31X_REG_3_SFT,
> 					      TPS6131X_REG_3_SFT, NULL, false, true);
> 		if (ret)
> 			return ret;
> 	}
>=20
> 	ret =3D regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_3, TPS613=
1X_REG_3_SFT, 0, NULL,
> 				      false, true);

[Severity: High]
This is a pre-existing issue, but will this immediately terminate the flash
pulse?

If state is true, the driver writes a 1 to TPS6131X_REG_3_SFT, but without
a return statement inside the if-block, execution falls through and writes a
0 to TPS6131X_REG_3_SFT. This appears to break the hardware strobe
functionality by immediately turning it off.

[ ... ]

> static int tps6131x_led_class_setup(struct tps6131x *tps6131x)
> {
[ ... ]
> 	led_cdev->brightness_set_blocking =3D tps6131x_brightness_set;
> 	led_cdev->max_brightness =3D tps6131x->max_torch_current_ma;

[Severity: High]
This isn't a bug introduced by this patch, but is max_brightness incorrectly
configured with milliamperes rather than step counts?

In tps6131x_brightness_set(), the brightness parameter is interpreted direc=
tly
as the number of steps:

> static int tps6131x_brightness_set(struct led_classdev *cdev, enum led_br=
ightness brightness)
> {
[ ... ]
> 	steps_remaining =3D (brightness * tps6131x->step_torch_current_ma) / TPS=
6131X_TORCH_STEP_I_MA;

If max_brightness is exposed as milliamperes (e.g., 175), writing values up
to 175 via sysfs will be processed as 175 steps and clamped to the hardware
maximum. This saturates the computation and locks the output to 100% bright=
ness
for almost the entire exposed sysfs range.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-567-sashal@kernel.org?part=3D1
