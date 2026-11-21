Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795247462;
	b=n3czI09T9VgC9rjkVyur2/I3bOMdylWIoygadYc9iJ7i38tNiUwG/6h9MAh+oz3O68sI
	 qBjegBhDr3VmHRPUIUaNPnRd+Nsv5dNUbp2OLZ614AQQuN8ej/fHzpQYXma0QJJtuNei1
	 HSgWNp1AARpjyNXKM85VR4bUJqmd/J39mz8AbU7QL5jz+Snk2QlVHSHOiKoXrfNXBawvl
	 F3tiqSsdJRGq+Qjt+z2oTcMPzR9DwZsKiNKgECfwjru96KnfkhBZAKOv8/aUywGWqhmdR
	 1clkvB5T7dEIJabd6vcHrVl62kUorrPrebURxGKoaG6D4s4VhwdRIT24uNWZVVGgJhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795247462;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c8zkgzDres/Cakr2STnzkW2DefTmwpRRc34Kv0puNIs=;
	b=W98WMFp3E9tAC8mwtrIQjO0d0iwYu7dV9hVS9bkjbVhRdgK4f5dTUS8+qQYtzRNQE3v0
	 RrZSXYOLKquy4pmqrbIcqyD/ugup5jWA4wuM1TNOXU8FTfkMqb2fQJGYHB9X+4l8GXneL
	 K7Kwlfacr38CfqW/l0rqTXx/Mg4YjJPnjHP2OAHO8QrQZb8hEvbbb3aRvCe5jrLQQhOWY
	 AVSOmIXpneTNNbrKvZ+jDG87zyBAXVrhb+Y4VD1BfL/ZhJEIUkqV1RA+m3vKv5474+zdv
	 XPE2+SV8NK1KU1NDKgNF4S5DahqBK4es9vSGssP0opUW2CiwPwaSbPUJTrd/UaK9iLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kx5Qy84Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E3606A320
	for <linux-leds@vger.kernel.org>; Sat, 21 Nov 2026 07:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kx5Qy84Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220621F000C0;
	Sat, 21 Nov 2026 07:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795247462;
	bh=c8zkgzDres/Cakr2STnzkW2DefTmwpRRc34Kv0puNIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kx5Qy84QhbQZjfqRxwEIr7/yDEdPiaoU0MJrZU8DWvI7pi/OleZPSabBZBlfEtrPo
	 UsL9SVuVFjSRhmH4u69jE26qUoW5uvmsehEdfn70iB1G8mHpxuX3tgGxf+fql/8k67
	 aK2kXs5dPtpan560tiXEWUo4Vd96rueoXJ5NsZqRdbDzeXDpb4Aa7Q+ZMs8GvB5hlq
	 ekFGrDaLrYhr/VzT1FIiIagoX074O14Mfn4ZaxHZ9cx2NUXsUbgQwjbd+ZuMx03shY
	 BZmH4u5NPIHX8wds4hueEj5aQorO3MOWmlYwCJfw571i9fvDDQPBhCv+LJB2Pt0wqo
	 zhGkl/IugXpnQ==
Message-ID: <sashiko-outbox-226806@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] leds: leds-mc13783: enable driver for deferred
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Kurz" <akurz@blala.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261121074239.8745-2-akurz@blala.de>
References: <20261121074239.8745-1-akurz@blala.de>
 <20261121074239.8745-2-akurz@blala.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 07:51:01 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] leds: leds-mc13783: wrong DT property fsl,led-control breaks
  probe
--

commit 192aa62c8f136ce683903471ddceeeabc5b01f1f
Author: Alexander Kurz <akurz@blala.de>

leds: leds-mc13783: enable driver for deferred probe

This commit replaces module_platform_driver_probe() with
module_platform_driver() and drops __init from the probe functions so that
mc13xxx-led can probe after the parent MFD device is registered.

> diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
> index c3bbbc8ef946b..042cefde7853c 100644
> --- a/drivers/leds/leds-mc13783.c
> +++ b/drivers/leds/leds-mc13783.c
> @@ -109,7 +109,7 @@ static int mc13xxx_led_set(struct led_classdev *led_c=
dev,
>  }
> =20
>  #ifdef CONFIG_OF
> -static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
> +static struct mc13xxx_leds_platform_data *mc13xxx_led_probe_dt(
>  	struct platform_device *pdev)
>  {
>  	struct mc13xxx_leds *leds =3D platform_get_drvdata(pdev);

[Severity: High]
Does mc13xxx_led_probe_dt() fail with -EINVAL on all Device Tree boards
now that mc13xxx_led_probe() can run?

The preceding commit "leds: leds-mc13783: use unified device property API"
changed the property lookup in mc13xxx_led_probe_dt() from "led-control"
to "fsl,led-control":

drivers/leds/leds-mc13783.c:mc13xxx_led_probe_dt() {
    ...
	ret =3D fwnode_property_read_u32_array(parent, "fsl,led-control",
					 pdata->led_control,
					 leds->devtype->num_regs);
	if (ret)
		return ERR_PTR(ret);
    ...
}

However, the binding in
Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml (which sets
additionalProperties: false on the leds node) and all in-tree DTS files
use "led-control" without a vendor prefix, so
fwnode_property_read_u32_array() fails and aborts probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121074239.8745=
-1-akurz@blala.de?part=3D2
