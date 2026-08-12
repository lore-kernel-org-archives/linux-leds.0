Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1F63126D6
	for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786538863; cv=pass; b=T3iE10rqjTMbftG5GeM7GNhYXnOhlU2rZs8nb/e0VKOZbLUlXsupm4W31LepKn0vtfcByA0dp4MLiv9a8V3MDWu6BBbSSR69uChLDKEDfj6DHpjgufTVO5JvYXzGWvsDGZ5cD0hNHyldg91Za1YBqHaugsNa9tRH4pAJ/LGmNus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786538863; c=relaxed/simple;
	bh=tHk7slGgpZpmJWgZhrCe80uIO/hFyURoZgJG3Vq7VzA=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UC1zh01TOzahYpxDU0ZJrPxe4JWtToxhJD9FCmpHlXVZgrkePagnki7zU/aMephJkVFBPQtuwFZLR/WY/nfDcef129S3I/AY5wb6r7aJOk5n1YFceRK2exgQkWkCyCwTtnomInyZAunuP6KSr2xJPbmVexXYAyjw8kbHZNBc9RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=eMGS6mU7; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="eMGS6mU7"
ARC-Seal: i=1; a=rsa-sha256; t=1786538855; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F42/GTfErZPb+F4p4DWTP1Hyg/9Z+hcNSgjs37KXeaM+koOHdvjtcEXNDF5YKeM/xMLF1o5atyKkFsP8bg5mjfaN2RM3gjahOlNR97rsEWGWH5rm5DtGvSdo+VnTfXulq5hPHKdbtsK99MdU3aAttV/FX/wu1qWblobDRqMDd2k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786538855; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wdSuBoMQGcPtNruTObanq8jyIKnqIGXumw/rQEGLLLg=; 
	b=WFXQtOUfbnmo956OXOc2zg6FgyXv3X4aqWer9HCs9VTtAfHJbBowPpt6F+7TDgtZi/cTEfEcxOeTvV4ZhAucmV8XxIeWA1EDbLSHKhoKRcKnq7LJHrcV/kYoGapM26Xfbzg5kcNlDybTvBUKn2Z+fcn1uHKKBDcG7VtiXxsklg0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786538855;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=wdSuBoMQGcPtNruTObanq8jyIKnqIGXumw/rQEGLLLg=;
	b=eMGS6mU742yi9kiA664oFzU0+/jEsmcUfEa8spUVCc1Je6uY741g/o+OXhM9sxDp
	hezblxemf584WonF5YWn6qtppwp/WyCn3a+kKvPynBc22IvVnRiKPqxtYhKmitIp78M
	bhwT6Xz1qs71RstecUzwLB45gJlEvqW9cJzBPsiQH9Szwc2XKyLit9uiGNumY93FzJr
	F3H9WC+FZWCPRmb/kxAOeqOgEgISP8DCbtxCEdbCcKFvHiWtT3tRHvcroX+9WwGuvWL
	4RvTNedXHTo2kQUtvmsRpQmDFVLj7yo7QRDp1vFCnkZNK2dijO0rxKbC5052f5M8RQe
	oJKXwEQYYg==
Received: by mx.zohomail.com with SMTPS id 1786538853919427.98978997276424;
	Wed, 12 Aug 2026 05:47:33 -0700 (PDT)
Message-ID: <f979ae9d96cacd6375e1c296d550f2a469a6cbf9.camel@rong.moe>
Subject: Re: [PATCH v4 08/12] leds: trigger: Do not attach trigger to a
 removing LED
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260802173150.F31FB1F000E9@smtp.kernel.org>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
	 <20260802-leds-trigger-hw-changed-v4-8-f97e2ca976fe@rong.moe>
	 <20260802173150.F31FB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 20:42:27 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi all,

On Sun, 2026-08-02 at 17:31 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] Non-atomic update of `led_cdev->flags` causes a data race that c=
an drop the `LED_UNREGISTERING` flag, undermining the use-after-free fix.
> --
>=20
> --- Patch [8]: [PATCH v4 08/12] leds: trigger: Do not attach trigger to a=
 removing LED ---
> commit dd467951eb46d9ac1296845c072ca12344efe3da
> Author: Rong Zhang <i@rong.moe>
>=20
> leds: trigger: Do not attach trigger to a removing LED
>=20
> This commit attempts to fix a race condition where a trigger could attach
> to an LED during removal. It sets the LED_UNREGISTERING flag earlier in
> led_classdev_unregister() and checks it before attaching a trigger.
>=20
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 2460fcf0c4690..4158337896bc7 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -631,6 +631,8 @@ void led_classdev_unregister(struct led_classdev *l=
ed_cdev)
> >  	if (IS_ERR_OR_NULL(led_cdev->dev))
> >  		return;
> > =20
> > +	led_cdev->flags |=3D LED_UNREGISTERING;
>=20
> [Severity: High]
> This is a pre-existing issue, but does relying on a non-atomic update to=
=20
> flags here fail to prevent the race condition?
>=20
> Because led_cdev->flags is updated non-atomically via a read-modify-write
> operation, concurrent modifications to flags can overwrite and drop the
> LED_UNREGISTERING bit.
>=20
> For example, if a user-space thread writes to the LED's trigger sysfs
> attribute to remove a trigger concurrently, __led_trigger_set() modifies
> the flags locklessly:
>=20
> drivers/leds/led-triggers.c:__led_trigger_set() {
>     ...
>     led_cdev->flags &=3D ~LED_INIT_DEFAULT_TRIGGER;
>     ...
> }
>=20
> If this overwrites the LED_UNREGISTERING flag, the new early-exit check
> introduced in this patch:
>=20
> drivers/leds/led-triggers.c:__led_trigger_set() {
>     if ((led_cdev->flags & LED_UNREGISTERING) && trig)
>         return -ENODEV;
> ...
>=20
> will falsely pass. This still allows a trigger to attach to the dying LED=
,
> potentially resulting in a use-after-free.
>=20
> [ ... ]

I will wrap the RMW with trigger_lock in v5.

Thanks,
Rong
