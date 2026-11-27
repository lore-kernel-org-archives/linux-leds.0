Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795764182;
	b=CDbHijnP5WasTzq9Hs2Z9VTfbGooJRnjNdBs+PPuIyFlXGLeDULINIr81HWxER7aaA+T
	 zxPDF5B+mZSrgrHPZ7V54p/Q+ZMFyXXvRMFAMYPv59abBuvURv7/sNADy3qWcaDPoiTvq
	 6gXGfwWEzA4AlNwjmgwFZgChICvGCS9V7VPasGlGUDjFxs0E1zczopHZSA5DsJWlvPKt/
	 i5Sx4wKZJf5K7pQ6FMYAzBHp30fyw0muYPgA/xg8SLejz9gESLV4oytGLGVSRzT45EtnQ
	 7epKsLgXWm+cEGm+zzOGmnpd74SPKDPVFmOauGen5WI5L0zLBunmPLBxq96cVm0MtUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=VLfsUTc/xIIGcS2lGfOPKhhQYlDo+fkS6wrUcxdmCtY=;
	b=hcsv+U3EXaE2/ftJbzEFmWMy4DWjws6Hf1reOyBYaqVLFr0Efmex7vsoLJbg23C0R/xW
	 DZ776T7k7brS1PEHLiITlrJfV+HgIYA2nogcOai4GoPBH19p3WijJTCAVfN1I1FAtk1vN
	 jUMbb9MmEETUUukHQuLFUSlsJe2OXFM2sV5ycbA11BiRfVMfg0idgNMPAu8fbn3E0ozVe
	 CYN0dP0ylfL85079nzu20HCTqXqFgDQXjfcM7esi8yp4fur33ghcycQBgOh0nXwtVW7SB
	 k8hggqouVCpNOUKHnn14vglNfRlETyNig7fcQOKZhbzYtCO8REWiJumZQ9nM75MfyrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=neYs5dWv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184FE606A31E
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 07:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 184FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=neYs5dWv
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67be1e468a8so7365410d50.0
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 23:23:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795764181; cv=none;
        d=google.com; s=arc-20260327;
        b=cOeO2AgNjg5GZyvB9OmJ9qaGD5n/Hakq1c/fFnfpNoZDO0KrtyVqz7N4v6Jfy9V0a8
         r8Vl9t6JV13NvVu8OLCN293xzdjMFzX1aeE0FtVv1OReoni403Vaq1Fqnz+Tj7lG/tjc
         oXVjM5JHXqT2dvefNY3NLdHGW7a4zuvSPrEzVaFOjM48JlbiZ2RTxA/fOA/0V42v8o2j
         /twd54Pe5f/o40otmhNrbGyfAW1mwP4JX+Nb2SZ+R8pu4RP+zAeyOE5FnoZP1S58khEY
         gNF608nhMHAQLBNKgQSLxdhF1sU+dW0puSrP2812aAO9ueKVbaRw6oTAcl8bIMeTrnLg
         9jdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VLfsUTc/xIIGcS2lGfOPKhhQYlDo+fkS6wrUcxdmCtY=;
        fh=7b+qE9uSDAGGZzOd+TOC6LX8f+Q8RbnoulGhcEV7tPY=;
        b=dS2qsjc8LwlXGynM0gU074Psk8pJqGbryPtuUvAjh6S+TYXhd/I1U9s69Nqgmqb1Ov
         5X6BWn0lXj6w9l3b+x94dFreImdN/Ul12fN6ZGJGDf49f4vmBrrdkwpLRZuZdJyl8TY3
         I06eeLf+KpbZpuGEF7lietQBj6b605udTYHz+gwdpiQ44sTp+r06ntuS7+2GJG4kgRRL
         ZSit3gp/QRhfVfgfo7cxb6gKIfpiKFAS27YCeM731FKFqd3hOO9R0jAF5PInEURQNY5U
         qUvG1pa6Xd0BRx0DPHFbjMuCS9ZifNDYM27FyK3iZrrf12RJamR0pLSWSelDtA3VBOKW
         jq6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795764181; x=1796368981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLfsUTc/xIIGcS2lGfOPKhhQYlDo+fkS6wrUcxdmCtY=;
        b=neYs5dWvIkhyceXNTWpr45WICKbLJ3LRLu2T2jIZlym0FyYvD4P9qqqMwPA7sVvUha
         3skkYU4DTwCqdTJ+1iBCe3is0TK40VhxTxrrDpUIhZe8lORuKBUasT8Zzs7CE/fwknNR
         3c1mHtHr7RsCZCbpW2H09xSJNpkZQUjeyzIN7vflSoK8b5WT9NScOo0lpDvrb6JHelgR
         pwu6ZUAl9GiWBi5xy0TcSqV8Giq4Nw6iwykrk4aIv7+Tma2NVmglnfFg+f2AHlNj8vss
         MJM9SLlF5BpGDzS7hq/QM/r8LjokMPJ5PWAQqvvFj+EyCUJpEJydD88/W65QTljrbyZr
         MjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795764181; x=1796368981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLfsUTc/xIIGcS2lGfOPKhhQYlDo+fkS6wrUcxdmCtY=;
        b=iyWGU0kiNZGWhmJ5AMlFZFM+4jmdlt95baHa/M43xI3xaDN7r1tjiZSmjjDTIqNve1
         N8gdC4MLn4CLV5Hi6QKCiD2k7GcOAw18F6qHAJYrHp/pA8woImy9fLGOheVCJY4ikuF6
         3Hx5SCSLESX4UOX5QDbHEGBJxaddk4qCrP7y05oZkyhuZ3YfbNE2jr7D92vSJGx/jY6T
         RxbsbRQ8BbUa0VBimg6AYk/j5bFTOtLhvFqnWMU1KPTqkLwh1UqGVmBtlmFWBnZPtniu
         kZ/mU/Asq50xm3Ha789RPCZ7Wr5ZZ3IdfNaxvO7LvcK5VwtLMgptxrGPhKSCM/CapNqg
         xM1Q==
X-Gm-Message-State: APuU4Z8atN8tdk35oCCu4/vJPeYXkwPqsdI4Gglu4fty3RvHa3L2MCKy
	X6uoKoJepvNifhvdmR1tNw+Logq0t3LhSqGmxk2730UGFKFRqXCEG95SF02M+xX+QB90d7+vSOF
	60/wEI7cJ6efj3HUptZgPTOPK7kOlnto=
X-Gm-Gg: AZFdTZdnblrb62k1/0J81HyojvRK6+90nwdsLCxmdNDJnWGnI5WtW4x2VEPLpHhDgTW
	9EVMrRDv7xhWPXj/mjA0KD/87sGOjSD/yNM/CXbZWER9NURRMhGhQsBiXUH5y97TjAthvhpAoEl
	GAxS8ALENb1MdEjbpCBYC7wLjpPK5KimfFM4uB1Kg6b4bAi0ZR1uFtYEvfOBBY80dLfvPIsSc0Z
	rX+2Lmklo43ms/exGOdowtVn+YMhUH2CbUtK8ojuCjGSWFU8UcpdEBUho080oTRYFm6J5D+YWmN
	edWIxBKzQW4fqQJNBrhGZ5zerQ67WlHLJhupIG6ZrDG8rswvBsyybEHI09LLFlKh/zGNgux9tV7
	hFlJsuBz3NikL+ykfHxQon0gE+LplhctDDozf
X-Received: by 2002:a05:690c:6502:b0:8b3:8c44:26df with SMTP id
 00721157ae682-8b5204b158amr106683657b3.34.1795764181016; Thu, 26 Nov 2026
 23:23:01 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126122516.1198461-1-congnt264@gmail.com> <f92d05d9-2452-4187-bcf2-872eb285077f@web.de>
In-Reply-To: <f92d05d9-2452-4187-bcf2-872eb285077f@web.de>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Fri, 27 Nov 2026 14:22:49 +0700
X-Gm-Features: Aa3M54oLnWTPERVqr8Om7VIR3bUK98kQ2MCGO5C4sSzoCIdqMfUgVUxfuJHnuyM
Message-ID: <CAJpJ=GsqXgbPM8K6xo+ZvCPJC5EWTiJ3334suVh-cdg1KCcOQA@mail.gmail.com>
Subject: Re: [PATCH v2] leds: sgm3140: Put the child node reference on success
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Luca Weiss <luca@lucaweiss.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 8:46=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/drivers/leds/flash/leds-sgm3140.c
> =E2=80=A6
> > @@ -270,12 +270,10 @@ static int sgm3140_probe(struct platform_device *=
pdev)
> >                                          &v4l2_sd_cfg);
> >       if (IS_ERR(priv->v4l2_flash)) {
> >               ret =3D PTR_ERR(priv->v4l2_flash);
> > -             goto err;
> > +             goto out_put_node;
>
> Is such a jump to an immediately following statement redundant?
Hi Markus,
Yes, v3 drops it. It also keeps the label name, because v2 did not build
on the leds tree:
https://lore.kernel.org/r/20261127071831.136694-1-congnt264@gmail.com
>
>
> >       }
> >
> > -     return ret;
> > -
> > -err:
> > +out_put_node:
> >       fwnode_handle_put(child_node);
> >       return ret;
> >  }
>
> Under which circumstances would you become interested to apply the attrib=
ute =E2=80=9C__free(fwnode_handle)=E2=80=9D?
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/property.h=
#L229

For new code, or a cleanup on top of a merged fix. This patch carries a
Fixes tag and may be backported, and the helper only exists since v6.10,
so I kept the fix minimal.

Thanks,
Cong

>
> Regards,
> Markus
