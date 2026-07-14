Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062DA417BEC;
	Tue, 14 Jul 2026 17:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050953; cv=pass; b=q7Rhd31/g38GIHX25IyqMZ2N9gv5/u2/+U8JnXiwxaZHZX9RFk9HCPF2H1NAVC8MblpOg6pdNz/x6FfmOOwVbNEezlfb3UlNFtsxzF79lEyEtoMTLM53d1thUv8DghYmRqAr6igm1upOxCe1MkRbS2KSzBRKGoIKjYobqk33kqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050953; c=relaxed/simple;
	bh=PJQMiBoDQ4Gx4VSUeyERwpCBV/hFLWxXiJWOwFgoD3k=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DGTe+iXT3dm8KbKckTXg8x9cFh50ydI1fDsH/Dofu7t/2Dr1wsI8pvWcAIH5CVKXf0WAkPOMwx4H/VZn+CdBzog1r+BEtq8yp4leSQEn7oGV6tkVOoQriYWIF1eXWo0HZmaVU12w/MmZ2789C/8XaSNusNU42BD2kWr6nxZBm2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=PB1w2fHv; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="PB1w2fHv"
ARC-Seal: i=1; a=rsa-sha256; t=1784050933; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gR2s5iQJ+t8YUxwOKCv+dM+ESf7VDbyt53sk/q0/SH0f6dWy+22AVtocbxSX7gNt82ElqFgs9lJHz8XSMdN+hkh6JJrK6JL6SGzrk+B54FWq8213hrEg/y+gFzCSPmMT6wmC9gc59Gx4H9UK1pd0hf5EMB+n3mI7nidYEu21mzw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784050933; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4tGkI11D7DTEyQAblb/tV5Kx06tzVp6l+fi7Ui7d7us=; 
	b=ZdfUnEEqfqjBR1J5LFtiTtTzft2oQjI3wepTKYPDB5XDMquUUvaKxEqXp2Ho8FLEvCUNxMq0KDKmDIRwu+A6IoZcUaIW4AfCdzkbCCHDb11n07ljzNa8Ks++WEV0IFW0esGff2RuiP/9NiFgMre2K+8Bo7YSmaRzMdVpE8EGweY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784050933;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=4tGkI11D7DTEyQAblb/tV5Kx06tzVp6l+fi7Ui7d7us=;
	b=PB1w2fHvCKh5Yd2y/uWMZ4uv6Ld+ykQLM+zfUmyqth9TF0xGNPi/05tOZrqG/+sd
	54c/8obKytwzhVsMf1lxpb5JjiW+dIF8Fk6u59Re3iTOtIryM9FrmrQE0nFQcR6vweg
	hlY3wgQQlxOC3G9gJY/OxN2uwe228F+A3dZrzdbzgC9JpFPbIDLE/btcdqb42AVlMbL
	WH9dgbR7uLDZrFIfK86DfBjZ+iYZGQ9uKcto0a1kNF9XuByTd9oY/ZA42JOHVoeeKQj
	3z2DNXDCZp/WRSg204UVqEMc0awjrGY+hy35npDPTLP3jftqUbpCK801BKeJFKNk/7X
	Ki8RUEfVpQ==
Received: by mx.zohomail.com with SMTPS id 1784050930140452.94635249061605;
	Tue, 14 Jul 2026 10:42:10 -0700 (PDT)
Message-ID: <058dc5456dd8ab4620d4b0e4ba829eb492d1ebb8.camel@rong.moe>
Subject: Re: [PATCH] leds: core: Disable hardware control when writing
 brightness
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=
	 <linux@weissschuh.net>, linux-leds@vger.kernel.org, LKML
	 <linux-kernel@vger.kernel.org>
In-Reply-To: <20260711185219.2BF991F00A3A@smtp.kernel.org>
References: 
	<20260712-leds-hw-control-brightness-set-v1-1-1de593b09d26@rong.moe>
	 <20260711185219.2BF991F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 01:37:04 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External

Hi all,

On Sat, 2026-07-11 at 18:52 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] TOCTOU race in brightness_store() can cause unintended removal=
 of a newly registered trigger.

I will integrate this into my hardware-initiated hardware control
trigger transition series [1] to make things easier, as it will anyway
move and refine led_trigger_is_hw_controlled().

[1]: https://lore.kernel.org/all/20260618-leds-trigger-hw-changed-v2-1-c28c=
44053cf3@rong.moe/

Thanks,
Rong

> --
>=20
> --- Patch [1]: [PATCH] leds: core: Disable hardware control when writing =
brightness ---
> commit 86a852e7c49262f7479b1653712185d4edd86c24
> Author: Rong Zhang <i@rong.moe>
>=20
> leds: core: Disable hardware control when writing brightness
>=20
> This commit modifies the brightness sysfs attribute to disable hardware c=
ontrol
> when written. It addresses an issue where the brightness attribute become=
s
> confusingly write-only while hardware control remains active.
>=20
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index a51b0ed538864..3e25e5fb63dc8 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -72,7 +72,7 @@ static ssize_t brightness_store(struct device *dev,
> >  	if (ret)
> >  		goto unlock;
> > =20
> > -	if (state =3D=3D LED_OFF)
> > +	if (state =3D=3D LED_OFF || led_trigger_is_hw_controlled(led_cdev))
> >  		led_trigger_remove(led_cdev);
>=20
> [Severity: Medium]
> Could this introduce a race condition that removes an unrelated trigger?
>=20
> led_trigger_is_hw_controlled() takes and drops the read-side of trigger_l=
ock:
>=20
> drivers/leds/led-class.c:led_trigger_is_hw_controlled() {
> 	...
> 	guard(rwsem_read)(&led_cdev->trigger_lock);
> 	return led_cdev->trigger && led_cdev->trigger->trigger_type;
> }
>=20
> Since the lock is dropped before led_trigger_remove() acquires the write-=
side
> lock, is it possible for a concurrent thread to unregister the hardware
> trigger and attach a new default trigger in the window between the check =
and
> the removal?=20
>=20
> If that sequence occurs, led_trigger_remove() might inadvertently remove =
the
> newly attached trigger instead of the intended hardware trigger.
>=20
> >  	led_set_brightness(led_cdev, state);
> >=20
