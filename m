Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700028;
	b=CuBkH9Y2w1HBSwTBMfcds3HMVkzWjPM/9TC3mdHnhJkCZD0MQaO4S9Hqs4HpUHdgW4iH
	 vzYEMr5s/C78ZH/IhecltF4T68ww1ZoKWw9q7kgVN6IpOnmKJ2Th2siNN5O9T75e9sJeR
	 eCtuv03iT51WDzTDIIKzKJ/4AF0Y2e0nTcYGv7HspX3mFTxczrYmNU+3+8oAToXiIy+A2
	 ldXbAuWfFswSJQW3ZFK7jAiHm1xZDjRkAi1y+f+/Jm6O1Q2GPBzI2ghlFPpI5pGOTsh/9
	 LJUfuJHV/eU5uDoIVkzGdmO1j6V5PsAoO2JGQBhTxf/4jqz805oOY9bOL3RjMldWPtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o+w9na3Dm0iXLiV6eN1IleBLsYb9pJlb3dPAHei8oVU=;
	b=Nz/JmsCbr7wTJyhIqIw8RC5/RprKY6QeaUQqfJyVcZ3w0FxRM5WTjBOLg7Mq4zzUjDSh
	 yoJbQK/aZKvW14hd+CsVDNqBUWZ7n4fGMi1bOecS5wktImuzgJ2/SY0szNLyvrZ54McIS
	 tjF/O+XL/3LiTzz4ezE/MY+vxId4WF6L5vYU4aooOLQWVS8mJaUbjjoxv+IhjN4uJpN3V
	 3d48lPQP5Q6LQrunlxN0iO37qQgo5OrZHZy3eDOidA6pEQT1Ky326faD30a5gF0hgh36P
	 sDOr5xDh3HxYH+kbSEgtZLq2JVvAftfSTZWEXvFjIDwH/lpeH91TYl25WGQsW4jmaTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jwn8pR6v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53463606A33B
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 13:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53463606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jwn8pR6v
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so8245108d50.2
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 05:33:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795700025; cv=none;
        d=google.com; s=arc-20260327;
        b=OUrMQ1gzytLka49nZDI8LS4+IkwrX82xuWYOkSY8WQneZDJHWNJshnZNbjjzcAF/RJ
         tZjvuePnZPDmut7RB1dhIE4ABLVxhgvvP2fouqYZPGzA5HuqDCCTb4wa/RXDG8UR+1+z
         I6O7AGtRJbCshEdhMox+ggL4kjai7P55BRu//FrsRWCdMtWbhCzsTeX2EbmNQvi3gYrH
         W6uZBt3s+ZF/2KB6BwOOfs7W/iMReWoJOV++H4Lf2mqJASuHH1IoX28eA/lf3gbhZ6l3
         U8aEj8EGoHm6E0yZBHfnjLXJi7Zm3rEL4t3f1mZYFpWATXhL/JmwUZdlXgxPbAJYa+E6
         cQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o+w9na3Dm0iXLiV6eN1IleBLsYb9pJlb3dPAHei8oVU=;
        fh=ybYYmkS6YDkJrrWoSHpssOYAOdsV7TxuxpXnVUhh3uo=;
        b=kEyZdRAiE4rIKFNFUreGgNtZG0ShHJBChuJDa7hRmQDpAFNKD9t0E6X4jOcvW2CY5W
         8CK59ydFoCluvXKRIrCzWmq4iQXVaK7RDm0lzAsbLgAD0iJPSdfAOrZF3z3O6AzVbVA4
         NuUa41YS7mVGkAj8BQDOiH3jcDRlwWKRd4fi7XirouhoZxBKd+maUUwDizzIyXdMzMtN
         lVLf04hQc3ga/YuUG53epNJSHxueNdKkuQB37JDqhEaoA8YHJ65DzSXSABL4m6mQSBg8
         XA93m7MyO4PGGCtEyH1K2sZtqTEPL8cwySPyCPrwMNAI9rwQQx8jIqqfTu/m4cWDehGC
         2f7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700025; x=1796304825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o+w9na3Dm0iXLiV6eN1IleBLsYb9pJlb3dPAHei8oVU=;
        b=Jwn8pR6vmsf+0mDrZth5acvw0IT6hXM1umTNJm9mxjOe4DAbFXZQtGiV7+XLKzIk2K
         V0yefDMeo7SzZWh7yVGW4JRg1vMHU6WykVNDQmI+VkOTgZ4girLRHZ/6Plzc5Wodx7XP
         mn9d8OvoqMlEgf0JKNU3NCXg4Z4fMUcHS3wpJirdCpz31PayP4jwh26KU41L6FdH2a7M
         RHWCx/XDbLCtoOZrcsZJS+DCbDdhhqe9E/16fXvybrHThRAP0JyWiyq2gdpJ6iMlpn9c
         kFruCn0EQ/PAPVE0gPqdnG7eYU6n2jOOPYSnyg5Bou+K3mXyVq1x2+GxdDp+GfPidFRf
         E4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700025; x=1796304825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+w9na3Dm0iXLiV6eN1IleBLsYb9pJlb3dPAHei8oVU=;
        b=CXHIBx/AWD8w0cWLgi8iqz9Tw3TpGcfQ50GZilOuGq+CE4MoZtEOtkCR7sbj7FMlb4
         qfSWuVG22LwheGyEwPgyw6QsmIItc0J9345L0j73HrSAMdyjle9/3JF8DDXrVaWiH7jc
         5ZLLwfGC3i30rZvwGw0QLGQH3CXDL+e9swmAGvyn752xXJ5HzEWciW0rV6tTdczcKtYK
         nwGQbq/ATWVCDguyc3NGQUR6FrHhRiI1ingUK9wz2LRsyrhUAMZvl/vYG/F/UFFaGDaD
         uirruGw25zh6j/Ds+Q9Elfisug33hpsLF8VVxv6pIdMMz95pvhGybb5w931VnOqCVtmO
         a4rw==
X-Forwarded-Encrypted: i=1; AL+hErGjOWNZn6qzuEupODfjYpsgqwEyFHUNEAeTGIV4uxwfpoO6HBtONo2BgpROFQ5rV/UWnul/FJ3IhnSP@vger.kernel.org
X-Gm-Message-State: APuU4Z8s/+RFxfyfpBT9gZeP+HqbRVOOakf9ttLT+mokc/V6sms7/2LB
	cc26zLtlvZIMwuzTH5GXk8vxPHvK+eYXZeGMMgjVMT8t90g9NiFQupNtBf+VniXyhF1+qOtmc29
	8qrsH2jwc1qDRBfBeuWvKtlJDBeDyIYc=
X-Gm-Gg: AZFdTZexiBbcfPlBBRWyedI6G5+BrUqrBGBkRmnXe2EA1UsuOgzrtGLwwbG7Bne7IpR
	b2N/QJuJ2KdU4NauDzFA0nu1hNqfNqQaZSAv44LLYID/lQaHEBCSlvI+V/kDu98EmoEIeZpnz+R
	gOLsNVARHdBbzoHEUjar93XS2ACXxEkRhuXuVyPdwd2qPW7PEJ4aApR8plKiMAspSU9qeM+WZg6
	rFcgvA++Vv3C7d5UOiii8iO027esbWAAD67rmXLiQCd9WrcDuo/rXOvvyfe5Vgwx63M+DxeKvwy
	DlrFqUJ5Vt+bFdJyT5XVFzP/FUbVQakiKv5pHZrffkgXx4vq4EkJoJiWzTmxq1cZR0zC2ue6O1g
	Pyae3C2hsxBuLodRrdNBUkEEBkLKQvfeufxrbmqgkweXIVyzeuq0s7iDRaZPuprghntSx8g==
X-Received: by 2002:a05:690c:6509:b0:8b4:d91e:cb44 with SMTP id
 00721157ae682-8b5205182e6mr76681007b3.99.1795700025331; Thu, 26 Nov 2026
 05:33:45 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125134013.2692510-1-congnt264@gmail.com> <179568529013.32537.1835646355373713109@kernel.org>
In-Reply-To: <179568529013.32537.1835646355373713109@kernel.org>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Thu, 26 Nov 2026 20:33:33 +0700
X-Gm-Features: Aa3M54risPbKGlw4_Lxp4z3wK17UbZAPBMa16CedsPvxgFPM1PhE07GpB9RQT-U
Message-ID: <CAJpJ=Gvs08=k-VAnAB1-DsB6a_kc9T5Mn4ooxfgyELQZH=Cs3Q@mail.gmail.com>
Subject: Re: [PATCH] leds: sgm3140: Put the child node reference on success
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Luca Weiss <luca@lucaweiss.eu>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 7:41=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Wed, 25 Nov 2026, Cong Nguyen wrote:
>
> > sgm3140_probe() gets the LED child node with device_get_next_child_node=
(),
> > which returns it with its reference count raised. The error path puts t=
he
> > reference, but a successful probe returns before reaching that code, so=
 the
> > reference is never dropped. The v4l2 flash sub-device takes its own
> > reference on the node, and the LED class device only stores the pointer=
,
>
> As the commit message notes, devm_led_classdev_flash_register_ext()
> stores 'init_data->fwnode' in 'led_cdev->dev->fwnode' without taking a
> reference on it and led_classdev_unregister() subsequently calls
> fwnode_handle_put(led_cdev->dev->fwnode) when the device is removed.

Hi Lee,
I could not find that call. led_classdev_unregister() only stops
triggers and blinking, turns the LED off and calls device_unregister(),
and device_create_release() just does kfree(). The only
fwnode_handle_put() in led-class.c is in fwnode_led_get(), for the node
it looked up itself.

>
> So 'led_cdev->dev->fwnode' takes ownership of the caller's 'child_node'
> reference on successful registration.  Dropping 'child_node' here on the
> success path causes a reference underflow / use-after-free while the LED
> device is registered and a double-put on unbind.
>
> In fact, there is already a bug on the error path if v4l2_flash_init()
> fails after devm_led_classdev_flash_register_ext() has succeeded: 'goto
> err' drops 'child_node' once, and then devres teardown calls
> devm_led_classdev_release() -> led_classdev_unregister() which calls
> fwnode_handle_put() a second time!

v4l2_flash_init() takes its own reference on the node and puts it on
its error path, so the one 'goto err' drops is the probe's. Other
drivers drop their reference right after registering, for example
leds-lt3593:

    init_data.fwnode =3D child;
    ret =3D devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data=
);
    fwnode_handle_put(child);

Is there a path I am missing?

Thanks,
Cong

>
> > so nothing else needs the probe's reference after probe returns.
> >
> > Put the reference before returning success.
> >
> > Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> > ---
> >  drivers/leds/flash/leds-sgm3140.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/led=
s-sgm3140.c
> > index 107d02c3137f..5bc21b192d74 100644
> > --- a/drivers/leds/flash/leds-sgm3140.c
> > +++ b/drivers/leds/flash/leds-sgm3140.c
> > @@ -273,7 +273,8 @@ static int sgm3140_probe(struct platform_device *pd=
ev)
> >               goto err;
> >       }
> >
> > -     return ret;
> > +     fwnode_handle_put(child_node);
> > +     return 0;
> >
> >  err:
> >       fwnode_handle_put(child_node);
> > --
> > 2.25.1
> >
> >
>
> --
> Lee Jones
