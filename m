Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591BB4C752C
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050900; cv=pass; b=gwQyUCkuc0uj3OldykN8hb6RMOI76wBjHFPHGAKvndekT9dr3a/cMPMZk1b3LRJ6VcaE2GSqWZr29XVmriMBJMcUdhe5wioCzVQcUwMwpIYSR6clHcB1MM/+bQJKItkk/oXIw5u+fOkxXx+hZ6CSY3sEiOzkcw2u0twr9RYXPqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050900; c=relaxed/simple;
	bh=QUhjA9hwUmTXGUjT356rZPUadcbJKMeW3gD2q9pu7ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RB/GrXwAyuAczjs/fDbEtGCQ3tDwnMbfuqn4nd95hItvxh9ADZ9G2C8VFcAADFyN4pHAeGawpdfUCFf/JvBDbjtYN+ITDlykBl2WaU0Bp0EScW+d/+WLtuJ0QN6dCRVwcX5FvUOY56yz8IPgFNB90Zvyc6oQVFcnuFjTXdXSavQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OO/ApVEH; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO/ApVEH"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3156e7705cso309098766b.1
        for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 00:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050895; cv=none;
        d=google.com; s=arc-20260327;
        b=iU64kR9OfRpm0yKDLAx07DCpPSOvXCO0xBRBQBamVL55gCaijbBR5n45QMhWJrep4z
         sfjt3WyvLKCTJw4Qd5W38y0sc7dr5113SuHmPtgMUNl3hKmazkLK/4I0dHgukAw9cdHS
         GiJ5EWYH4w3t9jboKRT4CbTTbAGSflBNNrJqOFMP2stu5mFM4l77J806zm6pcI1mpoIw
         ODARQmKEefmugtDhhNfx8tFpSIUk5FOGCO81wa1tIZvSZkO4PNnx6tYkXB2hUQUDj2W4
         Oa9nXLvMxQBqdyc/BR6kYniKWHnvbBK/BBDJsciwOnY0b8uviEFer+Xt9ZB++MsmX7dT
         VUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/sGN7s60I9kDns7tf8RWcyBjmY1L2WRY6Qxl0o1md1A=;
        fh=hSnS/AX0ZKcrvAbKzpnifCwlA9HrB5vbFQgfwztEBlI=;
        b=ZfMugmS9J0DYHm5WwgMXKxJgJ3Ge7KdekNcHxOjZB4cGMlWN+4pU67H9txl3os6bHg
         459eXnsLHYuRi4AuFOIjMfkzm6qocOrUl3SAn8xnI1XChgRpU/NnfHavrUukgYWgYP+X
         VuMIkT+WnMXLSN+fANMvYjz1T00hlDWbxkODCdNmZabtNAFPU/MG6O6ybGcPUvvbgb9h
         TWr3k1cRQMY5+Jw1qoVFVmOoc7v/E3AjLRMtmgMF4ZUv2HQASwsV0Z1alKzm/hD+nDkc
         mS3xm+WSF6suOVk5wAArkTAP2vfh9nnGhYumaiyfRedogKtqcst8uyOPGMF0Eh4IlOJA
         iQmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050895; x=1792655695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sGN7s60I9kDns7tf8RWcyBjmY1L2WRY6Qxl0o1md1A=;
        b=OO/ApVEHdlMA+521QfgUyewuRF+kf2hjs0PRCNJq9e9UyMF+NZg4yE8noEbW0VQqiw
         heeCecfx2SAxsXGljKL8xJcsWHmovEBJ9XE1lJKaKjN6cHPseUAOFx+4YupAR+a+u91y
         9zcqeE4bNofPGI3CJ1aDfILvdWZINkT+V6a60FcuHlaY9ccgNRIV0HnG+0UNFD3bBCWq
         Ngp0MVzqCwUy01JBK5LJgypWF2pyVVInExRXgBvz/sc97GSwGS9xkfQkEyISSIJlfFRi
         XLLz5o4tuiTZmUD5qzvJAUh1OhV/VHAFuGaSZQ8croGvTQtjxplABAs3Roy/E1sdKDgn
         BUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050895; x=1792655695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sGN7s60I9kDns7tf8RWcyBjmY1L2WRY6Qxl0o1md1A=;
        b=jJw+UFn9snN3jofn9ABc8HRsVpGiolJwvYEDCZdjgj4z3bYP0i5wx9ksXQ8EkPzvuY
         MPP9vQLkLott22Lp6FP6sDPAhwBtfKrFLyUCIqOAuB3LlJRxdBjDFhhS1/Dcckq9m0i4
         0Q1uBdp5gEIUqz7P72ae6nGuFRW/sdLwd/X/72F4zAj84/BMlKk3cXfHAh/st3VHg1QM
         ivMCeWLWhiJCOlx09AnSGd4aDltkD7Xk8gUj222EuzJfZrbxoEsFErV92IJJyzGThaCF
         f+wai4/qwEd0WxEs2irQ4BCje4d4PiNlJxaulupyneHZRiW01DJVgy5IRNSqLNR5H0gG
         SQqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLSigMMYP/G79c6xi95MJHeWP3UHGWMdrdNwgmfzlhSfsG7DuCUzdhmfoV79RZbPvUHdeQv4HyV3yD@vger.kernel.org
X-Gm-Message-State: AFq9FYLfOjt6UfqneqprFV2AWoiAYXQCCar4Hr3iGeMZ+7TUk0G/qurQ
	OZywB5C/6Ur2SiKlPjkaXYE1zlt1StLdgSlTsZxE5PPPsEi23XFGADRuNBRxNhP7oO1ngb9upcr
	Oz0MGdcwo36euJu1HmkprU0bqJoNubFU=
X-Gm-Gg: AYBFou1P0kL17EgjlN8ugFb34lw4FO0ECVH79GB4DpupLMSum7OkVoWbLAccbljAjSw
	Ci2XYqnW4o7s7s4xGOr0xZ1IGzw96vbI7KYLtqesxVwIMvppHVN4y2m1zNU98CI87z7ws6pa8ZH
	HaCINuzOa38LT3D0zsFstEzp6DyXKn98D9wZt+6ZJcZTto0ryyrDWE58q3lWJGvJFRBSfeUZ2bf
	wLuV5gfsjXs1wCwsUavTDLn3adXXaqv7f9gN6XtBE402Me+zcPp49nhjBrgbu9gniHvwsz8eUY3
	Suk/o3GB94ywFqKNW08IsIas8o4n7lA/5Noq82Ca+nTvqBoZ3IK196xuxy5NGc+WlY1cjVUruGE
	42iS2wcAWF3Wm8GfaKB/9r84=
X-Received: by 2002:a17:907:c60e:10b0:c32:110d:682f with SMTP id
 a640c23a62f3a-c32110d6952mr1085661366b.18.1792050895249; Thu, 15 Oct 2026
 00:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013173504.451391-1-clamor95@gmail.com> <20261013173504.451391-3-clamor95@gmail.com>
 <d5f54636c25e0e60731adc200a63ceb5@gmail.com>
In-Reply-To: <d5f54636c25e0e60731adc200a63ceb5@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 10:54:40 +0300
X-Gm-Features: AclHuK8G-cs7nBf_jb7Nz-sYHdY2hV4DGcnygUqGWeotEdcljE4mZaNjbadyaBQ
Message-ID: <CAPVz0n2yR9C4Jan9=0=ck-RyKk1m19s3q4wfLCz9Bvw1TYNS0A@mail.gmail.com>
Subject: Re: [PATCH v11 2/7] mfd: Add driver for ASUS Transformer embedded controller
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 04:3=
6 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Oct 13, 2026 at 08:34:58PM +0300, Svyatoslav Ryhel wrote:
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/debugfs.h>
>
> Unused include (left over after debugfs support was dropped).
>

Noted

> > +/**
> > + * struct asus_ec_chip_info
> > + *
> > + * @name: prefix associated with the EC
> > + * @variant: id of programming model of EC
> > + * @mode: state of Factory Mode bit in EC control register
> > + * @read_size: size of block to read
> > + * @keyboard_mask: mask of keyboard packets
> > + */
> > +struct asus_ec_chip_info {
> > +     const char *name;
> > +     enum asusec_variant variant;
> > +     enum asusec_mode fmode;
> > +     u8 read_size;
> > +     u8 keyboard_mask;
> > +};
> > +
> > +/**
> > + * struct asus_ec_data
> > + *
> > + * @ec: public part shared with all cells (must be first)
> > + * @ecreq_lock: prevents simultaneous access to EC
> > + * @ecreq_gpio: EC request GPIO
> > + * @client: pointer to EC's i2c_client
> > + * @info: pointer to EC's version description
> > + * @ec_buf: buffer for EC read
> > + * @logging_disabled: flag disabling logging on reset events
> > + */
> > +struct asus_ec_data {
> > +     struct asusec_core ec;
> > +     struct mutex ecreq_lock;
> > +     struct gpio_desc *ecreq_gpio;
> > +     struct i2c_client *client;
> > +     const struct asus_ec_chip_info *info;
> > +     u8 ec_buf[ASUSEC_ENTRY_BUFSIZE];
> > +};
>
> scripts/kernel-doc warns on these two structs:
> - In struct asus_ec_chip_info, the kerneldoc says @mode while the field i=
s
>   named fmode.
> - In struct asus_ec_data, @logging_disabled no longer exists.
>

Noted

> > +int asus_dockram_access_ctl(struct i2c_client *client, u64 *out, u64 m=
ask,
> > +                         u64 xor)
> > +{
> > +     struct dockram_ec_data *ddata =3D i2c_get_clientdata(client);
> > +     u8 *buf =3D ddata->ctl_buf;
> ...
> > +static struct i2c_client *devm_asus_dockram_get(struct device *dev)
> > +{
> > +     struct i2c_client *parent =3D to_i2c_client(dev);
> > +     struct i2c_client *dockram;
> > +     struct dockram_ec_data *ddata;
> > +     int ret;
> > +
> > +     dockram =3D i2c_new_ancillary_device(parent, "dockram",
> > +                                        parent->addr + ASUSEC_DOCKRAM_=
OFFSET);
> > +     if (IS_ERR(dockram))
> > +             return dockram;
> > +
> > +     ret =3D devm_add_action_or_reset(dev, asus_ec_release_dockram_dev=
,
> > +                                    dockram);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     ddata =3D devm_kzalloc(&dockram->dev, sizeof(*ddata), GFP_KERNEL)=
;
> > +     if (!ddata)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     i2c_set_clientdata(dockram, ddata);
> > +     mutex_init(&ddata->ctl_lock);
> > +
> > +     return dockram;
> > +}
>
> Attaching ddata to &dockram->dev via devm_kzalloc() and
> i2c_set_clientdata() is fragile because dockram is bound to the I2C dummy
> driver. If the dummy driver is unbound from dockram via sysfs, the driver
> core frees &dockram->dev devres allocations and clears dockram's
> driver_data to NULL, so the next call to asus_dockram_access_ctl() will
> dereference NULL.
>
> Instead of allocating a separate struct dockram_ec_data on the ancillary
> i2c_client, could ctl_lock and ctl_buf live in struct asus_ec_data (or
> struct asusec_core) and have asus_dockram_access_ctl() take struct
> asusec_core *ec?
>
> Thanks.
>

I did this since dockram and ec can be accessed and work
independently, hence separate locks and buffers. I would like this to
remain as it is, but you have a point here. Adding check if dockram
client is not NULL should resolve possible issues with
asus_dockram_access_ctl calls.

> --
> Dmitry
