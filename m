Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B887F37F723
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372954; cv=none; b=XZQVdx7TKglijLMQOP171iVNQZIhppaA2kDXpg03dxjuCLQ3wokK/482Y8YcuxLR5m9K212khI2GpsLT1gcT3gC7LdoR36T/2XPHhsO5hzMlFAApif8QuaIlxxyGZQYWf7tpkaNqgNHlyEFB5GESs62Z94O3FfKWubcfuVpI0SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372954; c=relaxed/simple;
	bh=ga59T8uvfpQ5Sk/rjffCqqn2gA/rqILPrjH+V5lTk5I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AbUoh6803tQyfaNzxA/nCD6MTaTfDDOCFkJI43evekfv9/0suZtNKDOKFy1doMeTLpkJX8tKDUVbyR4sHTe3zKGhHZHkfhG3bvNtmRdddOxEmHVW4p1cddQUgGf34LUi3zN2nx6jIOmmphg9pPN5fDsbREPPUNz61syxFszwmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcYkvMMA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcYkvMMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E051F00A3D;
	Wed,  2 Sep 2026 18:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372952;
	bh=zT87N0JclibzyUjSxx80HJD7WN+66Bs63js0zWcjQMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BcYkvMMA/y5LRv9CyVUDiJSYuCXYpJIRM+1sj2+1oQo3k5Q05r35JWroRQw2v7VNo
	 vG06YywdzBsOeRdrMZ2IdYK0a//JPYvA9iHDf1+eKwulrAz4ctWkFXriGcB7DAdYst
	 6eQL9vuJPt/FZa0walJRO079Go2O+4NhXF34xRAobLznQaaGAw5MWJsYJ7RCudcpQO
	 gYXLvTSWn9i2x6ZlKDJN6F+7aUagpLqPTFBrEpr7rnIsYeqLZrs0UWEEeVWTunUaeQ
	 inCkfYUxF3Sxy/zpq+gjY/L0S5IYy4zhrtb5wwRcGtUx6tz4Ze6RuFOD6Xwt+JBx1j
	 M6uQ3V4IZ3IbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/12] leds: cros_ec: Implement offloaded() trigger
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-5-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-5-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:51 +0000
Message-Id: <20260902181552.49E051F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Registering a global static `led_trigger` structure in a driver's =
probe function causes list corruption and lock re-initialization if the dri=
ver is probed multiple times.
--

commit bc24951be035009b57d7197b147b7679371f913d
Author: Rong Zhang <i@rong.moe>

leds: cros_ec: Implement offloaded() trigger callback

"chromeos-auto" is a private hardware control trigger which always stays
in hardware control. Implement offloaded() callback with its return
value to be always true to reflect this.

> diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> index 1844d0cd5f528..6db83d0152775 100644
> --- a/drivers/leds/leds-cros_ec.c
> +++ b/drivers/leds/leds-cros_ec.c
> @@ -85,12 +85,18 @@ static int cros_ec_led_trigger_activate(struct led_cl=
assdev *led_cdev)
>  	return cros_ec_led_send_cmd(priv->cros_ec, &arg);
>  }
> =20
> +static bool cros_ec_led_trigger_offloaded(struct led_classdev *led_cdev)
> +{
> +	return true;
> +}
> +
>  static struct led_hw_trigger_type cros_ec_led_trigger_type;
> =20
>  static struct led_trigger cros_ec_led_trigger =3D {
>  	.name =3D "chromeos-auto",
>  	.trigger_type =3D &cros_ec_led_trigger_type,
>  	.activate =3D cros_ec_led_trigger_activate,
> +	.offloaded =3D cros_ec_led_trigger_offloaded,
>  };

[Severity: High]
This is a pre-existing issue, but does registering this global static
led_trigger structure in a driver's probe function cause list corruption and
lock re-initialization if the driver is probed multiple times?

If cros_ec_led_probe() runs multiple times (for example, if a user manually
binds the driver to a secondary device via sysfs, or if multiple matching
devices are present), devm_led_trigger_register() would be called multiple
times on this same global structure.

In led_trigger_register():

	spin_lock_init(&trig->leddev_list_lock);
	INIT_LIST_HEAD(&trig->led_cdevs);

This unconditional initialization corrupts the in-use lock and list head
before checking for duplicates and returning -EEXIST. Could this memory
corruption lead to a kernel panic or use-after-free when iterating the list
or tearing down the trigger?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D5
