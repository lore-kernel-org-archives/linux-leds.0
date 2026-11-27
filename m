Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795791652;
	b=XH/gwDAi6cPNQbGHJukftvbP0NbnOSntag8oU7YMS+BrNbrbnRUtWmrI/S9F4gPQoame
	 TsbGsUTs5UEShkeZvIPRrLsfoxtjEf+eXmBfux1tzHKBsCJdBMe4GbGGdhvTPQ7PEz7Qn
	 Q/b4QFhDXDiS5JW5u/pw1B+3Bws45COYwLfz/xcJOSbtrBJgAOAA/HavYyxL+pHKv+uXf
	 XQLaKm6ZjGLxu35rYad1F/6jBS78LujA9h6pvGe4aw3TiBZb/21yR9EOM3TmiUY8KDr4x
	 6U9ijJTEOAJ1iDoKAxUPz13SC9qiT34n3gEVvyD0Fz9+ZbM5HBleOj2dwy6A5LzHm+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
	b=BLVKZhr7ULGQgl+cyl7kixFMuN2U8ZO+FcrKFukfkz58Z6LuiYTQTD9UI16sovMMECPX
	 mJTfg88jGFD2lGtVPqIt17UXV8/lV3Y5td2YYKAEpuDBoSJTkTpgsHEev6/tGs1DoiV8A
	 QJcLgfsqgCxep8KZq6hdX3pbWLJfd2K2eUS6WBeRpTy4O8svfBjuDrLXOk95Pc5rk/N6d
	 IENTxZOcyys0TXPv1+3yKDnCr0023tVaRaQ0WBGbI8YUECjeZkOzNdt/FOmwWVcTijUKq
	 tWhm+9syZbvFxxGSWB32j1sCqZFgtfQKMbbAQ/C/hwmrJPEvf9lZzTsAX0p+2CCFYAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5tRXD45;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFAA606A323
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 15:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFAA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5tRXD45
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386bd881d39so9341144eec.1
        for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 07:00:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795791651; cv=none;
        d=google.com; s=arc-20260327;
        b=IpSGyVKLruV9WhJW3UR90V+b0n1sgOAVx7js7upNuuBaQJrqVH/UNZLjY/sSUPIZog
         GOZfnkgU4/xMbFTMHu1p1MkJlLpSLJAVehDvj9xmt6+FLy7hE4dGGHH9c7ESBH4DAJWJ
         MvMdD7BXMUlgaWddJ1zBeetdXO7fdlKsdSWtWliYg4wvy70KH7rvdGDvBNAOYS11vr9X
         6bz42n0UmyzQpUpVemMU/5ReVUTWAvvJf7gWBVDk1aSllaKKk/p0r7NzftYIfeublazZ
         MO8/WHBej9D1cqH0j8b60zx1IKk/Mr+kUVbSUUetKB8P8ngbrPhPsQCVliTf9B863N0d
         bPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        fh=OK0e/7FzAJt3PuBHIa4uRDLpOwjg3l20t6VzOahX3RE=;
        b=ODvVbphUQhPrMf7oP20nXJ4Fahd4MSTlgP2IQWkU7rXE6I2Jh7988uDpWx0WAsQKiB
         QsYEHmdfoYd5eexLLzuGV9TtnbXqbACYrQxyXFth+z1XXz5PjxN8dPh9bZqNMMWM5ZME
         7ThmqfKquKDSbm/yi2eIkSMNd0imBW6hYjQjmZuLGRYzTjAAHSNCGojBgMFYOa0N1urB
         cG5GyhR+ajDTc8lcHBI56xReOmI4subZiERG2FgE1rZo9G9RQWsP0gU/wCd6SK7EhoNH
         jgMDuhCunh+VWKzSwwJL0ElRR1fUPOKjfoM2YFd/hqugdW9484DAIWuULcySbinTlJI0
         AwGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795791651; x=1796396451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        b=U5tRXD45RYe9IaJtJSwOLXc+jl2P7zuSUJEzxnTx7fDaEcBvntAtagjLA0p9TYutBg
         kjNNmfAd7cfIhrx7sOJC6EwTPkRy5JpXd9fQa/nfqUIQFLzWyCZ7NVgiyRFsRS6VidTn
         +cxInGGlA06HQ31MqTnZfVjlS0lPABiVJCcENh0k7C3Ows8cEQ9D9InFMq3XkpEZrKW8
         FgbcpP+9gw9MpsjAyoOTy3ig+7VxaKaig4+mBJnrpJ8uMdFEWvR545M07SViGkRIpVEO
         +dIfXkHa5UlzN8brC643dI3gjxeIhOwPuY/nWJq/FP0Ul8VnHOjeVuTYLltvmkSWJ48V
         0Dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791651; x=1796396451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iPChri7biYpij+YOdee2tTIQuLdmD1pLVPBNubI3N4=;
        b=m958jFxYZ9eWXZNSSuYLlnbnZAdv8Z0madVrDSONfzB3TELaPtHBOlO6QEYaJhv3Wf
         dozrHaEub/7uQQuXEEA1AV1Q1k9/UlIAfGLo+0S9cMKrMkPTzgTLJOoMHd8RF4aGRY2v
         7EkAEwgiAtex+bYVpvmuYcQ/QJHjTU3/PqOPiCrJ3KHYIW5eO6m+P5CsRRe0A9GK6ocX
         Gtq9cdM4M4zxiI/ykP9TzIkNFtWaPN57Um9Ji+kKuBmVFXYeOBuEbyaZwjzPF3YOXSbr
         NnpOzVy8Bb3cnpRNr8kTSBMYtJAAZbPhkozDsgXsxrjyLCoon2quLJCgv3ZPsKUxuU4N
         HiYA==
X-Forwarded-Encrypted: i=1; AL+hErFbZXGSft7tJ75s164+hNyaPq7+jPSMs+2NMQhj3KBSNHTn1ZWTPvxKme7RngRqHpnRJ/AwU5S0X1pL@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lyf37RVhuQIy4IGTf6hn5HEBaf8xOO8pRYJ/3FKMYLGOvC0f+
	Ad2Wa0p3XizVlhYgBn7qXphfv3OK+FckCimQWY6MpMor3kK200NtINrpMlCDaL/TtDJ/mpbTrXv
	PqrXK2wyH9xGpc5yzlPHn1Yjro+X/I+g=
X-Gm-Gg: AZFdTZd1qPvC8hQvum3u+R0/carxu9di6hnXtsf/36bLU3QQ05wqEr33AMe4YdV612p
	ibfjjpgIaWio8kywtb0kCeLoQG4nnRV40UnBmCBDTRlmoGIXHJMsnZEaGASFwtPHpJ8tYNZrg8Z
	BRSFGimivpsa4Dm25eS4rsYSCqv0T4RNHKRjZdZYG6IxkAlMu1p7KybfinLMcLh0VJ4xrZ9nVbS
	SXty+hv7/P5U7yR9B7TqP5m+wsIjkFkruvn8fkNS2G0sV217jQPSETEeL5Zmde61vFFF33TiKtH
	5Xa5secQxQAeB+oWs/bHFcSz6hGlCrMXc8xlGhDv/eCHPBNbXT6geI+uf/6XyMcaRQVCDr+o0Sk
	+rrcoBPDpVpCfJqNd1krQJyHhr3zOpB6G/Z4MBPudWSEWL/+On48lWvLyBIh6fu7OFPfGQVvsSg
	UumlPWPPRyJwXZjoLskzMqTymb7c8fHg==
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id
 5a478bee46e88-3857111f65amr27118776eec.32.1795791649409; Fri, 27 Nov 2026
 07:00:49 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115085826.89641-1-clamor95@gmail.com> <20261115085826.89641-5-clamor95@gmail.com>
 <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
 <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com>
 <20261126124719.GJ38590@joneslee-macbookpro.roam.internal> <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
In-Reply-To: <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 17:00:37 +0200
X-Gm-Features: Aa3M54rzV-ViZY9z6DJq1q92HT_iE_h9VqHJH3pyc5wvVXF_KFD3s5My6-b_8Bg
Message-ID: <CAPVz0n3UgNrS1vJnPhbaEFN1rPMyM1eBHHhVt8X+Vq_Lvc8p1w@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:5=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14=
:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thu, 26 Nov 2026, Svyatoslav Ryhel wrote:
> >
> > > =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 13:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
> > > >
> > > > > The AAT2870 supports a dedicated main power supply input alongsid=
e parent
> > > > > power supply for its internal regulators.
> > > > >
> > > > > Add support for retrieving and managing these supply regulators
> > > > > (vin-supply and in-ldo-supply) using the regulator framework to e=
nsure
> > > > > proper power supply dependencies and power-up sequencing.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/mfd/aat2870-core.c            | 5 +++++
> > > > >  drivers/regulator/aat2870-regulator.c | 1 +
> > > >
> > > > Is this a build dep?
> > > >

On the second look, it is a build dependency. Since prev patch
removing platform data changes regulator macro as well. It cannot be
applied independently.
