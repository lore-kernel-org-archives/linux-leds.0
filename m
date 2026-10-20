Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530579;
	b=Kkuu7Vdwj4kYX7xY9mllpxfc7EcHAT7L/xMJYOhYi2lBB98Lm2QZELbGvFCHzexLFdOE
	 fIo1lyV1eg+SPzyTctaigPvuOeALTuDF0kn2103xumtXZTWllees8mvpF4jMI9ZCGzZsi
	 bOjomqjvW4IxD+zYMjTIn/nLfSfi1639mXJlpd1Vbpnv4v8kNt8VivWfvNFEt8BW+XAun
	 ZXqvuLDI3qvPGklJhiia/gR5DhW+79vw+HEogygePwqxl2p+8XlFLJ+qjVwQIGaiwW6YT
	 Bc4e2WF78Y3Qk2iJ3JN0E/+QNBgWiuajv7eexQ/qhlmLnHyMQ5m9w+PMNxbk/LEYM2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530579;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=M93DmeGlZygcyyCb8djuafRGbQIseJa4Cxd6+PcQ6LU=;
	b=5bC7W9q+qoBZ3Vxtverb5CYloSFCtyYJKRJ0vTNC/SZ8SijZjE0gV56rU1qIEUZPkhxe
	 TJm1ILYBwxZo4nb1qUwIJ0pEEXDXmMvL3YPrtWUmAx69eJEEmjTp4h7MfmhJBij5dVj/h
	 gPIFYZvslpdUVv8Rt4c02tcEHi14I4y34bv0BinbsUsp/TbpSn8Au/PoJjFr+TQ35jBUe
	 arhsK5fgbWdmWr54Nt3B2c6jeIX7Q2Xgn1/QPPAtKbL8Y/FxPxHNFMPOrC8p7jWOHb2Pq
	 j0GJnVZUDgLJusmsGu6v0gQNg2dTX7y8LBlH8km4s9sgU3axf2egf0ZJAyIuwfMMWYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gWwdTzW1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F6F606A31E;
	Tue, 20 Oct 2026 21:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gWwdTzW1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4708D1F000CD;
	Tue, 20 Oct 2026 21:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792530578;
	bh=M93DmeGlZygcyyCb8djuafRGbQIseJa4Cxd6+PcQ6LU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gWwdTzW11oXxkSHNEdH4fitccnfSU02nEVQLw8HRzPVg7eQNJ7Gouuk+8zzHxK/AB
	 9MJyrtKUBcAT8lIQjXS8oWL/AYSezgOKEq7kEJTMkY5ANemfemKDIBhjUWhyKdnvc1
	 XyjpzxH70raTye+mhA7Q+SkA8Mwq3b5LwNkLXAw4qdnhMd2qqFxHqWDiEaM7mdwh4P
	 Jk7kLMYLFDywp/c6KvUQCWHFNGmN7WHFtj6MBMqBkmeSk8wtRgPhFHtvkyYfbJIHcp
	 SmPwNgFwZmECwCPCg1AjSREI5rUh9MNuklqYuGaFWLAwfxiOybVBPiq9mU1P7gC6IF
	 deMZaMQZhLl+w==
From: Imre Kaloz <kaloz@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 51/53] leds: Add driver for the SGI Fuel and Tezro front-panel LEDs
Date: Tue, 20 Oct 2026 23:08:30 +0200
Message-ID: <20261020210831.12225-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179198335037.839288.6380344650126608454@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org> <bdc0fa8089faf9ce4ff80695035173ab59357227.1791890466.git.kaloz@kernel.org> <179198335037.839288.6380344650126608454@kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


On Tue, 20 Oct 2026, Lee Jones wrote:

> > +struct ip35_leds;
>
> Can you find another way to avoid: leds->led->leds->led->leds ...

I can, and it comes out nicer too. The LED core registers the classdev
with &pdev->dev as its parent, so the callbacks can get at the shared
state through dev_get_drvdata(cdev->dev->parent). I'll set it with
platform_set_drvdata() before the registration loop, drop the forward
declaration and the back-pointer, and have the update helper take both
the shared state and the LED:

	static int ip35_led_update(struct ip35_leds *leds,
				   struct ip35_led *led, unsigned int state)

> > +	struct mutex lock;	/* protects ->state of both LEDs */
>
> Not sure that comment is required.

Agreed, gone.

> > +	mutex_lock(&leds->lock);
>
> guard(mutex)(&leds->lock) ?

Will do. The explicit mutex_unlock() goes with it.

> > +	for (i = 0; i < ARRAY_SIZE(leds->led); i++) {
>
> for (int i = 0; ...

Will do, here and in probe.

> > +	*delay_on = 1000;
> > +	*delay_off = 1000;
>
> If the hardware only supports a fixed 2s period (1000ms on / 1000ms
> off), shouldn't we only accept it when '*delay_on == 0 && *delay_off
> == 0' (or when both are already 1000) and return '-EINVAL' otherwise
> so the LED core falls back to software blinking for other requested
> rates?

You're right, and that is the better behaviour.

> > +static struct platform_driver ip35_leds_driver = {
> > +	.probe		= ip35_leds_probe,
> > +	.driver		= {
> > +		.name	= "ip35-leds",
> > +	},
> > +};
>
> This padding is creeping me out.
>
> Why would you line-up things that aren't at the same level?

Old habits, and no good reason beyond that :) The tab alignment on
.probe, .driver and .name goes; v3 will use a single space before each '='.


Thanks a lot for the thorough review,

Imre
