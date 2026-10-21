Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565202;
	b=Iz0iIamUB89EMOr4mYH06ovn2EiveRPDa6V0B8D4Gfqc3iiGEXY1TDjo3n4DlnGtNjLq
	 04Oi6Z2we9fqwiBnoFdJwBnmHP9w0WPfyARIc7v2odTIKJXT/wIOGdpA4fBU0eJ9v+l2P
	 yCoBE32H1QSYr0s2qb5peFkF0CAttEuH6+tDKzmYb4dUtIwZNXnwEinD2X8hZl1zQefTC
	 q92oLroB397ZRucz2qdl84e5Js5M+xokvjPygAZHJOUH0+HL7Yx9Zg+cRVx7jT/CMI/p7
	 NeEMTHAlUhmNuKt68lZ42106qZQQ/LDfCUeboGG+vyhldNidax3c0T+C53OpLrTW21Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
	b=f3mY9ZRSYkW+K8aNdLxHqsj85akL+T2IqYfgdfAJmTwYQiKMQJKHH7l1xv1/4QQx/s3V
	 CIWst1hwMaJEEq1rCWsTDcNM99c1KAWaO6YoOMtGZZf+pIU/oC5ns34QjbwriGiqYZOOd
	 FQJxp6sbPyHJ9L95jkv1Vpzld3ozsQkt6rxlxtwDnSs+CrjbDa3ed08dJYNj7YEE3LT7k
	 EeggASPyBEkcxTBJgt4ztPmZ9/eHqGm7WXTZvmRqj1IGYb1sL4HkJdiW9tL9XX9Q4OwNB
	 svZs2gwTaoFZK5NAGff4OhHKMb4KT6MjeBy2rPnDaFqX/hwmJimO5pJmC8qSVPsMYXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhmxhi0T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50FB606A319
	for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2026 06:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50FB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhmxhi0T
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso705232eec.0
        for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 23:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565201; cv=none;
        d=google.com; s=arc-20260327;
        b=hN0OYjx0ly79h9e3SnR/dCFEanfkzDaLcZO8l9Zo0KcECiWTHSMZWvexJaEVhxsbzn
         AJcnWtlJ3tSaln/3zWbV6aNPNS1KkOloQ/Pp/Hy/4ZE5mx5DDYF7Wca2jt/ryBjDvZZ7
         aCLIwxy/kYkda5IVDXO4xzbQ2UkgkdGmUGWsz5HrSX1hbNno+Po1akbwr1fFZPvlQJ0n
         9HYL2E2NjfOS8tLkpFoTkTTtPEaMX2Ye2Q5qKt2hlHn9siy3CuS+wIsM/VIxTdHtIrm8
         iPTGblAo77ZFxhqjDXrGbNiHHivRbdtCzsbrkU772UukSEzuTqvDRJWgf9o1Sd14cf5f
         yncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        fh=NXme+0hJKq7G0TZU36kaZg0lm3y1xUfmHnTj8cyTXmM=;
        b=FJAxoWaJP9aGe6UUlywteR6m+EXtOd2ki3lLZs2aZFY8hWJ6y3Arh0G7APtdmmm7+H
         de4OF265RU39lHLdJCIdvjhoeV4TfgbP18gH4mZH71PQ94KFLoud0GxB+FiZBHYwmztZ
         QE02w2coNlQSbw9Hoqm2RhwJfTKW/TB1mx83LQA+ovYAblvqqrmom+G7SgfNT9Xe51p/
         nIayxYS8+0q05FFmfy+YWjrIpc9ca4YTgiHlfGjCxkOxaWtB1ZTADqKPWNdFOWBrjsZ2
         fEFBqAPH1DlHdZdwM4Bl2rlgnR95NvdLBzSqv8efPlE5lZS6tYCOe/IVL1ZtvKwCa4aA
         80nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565201; x=1793170001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        b=qhmxhi0TbMwtXBvTVlFY4f2LPpHPl8poznD9dAUHw8+/Z9wZhQBqqYwfND7kTtB/dj
         BDT7fy1OHPOT3SsXcIJoCO2P5QWvHhSGsWpWrDlHwCxU3wdGdBZJo+CJDKK8hjNN6KtJ
         ZTBEpRPZ/CzppBKznbLND/WVtTUpHxpIjv8l4Dszl6GShVbqspGQMSfdEn1YLZCusCt9
         8XZUeUrLgiEXnrc9s2V2o2rhr6TPF2UsE6frYfs2vuDhFHmb1RIg6wUfaQGU2siObxeN
         QZxhnIASpBqZUpMRUn6UfJAhdRPi9Cf8ml1LkjDPLUFZ1OJH0H7A3t4eraOGGpReFZps
         J94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565201; x=1793170001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        b=EON0ktYXToH3bQww96CmcZqOsks70tYl76UXJqMj8ut8OLthVrKcI/dla/Q27JOJ7Q
         z/7SIsdSsEiK1DsRBOPyG6kXi5FaFV+a/tqw7N0WQfuUU5hDrsZJHAwvTVHXFRkaixz/
         pRGt/M5pFko/sRn6nl+dm9xEW/hLVvgobtcO3knDKaXx3GYvrSs9BtKMD13sYTwj+hj1
         Lp7dkmsBwo/28gNmfzAjS7yHhVKjBQOhhTe5i3RDlzbRWPZmETG0jkp4W4/wapLUrGt2
         wQSdPhcWuSZ/erDe0kXrbEAhneyZ3vJcZAfjVzF9b40EYbo59fl5s/z/v5y8Cs0BfAtM
         BxCA==
X-Forwarded-Encrypted: i=1; AKwUvBxhV87sb927cnHsDBfNFc9PZ7eTlXLnDY/xvlAunbiDNMAxH+4zU3NXJ2Gwhi9nueYiwJ/VwsgMIK1S@vger.kernel.org
X-Gm-Message-State: AFq9FYIAhD2X/J7n70p4m8pO8he2eI+VRg01QW5o7JaCps/9y/DKKmrN
	OWLv8uBqQL2TQciKhPC55Qpq/M2v3BRzMVfQKOPcCwK1kxnOgtYz69dxsJdrra3D0Fs6rs0i8X6
	TLJvblNu1qfwXfi37TJSpfhQL2F/FuP4=
X-Gm-Gg: AYBFou2hOcM9RHU8Wjj43iK7RtN5N8LibCKwE4h6Hhxb4ap3CL57GaM+s468lPJOWXy
	k7ZZgZzh335Uvt992IijviSLVdduCWUQqrWRzOWGwnTSjJ4zpfsG4DKh2PgvW6+c0KO+VROlAQc
	xsIbQd+QiPDBBbZeWosSd9kk5AkpwS/IJp75Davd6y+lUemboKqd5xrmHpK+EGxLXJ1ryztuSG3
	sIAKB+Fhu3czeKFCoSWnRIA7FjhmQpaNl85zHhRHFTs+WhW+mW9mvfo+PuRJkvsSwXEMmzDEcz/
	MYQOLbdIVI/zUiQACpY6HcHiN8d6FUPUmHjEcfBhU6/zdpG04TSRVZn7jzmhozFJzqcY47tQy4+
	x1+HZt7GLf6PT+JVje5sVhryCvi8vtE6x62Di/CJb5Br1dzCIGovvEdYNNUXFKeHEkttn0g==
X-Received: by 2002:a05:693c:88c7:20b0:366:703c:5f0e with SMTP id
 5a478bee46e88-3674ef1f33cmr2092100eec.35.1792565200654; Tue, 20 Oct 2026
 23:46:40 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-4-clamor95@gmail.com>
 <ate5K6ZdrSoBUI08@google.com>
In-Reply-To: <ate5K6ZdrSoBUI08@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 21 Oct 2026 09:46:29 +0300
X-Gm-Features: AclHuK9vSBGobmYgXVnmsJbAb2zJc_kKp_DYHLaIwx6A0bp9NGDYceSKiyk9FqE
Message-ID: <CAPVz0n13NFbY1ChZRkc8_2CQd8HfjahA-gcRWzxsv7KbAxf5Ag@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
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

=D0=B2=D1=82, 20 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:0=
4 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Oct 19, 2026 at 01:04:02PM +0300, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Add input driver for ASUS Transformer dock keyboard and touchpad.
> >
> > Some keys in ASUS Dock report keycodes that don't make sense according =
to
> > their position, this patch modifies the incoming data that is sent to
> > serio to send proper scancodes.
> >
> > Co-developed-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> > +static int asus_ec_kbc_probe(struct platform_device *pdev)
> > +{
> > +     struct asusec_core *ec =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct asus_ec_kbc_data *priv;
> > +     int error;
> > +
> > +     priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     priv->ec =3D ec;
> > +     priv->parent =3D to_i2c_client(pdev->dev.parent);
> > +
> > +     error =3D asus_ec_register_serio(pdev, 0, "Keyboard", 0);
> > +     if (error)
> > +             return error;
> > +
> > +     error =3D asus_ec_register_serio(pdev, 1, "Touchpad", I8042_CMD_A=
UX_SEND);
> > +     if (error)
> > +             return error;
> > +
> > +     priv->nb.notifier_call =3D asus_ec_kbc_notify;
> > +
> > +     error =3D blocking_notifier_chain_register(&ec->notify_list, &pri=
v->nb);
> > +     if (error)
> > +             return dev_err_probe(&pdev->dev, error,
> > +                                  "failed to register blocking notifie=
r chain");
>
> I think sashiko is right that we need to register the notifier first,
> and in it check if serio ports are ready/registered or not. For that we
> probably need a lock and set pointers or flags in serio's start()/stop()
> or open()/close() methods.
>
> This can be done as a followup I think.
>

FYI, Sashiko likes to hallucinate. Initially notifier was registered
after ports, then sashiko suggested to move it before. Then in v10 it
fussed again and suggested to move after. Then v11 passed without
regressions and now in v12 it fusses again that notifier should be
before.

> Thanks.
>
> --
> Dmitry
