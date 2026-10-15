Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D0E2C21F7
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075731; cv=none; b=CPaOk6Sg1OkZ4lheuvBaE1qucw1BRvsCo1lvggp/mmvJLbQy4kugOvN5342d3KGv48jycMTyEBfO3X/bdXVA7Ezn57xCFqtSl8GxQvRbBAvOFjMifdY9i6B02eOIvyTN7u9QQHUv1TsX+TiJNSNzPYKna+daEMeR22RG8ELnJy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075731; c=relaxed/simple;
	bh=8T9WZmyrgiIjpD4j4SECaM+w+ZhVmi4IhmjzTilrNFY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WH/eAUahb8rY2AxQc+fcNCwRMe5DTCknvmn5RPoQu5FKT75k7uviG4LgqshMcd2ZvnN/UgGCdqgzTVvh9Kzzt1KnFoMvqoM0KheXkIiMrxjUMJ1qTKCGZR+60ayUgXkBRlLqGzG1/X/nHpcbrzei1y2SyFOuR7Ptqe59E9p5bK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiAysanW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiAysanW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B92F1F000C4;
	Thu, 15 Oct 2026 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792075730;
	bh=Q9YzuHZfySbbLil2K+Y6H+K09O4t5H3fvsXFc482PUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EiAysanW9QD1ys5leqVJENQhG5LRLNHebYT7AXZBvgsM86RcCcIgnwJwiw3l7mIUi
	 L7FkMBHRIuXIkrc9Cj4TuBO1VuYHFkGDONc3fHeGJ5IwRPOF2VPMdNSg3ll2KwMlmm
	 7dPEgOoTLaIm0X40xa6r2wrbvjsPyWW9mlxmG2j3A1NgiRnOw7C67T7RCu5nbJsfAl
	 Dx7ctp15I1UNhTnYKkFKlGv2od30Ql+uriA+aBX7BEFGTnZFiHupmIE1ogaQAxuNjv
	 s/r1vS5ki8MSI7Jd+ip28YDG1RxyA6ZjV3QWJ75Oj8EJzakTpn5pR93/irISEwtj/k
	 BF4gWqnDSEQXQ==
Message-ID: <sashiko-outbox-172992@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: tca6507: Fix use-after-free on unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danish Khateeb" <danishkhateeb03@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261015144033.56519-1-danishkhateeb03@gmail.com>
References: <20261015144033.56519-1-danishkhateeb03@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 14:48:49 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] leds: tca6507: devres cancels work before LED off commands are s=
ent
--

commit 26c3a76d710837c5d81cb4e74292b31880a4a3d5
Author: Danish Khateeb <danishkhateeb03@gmail.com>

leds: tca6507: Fix use-after-free on unbind
   =20
Set up the work with devm_work_autocancel() before the LEDs are registered,
so that devres cancels it after they are gone, and drop tca6507_remove().
This resolves a previous use-after-free.

> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> index 9afe2722986cf..0f987e551f03d 100644
> --- a/drivers/leds/leds-tca6507.c
> +++ b/drivers/leds/leds-tca6507.c
[ ... ]
> @@ -735,9 +736,11 @@ static int tca6507_probe(struct i2c_client *client)
>  		return -ENOMEM;
> =20
>  	tca->client =3D client;
> -	INIT_WORK(&tca->work, tca6507_work);
>  	spin_lock_init(&tca->lock);
> -	i2c_set_clientdata(client, tca);
> +
> +	err =3D devm_work_autocancel(dev, &tca->work, tca6507_work);
> +	if (err)
> +		return err;

[Severity: Medium]
Since this devres action is registered before the LEDs are registered later
in tca6507_probe(), doesn't it run after them during unbind?

When the driver is unbound, devres will first unregister the LEDs, which
sets their brightness to LED_OFF. The driver's brightness_set callback
will queue an I2C transaction via schedule_work(&tca->work).

Immediately after, devres invokes the devm_work_autocancel action, which
calls cancel_work_sync(&tca->work). Since the work is still pending, it gets
cancelled before it can run, meaning the I2C write to turn off the LEDs
never occurs.

Although this resolves the previous use-after-free, does it prevent the
LEDs from correctly turning off on teardown, causing the hardware LEDs to
physically stay on after driver unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015144033.5651=
9-1-danishkhateeb03@gmail.com?part=3D1
