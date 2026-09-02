Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A837EFFE
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375127; cv=pass; b=elqKgy7PbY2Nk09cSVt5pVHvkxLaCX/3+iviDn+86Kr/IBK45HSMeldav4PD1Mw0wS+05QD+T85r4wjZk01unvmHta7/kwvXkfIH12o8vP/2vXaVETg6C/koxkj2MFqWXkoTLxQoKyEGCaOB7V7urme5rV+bI9+DZ0S0K2MUazI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375127; c=relaxed/simple;
	bh=SNM7n/cSrhh9wyufQvqKzlyvRyVgBxSvDXsLZ1h6Wp8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CvzTIt+SyJ2wHDbr8denw72hluJWvloGK45ABFPqzv6MIKjBP4qxXBIs3QDFKByBCLUizVOf3mpSM2TsR8ygxspTVzrM1TBDcQsQ1K+yP3FTV6JQ9gLL8p+EoEHMz2dc3FuEyyG8JW5tEqYWCwwSK/Bv2S99ZM6ifzRg1WMdcHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=GSt/mBeS; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="GSt/mBeS"
ARC-Seal: i=1; a=rsa-sha256; t=1788375119; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pl8xHkDixholXnSgYMFlLAaIYpy7N8Nx4DZjD56b3Fg4hj2K/ivpGXTuqVUVaMcpcMhefVoFssMjcfXTyNAjNh/b1sUXnzgWLk95neQBIs7SGR69hnbWxnRAc9xX0TovlYv8jituZ2u5lYtRVvpwwO/eKhG2ztYANloOdnjjzzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788375119; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=z8XjgZhhsAVFX4rdlhH1UUBseLSKB3vLx7nCKz92cJI=; 
	b=SWdstyJOxRb50hBfkWi1jot3mAJikI8NidOC0EM8MbAWrEsKlJp/OcUra5UmlyJ8c+/GijuXsOEpbJm1oUmlq/AxKG4ZloqmZq3Nhy1tyVaA0YREMcCCE7cDVqAVP+p+S43CFc9cn9Z+VL8bqrRHMfAKyUiBZIMzqbLiQrz/tFA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788375119;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=z8XjgZhhsAVFX4rdlhH1UUBseLSKB3vLx7nCKz92cJI=;
	b=GSt/mBeSj0rsciet5+xjYX+7oMzGQwHlEugTW3onmGDrdDvbeKZNCnDDpOahwmvw
	OiL75oZwjnUbfdGu3NVAsmkOiqf6uFTXvBaF3Qaaj1DIlOOkmnd13PYsKqDZO3Gb/Mk
	HVdPIbdVhdNayCCMZsbvZ8vZJ5Hi/SU195ojwcqBSOXlBA3H8J2LesVEIA7D7ci6lCP
	N1w8sCykjyOIHEFLTis431PdYfI6kMx5lL4pRslc/NO8TetI1B1le0EnTcR+WfUc/AS
	G7YcWmbUDbvCtfeFZehpplbS8JQQuJA7Y2MXWIqoc6Aqg1wVN7TCWNrPEbhhV+e/m+h
	3NZ4zpmznQ==
Received: by mx.zohomail.com with SMTPS id 1788375115736428.8685839472437;
	Wed, 2 Sep 2026 11:51:55 -0700 (PDT)
Message-ID: <b561fa4e402c8a41a52a46fc70f39c04e7c5cf52.camel@rong.moe>
Subject: Re: [PATCH v6 06/12] leds: turris-omnia: Implement offloaded()
 trigger callback and declare hw_control_trigger
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902181555.258DE1F00A3E@smtp.kernel.org>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
	 <20260902-leds-trigger-hw-changed-v6-6-55693cd78877@rong.moe>
	 <20260902181555.258DE1F00A3E@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 02:46:15 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Lee,

On Wed, 2026-09-02 at 18:15 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] The statically allocated `omnia_hw_trigger` object is registered=
 multiple times via `devm_led_trigger_register()` on probe, causing lock an=
d list corruption if multiple driver instances are bound.

Real hardware doesn't trigger the pre-existing issue, and the series has
nothing to do with the issue. Therefore, fixing it is out of the scope of
the series.

Thanks,
Rong

> --
>=20
> commit 836486b7bf6dc3bf19d25d5b547db0edd0d638af
> Author: Rong Zhang <i@rong.moe>
>=20
> leds: turris-omnia: Implement offloaded() trigger callback and declare hw=
_control_trigger
>    =20
> This commit implements the offloaded() callback for the omnia-mcu hardwar=
e
> control trigger, returning true to reflect its state. It also declares it=
 as
> a hardware control trigger in the class device during registration.
>=20
> > diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turri=
s-omnia.c
> > index ed6a47bbb44f9..32d40d176d3f1 100644
> > --- a/drivers/leds/leds-turris-omnia.c
> > +++ b/drivers/leds/leds-turris-omnia.c
> [ ... ]
> > @@ -195,10 +195,16 @@ static void omnia_hwtrig_deactivate(struct led_cl=
assdev *cdev)
> >  			err);
> >  }
> > =20
> > +static bool omnia_hwtrig_offloaded(struct led_classdev *cdev)
> > +{
> > +	return true;
> > +}
> > +
> >  static struct led_trigger omnia_hw_trigger =3D {
> >  	.name		=3D "omnia-mcu",
> >  	.activate	=3D omnia_hwtrig_activate,
> >  	.deactivate	=3D omnia_hwtrig_deactivate,
> > +	.offloaded	=3D omnia_hwtrig_offloaded,
> >  	.trigger_type	=3D &omnia_hw_trigger_type,
> >  };
>=20
> [Severity: High]
> This is a pre-existing issue, but does this statically allocated singleto=
n
> trigger cause list corruption if multiple driver instances are bound?
>=20
> If a user manually binds a second device instance to the leds-turris-omni=
a
> driver via the sysfs bind interface (or multiple I2C devices probe),
> devm_led_trigger_register() in omnia_leds_probe() will be called again wi=
th
> this exact same statically allocated omnia_hw_trigger structure pointer.
>=20
> In drivers/leds/led-triggers.c:led_trigger_register(), the core initializ=
es
> the lock and list head before checking for duplicate registrations:
>=20
>     spin_lock_init(&trig->leddev_list_lock);
>     INIT_LIST_HEAD(&trig->led_cdevs);
>=20
> Wouldn't this blindly overwrite the active lock and list state of the
> trigger, destroying the lock state while another CPU is iterating and
> unlinking any already-registered LEDs, leading to a use-after-free?
