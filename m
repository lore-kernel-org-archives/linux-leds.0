Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91952E7F0A
	for <linux-leds@vger.kernel.org>; Thu, 18 Jun 2026 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781792771; cv=pass; b=Zm09UD0UKxQVthriqBmUJjdRbZtDl5/c+glaiWsBonyXIIhS994guHgqiPAwrkDuaM4gAy11VZfudz/bkPVmbebRywYS4UdiXHKWZIMiIfBk3g76ApF9BTwmxvanjIgs/OZjaYzA+tlg2eC2oBu8kJzg83yZIGwfvCRMWLtEpKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781792771; c=relaxed/simple;
	bh=H9Dy/FyQmXBxDXqDDe13avQkRc6Stl6911Q7fhNxVqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYpoMbbPCC+JKayQQmB4eHudlXj/RhugVs0rYbyEUNxkBZ0N6v5OtzmbrMDBDuXTCsHEJ5Yr2ydJ8D0WDUBeHcKqval7RAFWWR/uwkdumLXrUHOC/yGh9EztAGEiZn6+9B5DCaVcXU0prlc5l2MAE/6yAhE2iLMfQYNOJem/Bfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ax2RxUuZ; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ax2RxUuZ"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-662f479a22bso554680d50.2
        for <linux-leds@vger.kernel.org>; Thu, 18 Jun 2026 07:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781792769; cv=none;
        d=google.com; s=arc-20240605;
        b=XkGwAiOViaNEj/6nufpC7tB79aDeZrmJD8Z1SgNkadwEJiC4UtLKHY2v8hJ8K1WZAs
         5SKd30ZB5L8G56s3PRk7Z3tyc/UGQds5SODfBB3g+07x1ou/+RsDTkpHb4MsIvsMsR7J
         ywmnfmIqh/aQDHASRGHuOBwC7EsSiXtFOqldiXgts93XM3CnBgU8I4wnPcBH83wGmvdQ
         sF/AfGbm4eOQaynMCF3pmfwVfF+mG65mjgB762SVxuDIRIzf0L8UEhKJ6Pwou58WeF8I
         rOialRvBlWciGKt4QBqt2OqJvPtdbz2B8Ne/hxOqdmHX261EOfAm9IducU1etysbGNht
         fpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FVHys33Smitjd4fHefDW8i8wFMm9DeaNh3CQeQD/rOw=;
        fh=pjoEB5MG5lb3hAurmaQLfcu1g/zpjA1WNMKGsaKjNtI=;
        b=f6by0zW3jT2KBLXOO+Qib6y0QFqy+v95M5oxsGohnA93m5S3TtBZFpH9wHyf7PtXlt
         FIa3IyVnf6pRPrVcFhDP7EUB7fn+KEs3BJbhSpHcnRaGjav+OfXNlDOr+zLk5zAzaoNZ
         ZSBDcxTcAWwSxyB/lHOmcvAhuqpOoP8bOjMBfbtgIx9GOw6SJ3s0CFQmCEKdFCZz1Jib
         J68wDlkvJb6PO0l9Q/iZzHSZu6nPtbeGWf+hMuBkWfzYM7wLbOuZRnothUW1dtPdpHVA
         HvKYmpfzTQigE7Yavo+P1nHXWzolvSoC1eobiyevwbzxR2sH0tAdRHqPBsQyFtNM7kDM
         jTlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781792769; x=1782397569; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FVHys33Smitjd4fHefDW8i8wFMm9DeaNh3CQeQD/rOw=;
        b=ax2RxUuZ5+iRlbhUQ3tVQWjh9EMt3+e58LcJceGAKntnEKElKRi/GYLHIW/67xR0B5
         xwyaucqlxqpsLE0fjX01MBmQqCqhYKoKeGtQPiiX7ReaMaf8Aoon5IUpj0fgQVb+h0/2
         CIOKuApbJY5hLA99AVGX2KcXtWpV67qZdo4NHwZ23EwTtABzHF/7qRaT9779zMX36UqY
         T+szy3S7TP8M1uxeb0htbVqiUDyb19kNqWpd1CoOPcqmXXyQ9t1xRLUubr4ZRocEZukQ
         ymIV9ZTW/EXJnuKvgyfk0wZTCLGQK2jR/GcxucbIqfTaVOKOgxyZBvbJvx0N1a3r1mGM
         VYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781792769; x=1782397569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVHys33Smitjd4fHefDW8i8wFMm9DeaNh3CQeQD/rOw=;
        b=A12QkwtFYyR9MWnOtHTxoMcqwIPU4ocxsQ9Whp2f//xs75rCiGFBIM4gBUnaArbOIo
         zyaSjfkGnSmd8Hnze4Vy3cKj1KxRlSREyTmu92qJlO68gOguMbBjcknZxH6r0vRFwtxc
         1rhlCz/BUZTSNApzkRZcZfuw0D4uXh2faVpD0ESkoP//wT/WcNj5HDUy1YH0/Qy6J2xd
         cTrjTu7dMYlxt01HgnRi+7oBnPz7NemNGbByI85cxFvthbn/pY1pVWKSNgspayB1MQjA
         78yoIITmkx5Q83kzmTiHWVqflmCOCJcRyDZ4R3lDOYXfDqt4JTCwytFVKjHIaGYifAl9
         TXyg==
X-Forwarded-Encrypted: i=1; AFNElJ9OyNy+GSnZkm9DTUAVO0EciVjFPxpDVwipWIK6GgoEUr+8n2mQ2K31DA9JarLbowXceDrEBkldM8tG@vger.kernel.org
X-Gm-Message-State: AOJu0YxKEURWmrTgMIW2KDtCTxdWJhoxb2HBA3FtRrNOqs/78cIrvxhy
	lyxC3tnXCnFrlCdW4BN+zWIL4yHKHUjkRVrLNd5+ImBPIIiF0EAYFk0706nkigOxc/9K0shabi1
	M+4aIew/9DsfBChY4Ku1Ngwccb5m4qkU6VMz8
X-Gm-Gg: AfdE7cnbb0438fVL1uLOaGE9dPQ3rlffJsdB4K4nppYC4yoOB8DzR6DPKAOIBTLUdT8
	S0LfHbBbCwXVpP+3jO05aviaP4x/Ln/UDpSIJKhboKxc5fTtaVJT2aQ1NbgzR2jfXNhfvhAuj3j
	DUlN7gu7SkM+Nxj34Y/r1Yb7drTeWFWRP5HyGb1p1xpQpCmr2lRP/0O2fYUbWo67ccS4fgd+Glg
	fxZAf4jpRtVFVG3fnOr1+XqNLf8DIpt0kWTdgEycWZM49N8ylIuTci1XJMkjTp3000YPv30OrYN
	eH9qlR5W/014jqBu07RyLSoOV1s=
X-Received: by 2002:a05:690e:4841:b0:662:5e4d:2bb9 with SMTP id
 956f58d0204a3-662cb987d7amr6044923d50.16.1781792768685; Thu, 18 Jun 2026
 07:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612201637.197608-1-mertsftl@gmail.com> <20260618115500.GG1672911@google.com>
In-Reply-To: <20260618115500.GG1672911@google.com>
From: Mert Seftali <mertsftl@gmail.com>
Date: Thu, 18 Jun 2026 16:25:57 +0200
X-Gm-Features: AVVi8CfTcNCwXSGcLCJ9z8r8DxJMF24s1eGd6XPx29OufAPk-Ovawu4fs6LpD9s
Message-ID: <CAA3NoorDNkAJX0Y5u2pbND+39adQ4JBk2CFb_BEpmy3o95jXvA@mail.gmail.com>
Subject: Re: [PATCH] leds: lp5860: Return an error for an out-of-range 'reg' property
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
	Dan Carpenter <error27@gmail.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hello Mr. Jones,

Thanks, that's clearer. Did it as two checks in v2: if (ret) for the
read failure, then a separate block that returns -EINVAL when the
channel is out of range, each with its own message. Dropped the nested
if (ret >= 0).

Mert


Am Do., 18. Juni 2026 um 13:55 Uhr schrieb Lee Jones <lee@kernel.org>:
>
> On Fri, 12 Jun 2026, Mert Seftali wrote:
>
> > When fwnode_property_read_u32() succeeds but the channel number exceeds
> > LP5860_MAX_LED, ret is 0. The error path then passes 0 to dev_err_probe()
> > and returns 0, so an out-of-range "reg" value is silently treated as
> > success instead of being rejected.
> >
> > Set ret to -EINVAL in that case so the invalid channel is reported and
> > propagated as an error.
> >
> > Fixes: 3daf2c4ef82b ("leds: Add support for TI LP5860 LED driver chip")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Closes: https://lore.kernel.org/r/202605210624.3gcr3prk-lkp@intel.com/
> > Signed-off-by: Mert Seftali <mertsftl@gmail.com>
> > ---
> >  drivers/leds/rgb/leds-lp5860-core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> > index fd0e2f6e6e0f..9eeb01b3e56a 100644
> > --- a/drivers/leds/rgb/leds-lp5860-core.c
> > +++ b/drivers/leds/rgb/leds-lp5860-core.c
> > @@ -115,6 +115,8 @@ static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *
> >
> >               ret = fwnode_property_read_u32(led_node, "reg", &channel);
> >               if (ret < 0 || channel > LP5860_MAX_LED) {
>
> Whilst we're hear, let's split this out.  If 'fwnode_property_read_u32()'
> fails, 'channel' is not populated.  While short-circuit evaluation protects
> us here, separating the error paths would allow us to use the preferred
> 'if (ret)' check instead of 'if (ret < 0)'.  It would also let us provide a
> more accurate error message, as 'reg' is not missing when it is simply out of
> range.
>
> > +                     if (ret >= 0)
> > +                             ret = -EINVAL;
>
> Avoid this nested check entirely by assigning 'ret = -EINVAL' directly
> within a separate block for the out-of-range check.  This would keep the
> flow a bit cleaner and easier to follow.
>
> >                       dev_err_probe(led->chip->dev, ret,
> >                                     "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
> >                       fwnode_handle_put(led_node);
> > --
> > 2.54.0
> >
>
> --
> Lee Jones
