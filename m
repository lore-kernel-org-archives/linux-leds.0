Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF8A48A2D8;
	Thu, 27 Aug 2026 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847612; cv=none; b=fLOQYPDIB09UXESODwhpeP7Ce9L+/QVfQ0y9G9Pmkr2xRuKiaSR7Vz67Y6u2ugdrFuAJCjB6CG31kr69BSFEjbtrp5aSekxn+5O0EvRfmSHc2K9ZgrRFNAg9UFtp4VDgxiP62sLmYX4jYxjMLf2hWajTjAGtCPMFPib8Nwq52xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847612; c=relaxed/simple;
	bh=VREEbUU6rIEJKSoz1SGDLsSinXydjrOiEtkmXl2ipRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IakSWT9dabyt9Dk4m7zoySF5dAT+KEgrBDWf6CtAedsNQ3sIAowroGMjs7oyihqOrNnFTm2ZhOQyJ80vmBVH12JMPaOGgA8gzfuUyO1GpzYvoNF2Y2occfXV7u2SLTuxicxqQ8VH4qePXvSxxtd8LB1lKfXLBY/vjlIq2z1Ezvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g08ciLEl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g08ciLEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE3E1F000E9;
	Thu, 27 Aug 2026 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787847611;
	bh=WsVpXONnhu89MZANZI4ZRb4/d+CNbdaoFF0WHudlW+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g08ciLEl1l58+xUVBSvD7R4HcfNyEMy48ooHI4+Hv/TlpDdHPNJLUmaaetdb4rWuo
	 BSIa91pCXEpot1NyQ6Nv5LIBxX3l9OmKuO1Di4R0+mmvWKGz2N7rtjaI8YpFslQbJk
	 OWWI5ZlhM3EKldO03JyaK3pYh1tUmiQdeI80k8r/IwAtLgzyFeVquqEx3R0MflW5G7
	 FFut7GRGRCPHbyzfpG7+Me0WQK40e2sG0Sthfi9gZcxSoOHWUZ4zqtqZnIkTWu3ENE
	 pTyIu0f1HiE/0nQcAAhVDKOMypJ8wT+wInQri1jUIKCI4h9sVzBnn97UZgY/AzKUK2
	 eM1zRTNCJBcAg==
Date: Thu, 27 Aug 2026 17:20:08 +0100
From: Lee Jones <lee@kernel.org>
To: kr494167@gmail.com
Cc: pavel@kernel.org, s.trumtrar@pengutronix.de, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] leds: lp5860: Fix LED teardown ordering using
 devm_add_action_or_reset()
Message-ID: <20260827162008.GF2943942@google.com>
References: <20260812135001.48949-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812135001.48949-1-kr494167@gmail.com>

On Wed, 12 Aug 2026, kr494167@gmail.com wrote:

> From: Surendra Singh Chouhan <kr494167@gmail.com>
> 
> The driver previously disabled the chip in its remove callback before
> devres unregistered the LEDs. LED unregistration turns the LEDs off
> through the driver brightness callback, which accessed disabled hardware.
> 
> Fix this by registering a devm action via devm_add_action_or_reset()
> immediately after enabling the chip in lp5860_device_init(). Due to devm
> LIFO (Last-In, First-Out) teardown ordering, devm will automatically
> unregister all multicolor LEDs before the devm action disables the chip.
> 
> In addition, use scoped_guard(mutex, &lp->lock) to restrict the initial
> mode setting lock scope, avoiding holding the mutex across
> lp5860_init_dt(), which would cause a self-deadlock when registering
> subleds.
> 
> Finally, convert mutex_init() to devm_mutex_init() and declare the local
> variable ret in lp5860_probe(), allowing lp5860_device_remove() and
> lp5860_remove() to be removed completely.
> 
> Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
> Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
> ---
> v3:
>  - Use scoped_guard(mutex, &lp->lock) in lp5860_device_init() so the lock is released before calling lp5860_init_dt(), preventing a self-deadlock during subled registration.
>  - Declare missing local variable 'ret' in lp5860_probe().
>  - Capitalize patch title per LED subsystem guidelines.
> 
> v2:
>  - Use full name "Surendra Singh Chouhan" in From header and Signed-off-by.
>  - Convert chip disable sequence to devm_add_action_or_reset() as suggested by Lee Jones.
>  - Use devm_mutex_init() for lock initialization.
> 
>  drivers/leds/rgb/leds-lp5860-core.c | 42 +++++++++++++----------------
>  drivers/leds/rgb/leds-lp5860-spi.c  | 15 +++--------
>  drivers/leds/rgb/leds-lp5860.h      |  1 -
>  3 files changed, 22 insertions(+), 36 deletions(-)

This no longer applies.

Please rebase onto -next or my LEDs tree and resubmit with my:

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones
