Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB1835DA51;
	Wed, 18 Mar 2026 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843953; cv=none; b=QnjLz7hJRVZnCB9U1moOERcIyH6NaV+Ty4kGMCePJf+neqLe08oMWztNuhuST+TTJtKbJH/HDmJh2e8LbU7ShKTFioUXjfWXfyg2AjarHa/aqjW+4pQB80b3uEsm7TYDCIME5ngK7bUCUpJndNRigJP1rcPrgf4iTLVOGxGzqqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843953; c=relaxed/simple;
	bh=N2PsIoPsyaJ7VsnEGCnxDDMZ0OoYPu1Xit7V4zZg28E=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gA1H3ZqY6sv/8/80bg/2IO9pjFv1PR9qhdffDxDWyqdUKjL68ntE3PPd09RxBcB2KXHF4znUk1+ZZ7HmdKWawmlY89yLFS4ck9qfEyqBAPDsHblQf8jvkZFkTB/UBMSfRcXcEYzLymp3LdCOMNeZ9gnQR/xk+5F5dW7LsFLwgsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jrlVF/nd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JG5w3gV6; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jrlVF/nd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JG5w3gV6"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0799F1400274;
	Wed, 18 Mar 2026 10:25:50 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 10:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773843950;
	 x=1773930350; bh=Fjj1/vwoIE8CU8UbLphlvDEAqDhSGrLkR2VrJeLLjKM=; b=
	jrlVF/nd+eg7LtForar/W2ZllyLw7tm+DVa7vSLXQOnwR4YiWr/NxxDPZiA3896i
	JL5S9c+VixyXbA4OvjuSAptvm8qhJIUfZLNNCc2M0Jwj5ckVh/e9gu9+Z42tpaeY
	k32nFB0HsmyLenZkqdNeNV+QKbbFU2cY3Vll+1ZlLt+AkmLTdHSW4u9TdiJuHm6s
	BxvvBv9Px6LgDcP9rGYkGXpmXMptzhuJBVpj8Z8loB2n2jDCzlkuD7F35Vl1zr1+
	eDWFbS4k+8uBSHx/Qx2fVMRiLaAOoaLBBxGwYBVwAfJ5uwbzNdS6FzME1/fwfuJS
	MwTNehjYAolkJZGnHkLSqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773843950; x=
	1773930350; bh=Fjj1/vwoIE8CU8UbLphlvDEAqDhSGrLkR2VrJeLLjKM=; b=J
	G5w3gV6uGTJpdAZot+gW6a22AvM8MRRplHKSq1wQR7T/VhN5VhnmRGsbK/78s/FZ
	cHMEEBgzAy27+2dEOGL8c0RF13BaBK21hUOgUEkOASMVtEl5i8f/WMmvYygIxKDO
	HD3xUmirvX3pi73DECRx0u8ZRmQn2wFe0OotoTV6LY9QdWedPKDm/EResHpXW3c1
	hKv5+U29lw7yWkew18EisdKl2qNwaSeY/h0XdI7Mx8NYw3YNItOfH3Lbj+bMaCBE
	QF2FrgJHQ66WfoGBsVu+kmjV0mciFr/XZKDPnfjByn3c0gOyp+WJchR7HUSitmaG
	BQq/oeQudil+TJNXTC1vA==
X-ME-Sender: <xms:7bW6aWShVGSd5YQ81J6kCGLTpl5lFIP5puBCAWdcESraYZAEIP38tQ>
    <xme:7bW6aWljxxx0ezet3QAHw4blZaQEq-kGhll-DbIhCBa8ScqqZGoKQVINTTc7aXqwt
    Gzw2JJtZprgElomnanY6mZVN232nypfu3UPfeAfNX-Fxc75gCOLFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegfeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopegsohhothgtse
    gsohhothgtrdhnvghtpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepsghrghhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvg
    gvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgrvhgvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepth
    hglhigsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:7bW6aRom8XOF_BtpNZmhqRa4sqPxSVBZNn0LuiFjeTI0BbRrCNICaA>
    <xmx:7bW6aeVthtROeNrii4ZvgwB4N5JVTmuHisp_Esqzg7xxJGTtbKMWUQ>
    <xmx:7bW6aU071DXXAHKBjltQydHPPLb6Q-yBDintmOR8d12ARnvDbHOi8Q>
    <xmx:7bW6aX0Jyaan0ZAu1bu4Zswn2xj-oHE3PLduP4mP9cE8uO9LdSMX8w>
    <xmx:7rW6aZCvCwCdB9ey422BjriBGHwVFlh1Zw6xmRZfWHlABq2rEUREaqkQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F3F02700065; Wed, 18 Mar 2026 10:25:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ANlOrQyGGoi-
Date: Wed, 18 Mar 2026 15:25:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Jim Cromie" <jim.cromie@gmail.com>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Chris Boot" <bootc@bootc.net>, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <997e3ff4-c394-4fbe-9371-272220ab2aa0@app.fastmail.com>
In-Reply-To: <20260318-gpio-scx200-header-v1-1-626688284f17@oss.qualcomm.com>
References: <20260318-gpio-scx200-header-v1-1-626688284f17@oss.qualcomm.com>
Subject: Re: [PATCH] gpio: scx200: move the header under linux/gpio/
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Mar 18, 2026, at 14:48, Bartosz Golaszewski wrote:
> Headers exposing symbols specific to individual GPIO drivers should all
> live under linux/gpio/ for consistency. scx200_gpio.h is currently a
> top-level header directly under linux/. Move it and update all users.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> With Acks from relevant maintainers, I can take it through the GPIO
> tree.

No objections to the change, but I'd point out that while this is a
driver for gpio registers, it's not a gpiolib driver but rather a
custom chardev with ioctl interface.

Since the chip was never as popular as the separate geode/cs553x
ones, I wonder if there are any users left, maybe Jim has an idea.

If there are users, they might be able to use drivers/gpio/gpio-cs5535.c
instead, but I have not checked if the two are compatible.

     Arnd
