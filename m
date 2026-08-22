Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4043594A
	for <linux-leds@vger.kernel.org>; Sat, 22 Aug 2026 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787425355; cv=pass; b=pRvNt5ZzgIMY6iYf/Dm2mWyfdaT3/tewLEhNuTCKYVVoi2ECB3aVaC2KhJKnnrAvmaRPCqyoBNwEM43pZKklmBu1K7zkx8CDEe84gHNTqrw6JH8yTbNc8b+fi0dJ6Mxt3ZOi1voXYREwTccOR6tdHe5wWJ493tCcFZnTMzIxqVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787425355; c=relaxed/simple;
	bh=Jiu6/g6jl6jBwGuV5DI4t3FXuwZ//Vycr829RgQco5Q=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EylERdTiBgW8MpEX3r2vjRsQ2oK9wUPl+9FzwwwzNYbEtccKypU19159VlzWiwpttojFC8fhoFl2CwIEug2QUvaDVLRUZYVSsbQiEI9wjIq/EXJkYqeiy3M001m/TrsidU0JHz3xuJcmw+/TabB/heO56cRlYsnReyLh6b4rDZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=mlzQTaQa; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="mlzQTaQa"
ARC-Seal: i=1; a=rsa-sha256; t=1787425348; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NTdc1B/ypodl3/19JIY7n+yxXvt8rUxRfItlHrjj6uPdye/84SIwS3Ef3KWDMYezbFNxiBAzGw7GY01ootz5jNb0FWmq9PmENI+yIg2M408vfkW5foNMqbykRaeLtv/6sB2/971BlM+oDyyqYx0duhywwMK1Xu/1ovKj8unOSRo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787425348; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HD5wrNL7bc3FrPJ0tcQOYitpLY1NnSxexAE7kiEi+X0=; 
	b=jBnIlMYfzVKmThQ2YIC5KBo+PXZJ136/zI1hK0NhLkVwbgqZv/dxtCw0L2QqX9ELqs8XhlMbXVaPlDmtOOk2uJkGmzkonqpLrInWgzUPwFUFfAUKeYHWWp9NZmIvrtfbKPf6A4zUBKKfUnKUhXD9AiMGVVWsbVwitTEyJo2O0sg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787425348;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=HD5wrNL7bc3FrPJ0tcQOYitpLY1NnSxexAE7kiEi+X0=;
	b=mlzQTaQa/oCZckI/eC35pY7a3KkAoMlHugL7TQIVzHVfjNpoCe3q1QhZEtjkdPqx
	N6eFKB3A9s0K6+hqIWiD+BUqN6qDHoblQdsYUa4kFaZGP2r9OQSennLXRMYzPk/ECAX
	FRPztFo9bp2xo2j/CBw5RQYdlOSAIAFtvH0JxhWMl8iU2fU96VLHLlJkca/c+3exzO3
	Uy7WFpC0MdPD9N7xZg5t/0JIMiGPRS0yCjK6AB6YpZu0VxhhhdBvALP5xVqL7dJgYJC
	RI1kjHAKE562oD6W6y7fegWHsIoEXf5JQ1WCWq/eZr9nGNS7M/hDOhe6PR1HXR5sLru
	pm738wYEBQ==
Received: by mx.zohomail.com with SMTPS id 1787425345858700.6152371031092;
	Sat, 22 Aug 2026 12:02:25 -0700 (PDT)
Message-ID: <aa4551dce295a458fd7f7070385d33c70e52ba59.camel@rong.moe>
Subject: Re: [PATCH v5 05/12] leds: turris-omnia: Implement offloaded()
 trigger callback and declare hw_control_trigger
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260821172737.287FC1F00A3A@smtp.kernel.org>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
		 <20260821-leds-trigger-hw-changed-v5-5-3e00d6c4a936@rong.moe>
		 <20260821172737.287FC1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 02:56:59 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi all,

On Fri, 2026-08-21 at 17:27 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] The statically allocated `omnia_hw_trigger` object is registered=
 multiple times via `devm_led_trigger_register()` on probe if multiple driv=
er instances are bound, causing lock and list corruption.

The driver is very platform-specific and the relevant platforms never
have more than one such device.

Therefore, fixing it is far beyond the scope of the series.

Thanks,
Rong

> --
>=20
> --- Patch [5]: [PATCH v5 05/12] leds: turris-omnia: Implement offloaded()=
 trigger callback and declare hw_control_trigger ---
> commit f8e07428579f0c7761609a5c572f8b597a213a09
> Author: Rong Zhang <i@rong.moe>
>=20
> leds: turris-omnia: Implement offloaded() trigger callback and declare hw=
_control_trigger
>=20
> "omnia-mcu" is a private hardware control trigger which always stays in
> hardware control mode. Implement offloaded() callback with its return
> value to be always true to reflect this.
>=20
> > diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turri=
s-omnia.c
> > index ed6a47bbb44f9..32d40d176d3f1 100644
> > --- a/drivers/leds/leds-turris-omnia.c
> > +++ b/drivers/leds/leds-turris-omnia.c
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
> This isn't a bug introduced by this patch, but does using a statically
> allocated global trigger structure risk lock and list corruption?
>=20
> If multiple instances of the driver are bound (for example, via I2C
> `new_device` sysfs bindings), `omnia_leds_probe()` will call
> `devm_led_trigger_register()` multiple times using this shared
> `omnia_hw_trigger` object:
>=20
> omnia_leds_probe()
>     devm_led_trigger_register(dev, &omnia_hw_trigger)
>=20
> Inside the core `led_trigger_register()` function, `spin_lock_init()` and
> `INIT_LIST_HEAD()` are called unconditionally before checking if the trig=
ger
> name already exists. As a result, the second probe call will silently
> re-initialize the active spinlock and reset the list head of the first
> instance's trigger, which could lead to a kernel panic.
