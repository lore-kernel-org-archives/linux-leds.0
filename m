Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793706876;
	b=FhqHqauHyUvxD8ieL0hqjNE7Yk7nONcsTqHvZm8PFxCBnNllqxFA+rnRl8rsq0aw3NVR
	 lbVzvGSGm+PqcKksjcYyOkwSszF/sMxT29e9fHsEb3EOo2PRLWUJBAnBSNAgvhKouS6Kl
	 DAXMQNz9kcSpGl/SToD097EeFls1Aj0ItJsPzLWf2yo0dLVO+LEuJnSxBu4paSwQeK32+
	 3jFooOgSjR/o5lj1jBjdZi8ciTX7/PbB0JI/V4ZvRx4ymjlE6HDhC9maVmcUDFLlgMERj
	 RgvXQxA5yD5tRtxn9MfGUb+uc+s5EkrHhwL7UbsOhFVsgVJ0OesntNfbckfFJENaWgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
	b=WyG4p4QiS9qn3QYKS2Ys6Gv/lbKhnGv/gTb8YrwifnpGXCrekXIXuwVO98sw+l36XSgj
	 IE7K+mqHjKcvWGNNMNYX7mnNebORt/Bu6czOvAGKaZIgQueowdhvmxz78+1ezZ+/j0U/i
	 RChebVYBORmxUQXwEOFm0IBAS6ALhdjw7M7dh2V+9Zrt+975/5bZJnq9BACKaxOaeaAYA
	 AYnnxIlUHzKUyxPqTaIa/3e8OHXWuOObtx/pcZgYeNPMNTfs20mgqx98j0XUReq0LUwk+
	 Vjvi2J3a84Lame9uSUhk0YNj/rzH1J5guDw1g1tzH+NRUn1LwCeH0GSF60wb5MJOs6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qQm/Q4zd";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0CC606A326
	for <linux-leds@vger.kernel.org>; Tue,  3 Nov 2026 11:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0CC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qQm/Q4zd
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35b2c599f43so7151089eec.0
        for <linux-leds@vger.kernel.org>; Tue, 03 Nov 2026 03:54:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793706875; cv=none;
        d=google.com; s=arc-20260327;
        b=DrWQmcLB11l/+G8vMwTByrtiaPpoVW+TKxUgssV7iKjKuhc1xY3R5f1MiXjzxXmoUI
         HumAhH5LMrx4e/bz/OaAGMCWcmRsggoch1iRqCi5hDK38x2epUGs8aaeUBzerCCE5sjb
         TXmAOPDaFER+AADq0aMp4PCQIQe6ZJo60QDI+36V3G8s0Clazert/DIhhOdpPVc/yEOe
         F7uZYX3of4w447SPhIiSJhPhvhYetkOshpuOMbCG9YtXUp9Sg/1zN9UfITLH4wGVxd1a
         +xyAy8yp6fZxcVhhqJMFl48Z342k6Fw09wQRIIi+h3QoDsg6CmRRjJI+SyLZGLsdavFg
         jHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
        fh=mEZsFYpznkdsyAMApP6z+GHuO5EXHshSH1e4g9Z4xa4=;
        b=ReyBl6T4P/WpYnuvwJPhRuxaoB2zNhIP+cVHDcHHkeYhaklbxjO/iKBplTVE33PycF
         xY7u83NkVXr2SEBaD0A3zCd2Xb8+jfqJQzqrT/7D0BXh4KxrkNEKJTWbnvK/2JMi0yVm
         8I4IFToQUB76DhTebNSmbUbHDQmOJLgFl2VxndeRNRkoMNG11BZ2gKiZI64vE6K59iNF
         s9YMH0R6ODxVQVjxO3qm16sSDuIl5I+ugOlCXRy5fZ5i8NQu3fZsp+zzBdoeClfr7QAl
         iJwXEu/kEnKLjlTPxhEw2y19mtoMIo+bAiNip2Be+Q5E0/ZlGExVH3AIDuJiKitEivxR
         JuOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706875; x=1794311675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
        b=qQm/Q4zdJbAlItC8UuvQ+8FfXaJFfm/NaZyW2t8V7HiPJEKXbovYvJ8FlSKOYPQzug
         TMQwR+l+fPsCp3XP1Op2y+Qv0iA/q15TknDuAj/NpPmvPkR4N+AV3cQfzpEYsH+JrxUy
         bFS5wTy51SMkeVcDuCWAodPmxGIZStcEj84qOUhHRPfMiRphAe3I+LQSjW8sqo3Ygqb3
         uoAeQpSBP9Om9O0c7AT0NOhUHnYfWIBPyRrlE+wOA6ZtwackoIwwbqMj1iFXJGD8b3UR
         NnV18AIBEP7qZVCP+Pbc12ueclU7V6Z+P0gOUZEVIbgkJ/jZG785JkwfYy3WdWnQl4Gh
         /Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706875; x=1794311675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
        b=qwEPEFCJfgL+Cehj1QH5QEWVm3hPI6ybsXBNy3XFSU+aUu2ZOnXF3iJ+0cEd9BYqhx
         oVrHZdEFQbGKbmiq3qy+Tekzd3pzNF9psg7KeoFriaKtVPVUyZR7s6p+pERBwEI486a4
         wmgh90OOH1Q65xQviBR+M84OcrtNx7VCxxeMGovgz22OZFh9VyU6xw6vmydrmJNC52fS
         rjjh8in8OJmLz8IVTn2+vJHGaE5tGEm7mkTwqXurduPQ1kXkGjK67dyIZP4zJqfgvIzC
         R+y0bXGLH9fBxTcNuglyL60TNiLw5GuxmMTgAbBypzTEM6OYz0dERi27DNcnm6KRiClZ
         vC+Q==
X-Forwarded-Encrypted: i=1; AKwUvByGqqoInmNSDXd59dHvt84dNufy3/MNVKQSnETPve37ZW5rX4HH49s+XNp0lrZiQjrnpuhiyD1V/R9t@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pu8oa+R9libsOso1qUCKAA7oKwRHggEo3p4vfeBboB8Za+GpI
	yBhxwlcaYM74IoycpOz8SmJ4IcRBDuO/kQ2PQsXWLzrV7N+tjkuLk6q2GL8n5nf6eOLz4LeT72y
	8emC8D07MCXUwD1zYNWgmWlKs1NVE9hQ=
X-Gm-Gg: AYBFou1wis1hsNE6hWLqKN7t9fc3w17SLQFA64959vNrCDblNzt2icZzFaQNpIN5YAz
	oqrDbi4Gw+PQc6RahOXLlg6KL32jCafeNm29YNJl/mvoVtCmaTPCXrFd4uKyfKa7oqADBcjGi16
	z6HuGaqbZ3PD8Oah9bZfrQ9oPoLkgztaFV7Ua0n3hFOC0+5z1y4r/8i+B7xJoimZt7o47/xtkeU
	Rq5Ld56Pu3KvHXuzQqB9K1a5aVps4RVMJ0Lj7p4E1R4oB0v0Y5oAHNHKvc7R2ygv691zrgHwAam
	lCh0t+BjZXlkwfxj+yrRmTJn3dE09cTlIshxDGmypyLN08ToOjqD3aB8YlEV6upToYFF4rGoVdU
	M+wSxUKX9gaPdr7pQihYiXAvgKqon0Z/WzPxA+CsHpQv7Y2+4/CG3cOw/FlCLM3dcQRTGjA==
X-Received: by 2002:a05:693c:6381:20b0:36a:1d6a:596b with SMTP id
 5a478bee46e88-36a42412f55mr21504309eec.29.1793706874612; Tue, 03 Nov 2026
 03:54:34 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-3-clamor95@gmail.com>
 <179249578293.1833288.15514260998480602004@kernel.org>
In-Reply-To: <179249578293.1833288.15514260998480602004@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Nov 2026 13:54:22 +0200
X-Gm-Features: AclHuK9k-JPaNaa2w2wyQuHafuZvZgRRQXAbt-BGJRbzly4wj0XcizvF3rWabus
Message-ID: <CAPVz0n0kKRpOsUNxvUKiTPSY7bF3h+ruV05B+9jSvs9NOxthkg@mail.gmail.com>
Subject: Re: [PATCH v12 2/7] mfd: Add driver for ASUS Transformer embedded controller
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:43=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> --- checkpatch.pl (4 issues) ---
> Line 607: WARNING: DT compatible string "asus,sl101-ec-dock" appears un-d=
ocumented -- check ./Documentation/devicetree/bindings/
> Line 610: WARNING: DT compatible string "asus,tf101-ec-dock" appears un-d=
ocumented -- check ./Documentation/devicetree/bindings/
> Line 613: WARNING: DT compatible string "asus,tf201-ec-pad" appears un-do=
cumented -- check ./Documentation/devicetree/bindings/
> Line 616: WARNING: DT compatible string "asus,tf600t-ec-pad" appears un-d=
ocumented -- check ./Documentation/devicetree/bindings/
> ----------------------------------
>
> On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
> > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 dock
> > and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> > detection and common operations for EC's functions.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/Kconfig                     |  16 +
> >  drivers/mfd/Makefile                    |   1 +
> >  drivers/mfd/asus-transformer-ec.c       | 569 ++++++++++++++++++++++++
> >  include/linux/mfd/asus-transformer-ec.h | 100 +++++
> >  4 files changed, 686 insertions(+)
> >  create mode 100644 drivers/mfd/asus-transformer-ec.c
> >  create mode 100644 include/linux/mfd/asus-transformer-ec.h
>
> [...]
>
> > +static int asus_ec_reset(struct asus_ec_data *ddata)
> > +{
> > +     int retry, ret;
> > +
> > +     guard(mutex)(&ddata->ecreq_lock);
> > +
> > +     for (retry =3D 0; retry < ASUSEC_RETRY_MAX; retry++) {
>
> As mentioned on v8, 'for (int retry =3D 0; ...)' is generally preferred f=
or
> throw-away loop variables.
>

I must have overlooked this, appologies.

> > +             ret =3D i2c_smbus_write_word_data(ddata->client, ASUSEC_W=
RITE_BUF,
> > +                                             ASUSEC_RESET);
> > +             if (!ret)
> > +                     return 0;
> > +
> > +             msleep(ASUSEC_ACCESS_TIMEOUT);
> > +     }
> > +
> > +     return ret;
> > +}
>
> [...]
>
> > +static int asus_ec_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct asus_ec_data *ddata;
> > +     const struct mfd_cell *cells;
> > +     unsigned int num_cells;
> > +     unsigned long irqflags;
> > +     int ret;
> > +
> > +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_I2C_=
BLOCK))
> > +             return dev_err_probe(dev, -ENXIO,
> > +                     "I2C bus is missing required SMBus block mode sup=
port\n");
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     ddata->info =3D device_get_match_data(dev);
> > +     if (!ddata->info)
> > +             return -ENODEV;
> > +
> > +     switch (ddata->info->variant) {
> > +     case ASUSEC_SL101_DOCK:
> > +             cells =3D asus_ec_sl101_dock_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_sl101_dock_mfd_devices);
> > +             break;
> > +     case ASUSEC_TF101_DOCK:
> > +             cells =3D asus_ec_tf101_dock_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_tf101_dock_mfd_devices);
> > +             break;
> > +     case ASUSEC_TF201_PAD:
> > +             cells =3D asus_ec_tf201_pad_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_tf201_pad_mfd_devices);
> > +             break;
> > +     case ASUSEC_TF600T_PAD:
> > +             cells =3D asus_ec_tf600t_pad_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_tf600t_pad_mfd_devices);
> > +             break;
> > +     default:
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "unknown device variant %d\n",
> > +                                  ddata->info->variant);
> > +     }
> > +
> > +     i2c_set_clientdata(client, ddata);
> > +     ddata->client =3D client;
> > +
> > +     ddata->ec.dockram =3D devm_asus_dockram_get(dev);
> > +     if (IS_ERR(ddata->ec.dockram))
> > +             return dev_err_probe(dev, PTR_ERR(ddata->ec.dockram),
> > +                                  "failed to get dockram\n");
> > +
> > +     ddata->ecreq_gpio =3D devm_gpiod_get(dev, "request", GPIOD_OUT_LO=
W);
> > +     if (IS_ERR(ddata->ecreq_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(ddata->ecreq_gpio),
> > +                                  "failed to get EC request GPIO\n");
> > +
> > +     BLOCKING_INIT_NOTIFIER_HEAD(&ddata->ec.notify_list);
> > +     mutex_init(&ddata->ecreq_lock);
> > +
> > +     asus_ec_signal_request(ddata);
> > +
> > +     ret =3D asus_ec_detect(ddata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to detect EC versi=
on\n");
> > +
> > +     ret =3D asus_ec_init(ddata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to init EC\n");
> > +
> > +     /*
> > +      * Systems using device tree should set up interrupt via DTS,
> > +      * the rest will use the default low interrupt.
> > +      */
> > +     irqflags =3D dev->of_node ? 0 : IRQF_TRIGGER_LOW;
> > +
> > +     ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> > +                                     &asus_ec_interrupt,
> > +                                     IRQF_ONESHOT | irqflags,
> > +                                     client->name, ddata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to register IRQ\n"=
);
> > +
> > +     /* Parent I2C controller uses DMA, ASUS EC and child devices do n=
ot */
> > +     client->dev.coherent_dma_mask =3D 0;
> > +     client->dev.dma_mask =3D &client->dev.coherent_dma_mask;
> > +
> > +     return devm_mfd_add_devices(dev, 0, cells, num_cells, NULL, 0, NU=
LL);
>
> Why not use 'PLATFORM_DEVID_NONE' or 'PLATFORM_DEVID_AUTO' here instead o=
f a raw
> '0' and hard-coded cell IDs in 'asus_ec_tf101_dock_mfd_devices'?
>

There can be more then 1 EC in the tablet. PLATFORM_DEVID_NONE will
not work in this case and PLATFORM_DEVID_AUTO should work, but one of
EC is detachable (dock one) so devices there may need a fixed id. I
can test if PLATFORM_DEVID_AUTO works, but may this be sent as a
followup?

> > +}
>
> --
> Lee Jones
