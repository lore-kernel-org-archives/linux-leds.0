Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434E3DA7FC
	for <linux-leds@vger.kernel.org>; Tue, 16 Jun 2026 06:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591138; cv=pass; b=e6wLkCL93gAe6bbsCF/KWJJ4nfBjPy2HGdZSn0Mi8K/S39aNnpfJqHsT4n9X4LcMlP6mClrlj5PR8kpv9gAryViFsbthFcp1tqfSBJW6lPJavVP8WacqqrBF0cwz+xuTycnt1jz8ra0AOLlwa3/T3E/SQZeN+sH7W4rO5tyf9pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591138; c=relaxed/simple;
	bh=YZplQ6Ddkpj2GJX3+/D7fSo3HWc2/s74s4mdCUpbfxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sydOxfPEQh6o2n5dL5kG1oSlnMSPoxhILCL9mlNai+OSuFi5ZEhydq2vxjXIbAGZ6Og2+udJKSr7IObafF2nmCN38XM3LXm0uLKJdcvZ+wBF2W+9pRe/16+DsOg6gSbFzwhi8CbD5+Q5Rk0FJ2NKG2NEbquHVEG2xv7Y1RkDbS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9ppV8ZT; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9ppV8ZT"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304ec41197bso4678634eec.1
        for <linux-leds@vger.kernel.org>; Mon, 15 Jun 2026 23:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781591137; cv=none;
        d=google.com; s=arc-20240605;
        b=LbUnu0+cE5I2OwBCGaDpIebDfL4LZ9T3fLQ8b99jlbe+f17Dh1xvJ1xiwYp5T/NKGb
         svyfg48Nyb4yP3EDk80OgORVK5aXeMTP/zqcZ10DarFouMyLStYyrQNk3a0wSMxNDAMU
         UuUeK3ZSyBQMy4HOA0fY5tYMG0KhuQqFWbtrBKlPboyqQWWHwnntzWlOOKPA1+K/uK1n
         xHimJldbqBBgK5lY2E/Cy7yJcszdbLBvVmxhGOgRvCv5UAaQbaF67h8opTxf46YEj1ka
         8KKJX+1lMph0+l+k27Bkxl448TQgsFci5ym50UUc/OawibVGETJtjFxHa5GO6FfF1qGx
         Etdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YZplQ6Ddkpj2GJX3+/D7fSo3HWc2/s74s4mdCUpbfxs=;
        fh=rjL2YK0qouXFmLpp287ZRQijH4IYQQiiHSfp8my60Wg=;
        b=XMkwBXVuhK/QjqzVeqjRYiD7SUn/gfKTn6fdhRC06zYzIaDPXtGniasU7Q/WRrcnZA
         C2B6UEdlhhBbvYzvejLfiBNK+SaEt3xXZpuTAGWidmxBIpbF8plJjYCkDXbdrQCU+Be9
         iV32d0teKiRj5k3iDrs2K+p4bgghD2vniItZFYuZcLYIfCaiRSHYSIpl6IDtgb1MDuj3
         PKK86REq4mAsv0qahz1UXP/1wlpWbhAziAhcSsdb3uKRsO2O+QD7aZ+LiiCZGNgEJvfF
         JwRQPzxU5Alummg8CV7fJQYDMmNxB9ADv8fPWjU5kPGJRAh7Uv1wal/0RNuSVYukN/WY
         Hwzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781591137; x=1782195937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZplQ6Ddkpj2GJX3+/D7fSo3HWc2/s74s4mdCUpbfxs=;
        b=Y9ppV8ZTAJsGkPvzOdot+jVkZSpot2S/5K09jxMR9cndK3snzxUex6zEB7RijV/MhE
         d676Jd5D5crvU0ByXtjIRIyE5cfGMsNrD1/DzdNguEPz7m81ogiQVNHOVS95V500qCQS
         KA/ZVzykUnB/4utvkfwbgYi43Paecnjt10/nYwU++LXJp+fExcaFT2+WRgsFYgipR0Lf
         VlHbTudjLw+ZFrzcKyh9QdAe7KNSHTL2kHa0GAp5bXbJbfGUDeQ2fUCHwnQ1M3g7qq10
         7tMes9ttSCCEwlUapmWdmWZKGAACmONaU9fNpepigCdqX5PDHzEjCNLcNt9brCLhSmdZ
         GQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591137; x=1782195937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YZplQ6Ddkpj2GJX3+/D7fSo3HWc2/s74s4mdCUpbfxs=;
        b=C++JKz5k7dD2eiqwdwTNBuPha1RLZX7KDuXtgzgm6ADKgI5Yr2ErJSFqyi7NUuOZ0M
         yfScsArItgCQMViEgGucgcRl3lzpDDNe7DhVqToIzqN6YGQGmk6xbhkJjiZNWQ8CEHda
         v3MHj3TPcsGN/t7TuytuwTP+8WV5YjATEoYjJ3ScLQrYIUSLa7/yOJGw6UThGQwUChU6
         cBwyzmo1IMv99+2b2SmO49Utw6xboD0s7bBe7HzLQxTfMSW/H11dSg+Iyu8KtlQTogIL
         PCmGesnrpc6iVrzaI00M02g3UsdFRUXWKITmBAZ+yJ3GNjMd0B0kwsE0RExeeU4tHmKo
         tcWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QNXsCZQzU1EtfvDN2F5E0TBSo1m5X+SMgD8qfE6qKrOQ4upofLd4PYu/TbkgRZky/pMlo3Uw1qNlL@vger.kernel.org
X-Gm-Message-State: AOJu0YwR2Q2KL9aiWl/UmU2edkrLZMkgBV07AW0gJJ8U8MEJJJBcTeA1
	gJyQtzJqFonk86Y5f2k70cPR85HDzxIdwfWJNEranPTO4c6op0eSk9SthjnrK74A8dmYv4Nn0CS
	xbBLAoYK9XJRCK4y3Pb7dvivZRdn/d28=
X-Gm-Gg: Acq92OEGGqFuYVMiyr5vkis2csiTPVsxocqr+jsYwPxjNx5IQl173r/uMGDL4SP+eHs
	MTk3vzSOGe1yNJYrOlzFm0+IgpcMvFOpdW5Offx18eiJiAIeZlSYtLNGIRyWs8Fwp+7LzlJ225w
	OXo7aI3soEfsMhcqsD3mUIt889CkPkwZJEP3JT+81OKMz4J2IfHxhiJ9c0ntPwij9JB+9LwegD5
	DWAFbNzJ//nwwMMqsQaGI37UzGZnsCJpFTME4gbaK5EnR80uRDq4Q5KckB2C+q5j3p1a8BxMHw3
	oDCvBpOD
X-Received: by 2002:a05:7300:2202:b0:304:5db8:da95 with SMTP id
 5a478bee46e88-30ba5f6dc2bmr1364047eec.23.1781591136757; Mon, 15 Jun 2026
 23:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528053203.9339-1-clamor95@gmail.com> <20260528053203.9339-5-clamor95@gmail.com>
 <ajDPtOyr8GJYaVYQ@google.com>
In-Reply-To: <ajDPtOyr8GJYaVYQ@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 16 Jun 2026 09:25:25 +0300
X-Gm-Features: AVVi8CfyBzDLnTjfR4jMIsriu_x6XwPfClLdZn_4ROEykRr_gBRt_FIINro_bck
Message-ID: <CAPVz0n2fnM6zYtP9bCtsY9mcLdce_R+1UPmMo0o4JRgjnhuhKA@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 16 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 07:2=
6 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Thu, May 28, 2026 at 08:32:00AM +0300, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Add support for multimedia top button row of ASUS Transformer's Mobile
> > Dock keyboard. Driver is made that function keys (F1-F12) are used by
> > default which suits average Linux use better and with pressing
> > ScreenLock + AltGr function keys layout is switched to multimedia keys.
> > Since this only modifies codes sent by asus-ec-keys it doesn't affect
> > normal keyboards at all.
>
> I think using input handler to intercept ScreenLock + AltGr is quite
> awkward. I think this also passes the original key events (unless you
> make it a filter not a regular handler).
>
> I do not see benefit for reacting to AltGr+ScreenLock on other keyboards
> to activate the special mode on this one. So given the fact that you
> already mange the data stream when you split it into "serio" ports,
> maybe just intercept this key combo right there and create the input
> device and signal input events right there?
>

Though it seems awkward at a first glance, media keys are integrated
with a standard keyboard in a detachable dock. It is highly unlikely
that media keys will be used with a different keyboard then the one
that is integrated with dock. Additionally, the ScreenLock key has a
code specific to this driver and is not in general use, so even if any
standard keyboard has AltGr but none has ScreenLock specific to this
driver except the dock itself. Handler is also set as observer so it
should not interfere with work of other input devices.

> Thanks.
>
> --
> Dmitry
