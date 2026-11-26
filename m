Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695590;
	b=cic7b6u0zZkoNyksXfs6XJ0kqXpiq/W/NlzCMHZ3iibMWXMkM6ng8IYYYdyWzVKJnDdI
	 irpi5KPi6m2dS38pd6lcZtauJGc7WS9CVvy5PjAfHcyantU5w5QlUP6m0xUeH/vfLr6TK
	 A05Hd1mql9ViPTVTv7oGSAUsxFL3WtOCeSQooIaw814DkUIGdYaEMaT3tZZl/mb+w5Kk9
	 4uFbm226Y+8JFPxkLAcZ5IA3B4w/HV8yeK9+CIPvE+ziwYMVjI1LIz+sJkTTflBVcm571
	 mFss+/moOHcHxOmYXT2QhBp3i0j+WCVxSGEv1QsnTtfT3QOr2hdA/B7QjLvjxmBLgTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
	b=aqb3t8J2x88oQCEXxTYmhOWiUmENzu9ADg6Tik5XbJPnfgqgeEkLQW0LrDT7EBoYLvRs
	 BIomU1i0/1THg9L1CUeaQ5liJDli5cR12CIgr3G3xFGfjuHrHs1askhMijSHeM1RCsP6i
	 kYAXaJ0xZtgqjGzQ1habnZcBJ9CL9NaTlRmUHYDDmZrX04H8rZSrHJf/1Rp8tFPpaRffs
	 Pnikv5R0HEl67t8eudTLmOufc6m8aFAxrFWDd2beX+o1paGX6iIcSNYZBRaffnPF+TZeW
	 hRaqeqoYgsFzFW9ObRRxK2CtMsu+WJOeoRqlvbTRRjzF4b/2Pc72mCfE3mDpv4h4p3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmBxGrzJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B65606A323
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 12:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmBxGrzJ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so13508140eec.1
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 04:19:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795695589; cv=none;
        d=google.com; s=arc-20260327;
        b=UQFX4s+5JCpwYPtKUX5vUCR6rnedvRbQac5YzVc5Xl/X/zH78dYx6PFYeO/ZTXmcNK
         +wFJOVVRGDpuSgeigq6oEl3KQwrIyGAirZS4eVoriYOzD0bYkEge7/L77kU1tbEySgDA
         2Ka7SWf/5uSbrj6r1ITQRp1ZdcSM+3e2OUJGnYZYBLEh8VGFfQkvQjSYdEWkLQl8+dWF
         geK53Gc/AYTjME7rSCDI3Reur3SSHJcHsyO22srQKckV3PGztCXSmETcTcg8h5/YZzdU
         VcLBv1tm8MIiJS4xi6a7mGwmXRFQCr3oTaJs6q3briZ7PuJC9UtXYwi11cnMBiZFpQxU
         yaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        fh=iutD7fSeRSrgnjyt/NGHKKAZ6tvditnG5IKryt3tZrc=;
        b=qhdJVa1PJQgQ5CMmFu4Hlr48GVp9UqrGJ5LKH0oBnz3M9V10QUa7fEkvGgNakZNCfb
         ZcMMm1SdsLEcnwFsuUH+gLjgoKW526hO7jD3moSsyqtSRvJbaYFF8Kbc5Rd5FK4WWRG0
         aPAG/HhZxfolQ3X3GKXdLNxBnQOl2QkvZjPxCYiD8Chys+EYzWjtrxMQku/grgP1hkef
         /r7EtMWl5/FRroKgXzvOBOtT0F3ThkR4iOl7P8J7zKHXbNgD3DiQJGDIGytk96Cc49Zc
         cNhcOR40SfEOWfRMw4nTwcKQccLMw5vo5pzN7uXSQXTHxOG63vMy1csNgHPW0obx0Di5
         /G6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695589; x=1796300389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        b=ZmBxGrzJhTff5aHOs/gdEmaqTtmzb3cNqrz90ByOV0nsd9sPJVTvPw4ib2z7Xz2U2T
         zeoXuExG6ztFaCDOlqkdQEmEeMK7kF3NEU5rPx8H1zECXtvx2SX7/ffeOQKvQZ7oQRaa
         vZDDRbGBOrawAgXtQ7876XS1JciYFJIeqr79tg0yZUFupgk3irXaVcRXDKYdhGbqI2uU
         K4DSTfkrhdalXsS5yJt5ndgebJqzCOYHImC4VFLvkqLiothLQPNJi2B+BL+2Pkd8Hsy0
         7npPQ979+vZbmCzyUXKxnAcXwyqxDJw2KLLTk5aknnzK+/+CkAjtOXm/iCa6EWAG/HOu
         m8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695589; x=1796300389;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        b=siCEGywlQXjKGqQ9LUO2V/nfAdYv+uPmGdlPiNdMZZR64kCfCb0BYRc6JqU7cjzLXd
         OQVGymZRyvSvkMf5I9ppH6TPWKWLtXzZntV0SmJZuBIoxxgh2GUEICDSuhajt2BUXhC7
         Dxujcw0Nvr/POrzRXT6UL6+zVVPfVsfVWpf2r8jPobcRq8goYIanRr8BQde3+jFTN40c
         /JlwvtWcVT7BfQEOFPMM8K+rwODxnSoiqGbSK6u3NlW6J3IeXDm3ohCjqChPifrxZ+d8
         RAFq36t+PcKJByuP63c3RWbn/FeEiB7Q6prpO3MdrjAQKOIrNfiLZQI8tZYteoNc6EtF
         5dtg==
X-Forwarded-Encrypted: i=1; AL+hErFDwHA6Zrum0rW+RJ1b18d329hxiZdPV0NZx2sB7BMg1vntku736fTgHFG55EZrIVIHP2/ECUAd8Ui2@vger.kernel.org
X-Gm-Message-State: APuU4Z81QEsAfjLgmo2uESTTMUWPmHDjodxsdOYF4f8zJSkb6Yg6FQ45
	w/Ej1DmZjrFocVpLxs2ulK8GO+TsduLTXVesAdM/y0Jsizsr54wgwfe1T1tNVKSwdbiJnB8teAC
	e4sGOE2Uo9Y7eIWgWmMlwgsPC5CeyaGo=
X-Gm-Gg: AZFdTZcFH0VPs84d6iYE4gEOOXSRLjXqm4qREBG69rWtryidTlnyTin0Wy9ZsQeLTV9
	M2HlnBctbOXvMD1Ikt3+4oyxSuIMPJbk9Am6TRJskpmcDOn6O3//JkoKhw+iNn/mj2n8hgX9SxL
	MOBS/jX2rX+T31MIFxuJ/ox7mGYggeHaenhuZGKSK0kgRtLuwTE5GBzZwq8HCJCb1Ievt/7w6ED
	gefd40bP5jBhHflStHJTDyhSv0A0Ma2mbkwKVuhaH7ozDddSWwNIcPPp/Sdj+tKfyY+9KYo7jny
	DArkQ7BgNzLTGc53YdUXR9ZpMjXuWn+7vLjE2tY52zeL1Cv9JesSYpwZah+JL5WkRi10qYKbEf8
	y7aZa0S9jRwKRrtUqy0ccu9thxxwewcP3JD7C1Dnj16T7H5TqutAJPI/eRR95RcTx4/M9KabGKl
	U0AZJZVFrWusXcPIGAbKbS6ZfxwPHMWw==
X-Received: by 2002:a05:693c:895b:10b0:385:cf42:9b98 with SMTP id
 5a478bee46e88-385cf429dcfmr20910606eec.34.1795695589053; Thu, 26 Nov 2026
 04:19:49 -0800 (PST)
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
In-Reply-To: <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:19:37 +0200
X-Gm-Features: Aa3M54o45-8oLpV7u0fds3mVX__iIW7iqATGNdrlwb2jFlsQvtadJWGIKMAZpQU
Message-ID: <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com>
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

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
7 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
>
> > The AAT2870 supports a dedicated main power supply input alongside pare=
nt
> > power supply for its internal regulators.
> >
> > Add support for retrieving and managing these supply regulators
> > (vin-supply and in-ldo-supply) using the regulator framework to ensure
> > proper power supply dependencies and power-up sequencing.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/aat2870-core.c            | 5 +++++
> >  drivers/regulator/aat2870-regulator.c | 1 +
>
> Is this a build dep?
>

More a logical link, I can break it but it still will be part of this patch=
 set.

> Would something that was working before, break?
>

Other way, it was broken (aat2870 may have a dedicated supply) and now
it is fixed.
