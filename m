Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039849;
	b=jzaWc/adgPaZj+5vLg9oJQFnG5luWzRtpP3XGjdGKEH/AGxD37yIqLbaFTjAXX63HHSI
	 a0LZd7cj+RfLFvUJIYM0LVvF6g0P7nJUcDQ3nVIswkafKukKNRoB4CUT1enORNEIGy4D3
	 qLBV4TBIePl/ISztwS1KcliPNjzCp/AwiJRvE4eiHejP3Do57veprSSxBWHJnoUnmuXfy
	 qb1LG8bT4fC4qb+fHRAw388snC2n4r3Yin5CrVDygBttWRjIU/32Gcn8IPxgKDc0fRSQI
	 Qb+rjsp2M26N1WTAzDubFRoV5g31ZSkAZcpoXfbnnQMvVd3ip6aoNVAj+nOWiXR7J/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jz6PhmHAqHAHeg3j44XUyEwE6Xd1Y8uRjpXGP04iFfo=;
	b=X5Sgo81JkgqVuDvkMCR3p3cw3051L0eTbpqhUtHU1WCX9IXs+C4IipWIadb6KU65P8tj
	 Mqv4ArqkrauT+0T54mTtpjGGCHdBP3glLRIOhA0ghFhnaDnS7Qr+7H2Nhbn4rz8LeB9aJ
	 JiNEj6PhzsDvg2GeBdbF8eVLL9gPDW1mG57yNHlKQVZebLeAIMyYSaJRm81yXMRfG6xGG
	 d+Gc+ZjCJ5Al7FH2e605J2IzMpeCUdgB7np8yu1kGW7TG0ammDaV3G7JiCsEoBYxqGaJ2
	 omrw2IFGVSozdXKb3HCEkJ5Yw5CCYIRsI326rOrnkXylKftGj6m2ZJsWlB3c9pVy8lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cVO0Vd4B;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F79F606A323
	for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2026 18:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F79F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cVO0Vd4B
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so11494305e9.3
        for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2026 11:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039848; x=1793644648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jz6PhmHAqHAHeg3j44XUyEwE6Xd1Y8uRjpXGP04iFfo=;
        b=cVO0Vd4BaAgLdWISFKSYTIzQtS1MXDzRDVaSVak7zkkNZEW5+3DDGPQvwc1ImtkYYv
         yINVsVjI2CegnkPDhWXYOUuK0LVB/YZkXr5B3/P3IPiOiJZJIigJ27grxIEVt/3yyQut
         ZSJET+gCiv1LI3fM9mA4LNQq2TpU1GcRnP2vBl0rVylFXi3tAN/d3tIzMVHBIDHwvLAB
         uKPpT+lxdnIlLVIDYzFiCi/RRIv5zkhBM5wKxZASjWoNLOQFYg6qGn3iPixYOhg9ky09
         qkkbmrA/P20ZQVk6g0ePZUg4pvAZxwDZNeS4oZAVcU7P0L8lHKDyCIb++tsiW4QABTip
         fXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039848; x=1793644648;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jz6PhmHAqHAHeg3j44XUyEwE6Xd1Y8uRjpXGP04iFfo=;
        b=HLE/3oiNkW8l/OAbkeS8Zuf1lnH+6Cca0BQqY1IdXyxPYQIRTlwC1ZUVe4PW63bBbC
         K66JFO9Y1Tt1w6q9Uc6Q1+KFx7CVrD2tuQDt1LKSj4FSE5AKnVEjGsF/4kgna+YiL1x7
         0dZG5Aa4/Kuk4uiEVfC/QGQCBvDEkZQvk4uBxJ3pptL47xXwuBmjxYc8qMAImuOoayKK
         s4KipB+iit/aMipbSo6rahbxDPPm3awj4VHCIsK30N5rY9yrbpF3UD31I1gM+KXSFoIk
         fO5+983nTmQfW75dSMQKGIt4ludVxLPSK+eCJqXJFLOnjKD9Nosdu/b4lx2pKIuwh08Q
         gPrA==
X-Forwarded-Encrypted: i=1; AKwUvByElj7pcCzBVVcXfP5SCFsLsT7G0NdTDY47j+o+gINmBXkltBg8CHQ2NcH1whTSevVf7dfBHEQSh9RG@vger.kernel.org
X-Gm-Message-State: AFq9FYJK3lnJXjTBRZgpAXSGGh9YQhpLE1TyR18T0KcBFLKdJqFW0kYu
	O8OxhjA84ZVekXBsk34MXsM2iC5oxmoSIV+GAXbShj7RfRz6qqgC1lw16GFlvVoD
X-Gm-Gg: AYBFou3jr/AfRP09M8KC6MWxr0uB6mpVQic+TOzV6UVmrkX0bpceBFtmMFMRlGF6Toa
	pAA8KmUSrBOkDgrTBQNh13M1i0OgAuZsiXFGRVMWdN1R3RhQ9wxyMezUvLFQ1cEueSAmhb1bPVa
	ck1gtkN6GHW389MJzKHnA6j4LU/P5m0f1hKf0CiYSQD4tuWJVfDaewgtdTf1tin++ERYvuIZJpt
	VuP2HVulOggXkcMTJmW/64Zy3By5p/QHjpBNXCT/35q9VVi3XBVKlbR0NlMNrS6kegdynxyFlDX
	a356Sz2jJ/VmGQERd44Bxcm2NeMBNZD1x86bJotoIjSVXHQdywU95n73CC0uWgZEH7rbxrpFehN
	j9yPbKINelw0wiax8Uz5IEW/TXQ3/Xa1y9v762LCRoaJD+/6uNDX/Zalv8zGFhGTESnNZEr9ua3
	dndCRCikTDvk7SzrK9isc90b6seOXC0Df0AwGfr21gnZdYLMkOkvCB1hxB4w+hpU/dggaazBDpk
	p+hnj/W/SGqUM3/j+Xmluw+RFxzg4PlxSkKiXnGfmao9vf/ziTgSBchZl8U1zDmm1t1dBRi8KJO
	dbj0idB+6AqvGf+z
X-Received: by 2002:a05:600c:3e8c:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4a35acab6cdmr122544295e9.28.1793039847593;
        Mon, 26 Oct 2026 11:37:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm211231605e9.8.2026.10.26.11.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:37:27 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:37:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>,
 Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 14/21] leds: flash: Avoid divide-by-zero in
 led_clamp_align()
Message-ID: <20261026183726.30238d39@pumpkin>
In-Reply-To: <20261026173129.GF2195460@google.com>
References: <20261021123406.3163547-1-lee@kernel.org>
	<20261021123406.3163547-15-lee@kernel.org>
	<20261022220006.6e066670@pumpkin>
	<20261026173129.GF2195460@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 17:31:29 +0000
Lee Jones <lee@kernel.org> wrote:

> On Thu, 22 Oct 2026, David Laight wrote:
> 
> > On Wed, 21 Oct 2026 12:32:23 +0000
> > Lee Jones <lee@kernel.org> wrote:
> >   
> > > If a flash LED driver leaves a setting's step size as zero, writing to
> > > the corresponding sysfs attribute invokes led_clamp_align() and triggers
> > > an integer division by zero when aligning the offset to s->step.
> > > 
> > > Clamp s->val to [s->min, s->max] and return early when s->step is zero.
> > > 
> > > Fixes: 7aea8389a77a ("leds: Add LED Flash class extension to the LED subsystem")
> > > Closes: https://sashiko.dev/#/bug/linux-9d06d7fe-310b-4aee-8b16-0fb49550c287
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > ---
> > >  drivers/leds/led-class-flash.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> > > index 181dfd49c6ad..16b3b6b9365b 100644
> > > --- a/drivers/leds/led-class-flash.c
> > > +++ b/drivers/leds/led-class-flash.c
> > > @@ -375,6 +375,11 @@ static void led_clamp_align(struct led_flash_setting *s)
> > >  {
> > >  	u32 v, offset;
> > >  
> > > +	if (!s->step) {
> > > +		s->val = clamp(s->val, s->min, s->max);
> > > +		return;
> > > +	}  
> > 
> > Why not just:
> > 	u32 step = s->step ?: 1;
> > and then use step instead of s->step.  
> 
> I can see where you're coming from, but I don't think this is better.
> 
> With `step = 1`, the reader has to mentally trace `1 / 2 == 0` and `1 *
> (offset / 1) == offset` to see that it reduces to a plain clamp and the
> CPU still executes a redundant integer division.

That happens with a step of one anyway.
All my suggestion does is treat the unexpected 0 as being the same as 1
instead of optimising for it being zero.

David

> 
> IMHO, simple, easy-to-read, maintainable code wins out over clever code.
> 
> > > +
> > >  	v = s->val + s->step / 2;
> > >  	v = clamp(v, s->min, s->max);
> > >  	offset = v - s->min;  
> >   
> 

