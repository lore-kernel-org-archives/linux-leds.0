Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333361;
	b=Y1LonalZpro4P2JQ5ftRn6KxJoCoYTgnDQATlgj8N3DzAaIi78fLZLmDwsStSjS/FMxW
	 /4d7f536BRG2Hu0zN/XfXR5DUKSCYjOrU3KeT/znMWtrT3JLTJ+JAez15nbk3TFWcsUhV
	 76wlUgihJFRyaad/tiXfTcaYumMMGxtsgttvx7KKtt5mfS+GKH3JF0tnhFUpv/wcu3joy
	 H7lHUmuXdsGfsJpQHOXs1hoqnOoGPxKLalcAdFevCAVJdIZbxZOavEYqwK9c0WgSzUfrK
	 cTF/gb6BaIDc2AIZYaCZniKNDPZXXZwfzSAoUnMkBVvV2CZZ2qvNFvKia7B6C4WgUMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333361;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aglOWT8PqMJ8KZc0H0xhTJmgM9QGQagAXjNL25z8qsk=;
	b=RrsDfFWB5ZcTwMPWqSpc983iMH9ouhDhRjQwmF0t6NzGv6/Z7ak2LWyqTI+kyq5AVib4
	 IGCaCQhrumE5PeTFe/0EQ6GiVIJcSM0gkPNlud1zuD7fkol/K7SGst7yc9baYwNQWh3Y+
	 Akcjdfv3WNxGG4jxF1YFT6Sm2RlQA0gWgxtygmE9x7fPPTjvSFkg9Hk5mR9pOmgIBRiHM
	 dnfwnWBsg1h8o2nQl5sjrJXiuTb4dRHi5FU3omqy7N/+JsByrZWZrOw9DV/RkTNR5OzvK
	 9H7+H9Ub/PBpQxiN5RuIBCSkhzPQx7EWfEea2YphOK1nSF/pgS2LSJwdofF1yxKjpNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWmJtSLJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908D9606A320
	for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWmJtSLJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107B41F000C4;
	Sun, 22 Nov 2026 07:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795333361;
	bh=aglOWT8PqMJ8KZc0H0xhTJmgM9QGQagAXjNL25z8qsk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jWmJtSLJwbFnLM4Qgr4BlTywvFLtBuYUzlQ0THm0hn1FXyR7QZFqSgu1vFSnt6TOz
	 9gqdrxO0KFxIkz8wk+u0CLUW72siq7uPFlw0KEw0EknpNImLBPUckr43Xk8Nf+E7oq
	 wUPlDEZV7rPjvYjcrd8FPMP78cy4I2tALGEDOPMDEqRmr/uDBpSYqi+f0xzwVU0Qcj
	 Gi4hxmRcwaAsJFIdIgXNX2pK/irflXpFKv50xp1G0N8aFSBYjhVvIUNPt9zBZD/W6K
	 cnuCcNIV+27mC7KxFk4RUp7H7XOnPib1Cw5mu/aCrPZRVjtaCBqi2kT/S7BTcdBGXk
	 TqtNZxop7sBIQ==
Message-ID: <sashiko-outbox-227792@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] leds: leds-mc13783: use unified device property
 API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Kurz" <akurz@blala.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261122073235.26707-2-akurz@blala.de>
References: <20261122073235.26707-1-akurz@blala.de>
 <20261122073235.26707-2-akurz@blala.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 07:42:40 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] leds: mc13783: incomplete conversion to unified device
  property API
- [Low] leds: mc13783: commit subject does not follow LED subsystem
  format
--

commit 93c8124da2ab3f4f36f3615c125e08a2dcba2624
Author: Alexander Kurz <akurz@blala.de>

leds: leds-mc13783: use unified device property API

This commit replaces OF-specific API calls in mc13xxx_led_probe_dt() with
unified device property helpers from linux/property.h.

> leds: leds-mc13783: use unified device property API

[Severity: Low]
This isn't a bug, but the LED subsystem convention for commit subjects is
"leds: <driver>: <Capitalized description>", so this should be
"leds: mc13783: Use unified device property API".

> diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
> index 19c1b51475db6..82b2062b2280d 100644
> --- a/drivers/leds/leds-mc13783.c
> +++ b/drivers/leds/leds-mc13783.c
> @@ -16,8 +16,8 @@
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/leds.h>
> -#include <linux/of.h>
>  #include <linux/mfd/mc13xxx.h>
> =20
>  struct mc13xxx_led_devtype {
> @@ -114,7 +114,7 @@ static struct mc13xxx_leds_platform_data __init *mc13=
xxx_led_probe_dt(
>  {
>  	struct mc13xxx_leds *leds =3D platform_get_drvdata(pdev);
>  	struct mc13xxx_leds_platform_data *pdata;
> -	struct device_node *child;
> +	struct fwnode_handle *child;
>  	struct device *dev =3D &pdev->dev;
>  	int i =3D 0, ret =3D -ENODATA;
> =20
> @@ -122,34 +122,34 @@ static struct mc13xxx_leds_platform_data __init *mc=
13xxx_led_probe_dt(
>  	if (!pdata)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	struct device_node *parent __free(device_node) =3D
> -		of_get_child_by_name(dev_of_node(dev->parent), "leds");
> +	struct fwnode_handle *parent __free(fwnode_handle) =3D
> +		device_get_named_child_node(dev->parent, "leds");
>  	if (!parent)
>  		return ERR_PTR(-ENODATA);

[Severity: Medium]
Should the CONFIG_OF guard around mc13xxx_led_probe_dt() be dropped and
mc13xxx_led_probe() check dev_fwnode(dev->parent) instead of
dev_of_node(dev->parent)?

drivers/leds/leds-mc13783.c:mc13xxx_led_probe() {
    ...
	if (dev_of_node(dev->parent)) {
		pdata =3D mc13xxx_led_probe_dt(pdev);
		if (IS_ERR(pdata))
			return PTR_ERR(pdata);
	} else if (!pdata)
		return -ENODATA;
    ...
}

Leaving mc13xxx_led_probe_dt() behind #ifdef CONFIG_OF and gating it on
dev_of_node(dev->parent) keeps a dependency on an OF helper after
linux/of.h was removed and causes mc13xxx_led_probe() to fail with
-ENODATA for non-OF fwnodes or when CONFIG_OF is disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122073235.2670=
7-1-akurz@blala.de?part=3D1
