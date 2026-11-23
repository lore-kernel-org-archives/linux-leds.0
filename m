Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438475;
	b=oim4zbw5YT9czOr7g/zNZsnn64ARWzeQmjgi3BLoUF2ZFj1gvgy4Eh3Zw7Pefm/u8Avz
	 1Qfcvq5G5ZINwvXY1lEw8TJHNWrQ5CyCfD2cUXTCAM7XTniEB4ecyiB/lgsiBAzKE0Jdk
	 MjVOw37MpNylWb2SVzf1Hj1NUbueefju5LmTzFbM+7+3BLpuSn7vi88Sm+nyJgbrYP1rS
	 LgKULGQyp30rM6COHdXgcu9pfciHlpXwXKaq4AgddNrLtT5UCVTphFX1/BA47syPqiC7g
	 BrmOq+Ccu4WZxch7FErhs1O9LjNnt6abITES83ERRqGh76LFTGHUrVLcFrjq8+deegg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438475;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kWxY/9Gy9tdFT6OWvCFyl6yJaFdu+XKvTwj6mE7HBww=;
	b=okBWgQm8LWh1PbjoHDTKRrnNvi3CiVutdovrr5+jmQIDn1SW36JZCx8NsUF91eA+7A9K
	 y83E44d6tvekE31JS0/fhfs+w57uUludQTnCZSUaHyMVO/u9uTKo5dhit18vWS9yGqEqL
	 w8pP0y8XBFSFH8Mnr+frFDdB+B8Oj7D4FVV6EECI55ravGnQLfAMtIqvsODECaFoMId4p
	 bX2naiEsBXV7Tw0Wc4MjUV2y4q1vT2y5dtf0H3J5Moi1ay6WVEn0KK0TOHzePW4j2MEHr
	 XRAqrSajJaJutNn4K/aXpu9ymOMeOtOvwjkVFf6Z/xdwKrCHV6sCaGTHMZoWPVWZzvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1sDsPVVb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB9606A31E;
	Mon, 23 Nov 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1sDsPVVb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A271F000EE;
	Mon, 23 Nov 2026 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795438474;
	bh=kWxY/9Gy9tdFT6OWvCFyl6yJaFdu+XKvTwj6mE7HBww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1sDsPVVboH7NmxwdRmVEd0TcjCN7LYzy7dgVzIQKmi0fNAA6/cvcuBErRKjoVt5we
	 A65Qb6iL4GtJSVF6I2bGfR4RuLZpVHDBSkV0fPawuyNmDpv1NOgWYMQbdOF0fbHPdO
	 3B58m3Bo7z0+h3k7VIpS6M7FIZjXLl2MKrGlFops=
Date: Mon, 23 Nov 2026 13:54:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
	Christer Weinigel <christer@weinigel.se>,
	Jim Cromie <jim.cromie@gmail.com>, x86@kernel.org,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 0/3] Convert National Semiconductor GPIO drivers to
 gpiolib
Message-ID: <2026112347-bamboo-chatty-b633@gregkh>
References: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>

On Mon, Nov 23, 2026 at 01:29:52PM +0100, Linus Walleij wrote:
> This is an obvious attack patch to see if anyone is really using
> the custom API from these deviant drivers/char/* GPIO drivers
> from the early 2000s.
> 
> Probe PC8736x through the ISA bus API and create the SCx200 GPIO device
> from its PCI bridge. Register both controllers with gpiolib using port
> I/O. Describe the net48xx and WRAP LED GPIOs with software nodes and
> switch both LED drivers to descriptors.
> 
> Remove the private GPIO API and per-pin character devices. We assume
> there are no remaining users of the old NSC GPIO userspace ABI.
> 
> An LLM assisted in the implementation and x86-32 build checks.
> 
> ---
> Linus Walleij (3):
>       gpio: convert PC8736x to gpiolib
>       gpio: convert SCx200 to gpiolib and use descriptors for board LEDs
>       gpio: remove the legacy NSC GPIO API

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
