Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792543;
	b=gd39FuDnIo+8NxafC03KgRiPaZojb+V6bkZG+ogO9zXMPNuOI+/N/ATMbiERN6AtZ2yG
	 VK6OP7AaaSIvyaanxIua6yM3wiFVJJjF1upF6MtlGZACx0OQFzMAtL+lM32j0I9cpYIvt
	 ZqQupDCqxpCdtnXDuK3fhJe8Bwq2p2E5L4JgZXxPQgrZzOw/UAG8wU69wYMZLD/Ph+gdd
	 0UfNcjXdKFUAhjUjXbw3kniVGODez4Kv19FkOuG145ZEiUCkqVRuiqBSTDAHJV+PRtelu
	 ytmXYViZFqJ5n9vtC8TTLKQj3DFsglR+7iWjRokuHJnOgaqkIH35lzYnAE9hTpBLSgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792543;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9reg/Uif2nF3+RIrec27hYdmfNRNczMU9vG6DWQUrGM=;
	b=VI6hjgfxENJhuF58A4QXpfLwUwBpGzsfqAEZ+tdbfoEjiSTK0ojXikuudK0wRNcVZ0qa
	 zrpsNAU4yXewEZQGMzcW560a/t9H/LiFXNpvTL3bH8KTr/juLI30yr9Dah9WDpCE0KaJD
	 OwraWgVRWdhTHid0AefoGJopiSaQ6DZB7GhvxhQMFf/9cZD1uogs1HeREpPpNFx25kt6u
	 rMN7FZLoVwW55DHCAE0BeMB3vbVMymLXjU+9ZZpixDS76ognpCOz/QQkrJNCv9SwQSqW0
	 ZFfM1YVSK8kq340cdqE1lFInDb6JceLxtCy/4Px2ynuZ3npyzvVGndz7hFVF4vQ3GtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZx9UVYE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B6E606A321;
	Fri, 27 Nov 2026 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZx9UVYE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE74E1F00893;
	Fri, 27 Nov 2026 15:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792542;
	bh=9reg/Uif2nF3+RIrec27hYdmfNRNczMU9vG6DWQUrGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IZx9UVYEC+ONB6GNSkKCmyHhRkh24h7mnXOjjruR1nemh9dHiURW1ZQTW8RTLAmZU
	 RV4u76uyqOS4wFY6bfgwoIGXnD9MeIsmZ6UglT/pLAJXSAOV8t1YAi2vD967f3EeI+
	 oJjzw7w50VR1LXpSjszxh0zDxHtNESLBreebedXdwf02QKDDfJQ2FZxwBploxr6Wfg
	 LSaPAfyPk0zTZBHytkGYUd4ZjrxGet9fMX53yIcTmWJSf7oD3XK0PSLtFtSVI08+pU
	 etvILPVFz6ucVGXXFOe1hHMtrXOW2rkIg1U9uIZ8BpjKI/SeNxKdARvqNUj5NM52sV
	 p3cY1Y8Szh3gQ==
Date: Fri, 27 Nov 2026 15:15:33 +0000
From: Lee Jones <lee@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] modernize and fix mc13xxx-led driver
Message-ID: <20261127151533.GX38590@joneslee-macbookpro.roam.internal>
References: <20261122170615.31710-1-akurz@blala.de>
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
In-Reply-To: <20261122170615.31710-1-akurz@blala.de>

On Sun, 22 Nov 2026, Alexander Kurz wrote:

> Main goal of this series is a fix enabling deferred probing of the
> mc13xxx-led driver. The previous implementation has been dependent
> on the MFD instance being present first and which has been changed
> by commit 78efa53e715e ("leds: Init leds class earlier"), breaking
> functionality. While working on it, replace the OF-specific API
> with the newerunified device property API.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>

This set does not apply to for-leds-next.

Please rebase onto -next.

-- 
Lee Jones
