Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E138B14F
	for <linux-leds@vger.kernel.org>; Fri, 12 Jun 2026 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260388; cv=none; b=tVZy0NyP4jbdi9K8O7PxYxB2kxBWrMEAGrwWLWq5ERaf9NHW2EY9bOtQhgoPhurMf6tOuTGoRQ1aCPkfVo2PO+7OP4ghCQShKSm3ssrsd0k1/dJTxGRNebBS/SMdvSdB+RKT7p63p8w8y4RMe5u7N24bNAVsiqhC9WuPhKf/2lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260388; c=relaxed/simple;
	bh=GMIx4i7KrlMIuxS0edaZd61Qyw/um7dSwrmGRPbBKyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sf8rJxcXys7Wts3VpU3wqbovCD3rZgE2QJ623lQFu3/X18w6hLiiZYrGdxgVl5VGfnLLdoVU3fSTPQLlc4XlIeSAoCkKJHNBWvKq6kAMhQ6qViVg/VaTrq4uqgLPTIYirWmfPpmAHoeEU97SsmsxFPOM4NJl2MFu93tVF83ss5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=Rf66uNSQ; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="Rf66uNSQ"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id EAD7C327EF1; Fri, 12 Jun 2026 12:32:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1781260375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lOHlgq2p1fjD0Xmiw+9SJH+AenF7lRtlL4MOJ5bfXo=;
	b=Rf66uNSQRKKQfB1F7gzr9HpS8hZxpBJSPUdBc4tlBUc/lRPTmYot1GbSUtmLjvtXit2mUy
	EuJGFiEZvbJySd9ChS64yQMa/T3hLVTbPGA3NqRYAOwPN1YOdZ4FLsVzCsfPLtw3mjROke
	MH+bNsHpiD6YBjAhwpXIcUtto2Rl43w=
Date: Fri, 12 Jun 2026 12:32:55 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Egidio <lorenzoegidioms@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: tests: clarify name conflict test It is a good
 practice to use a fresh led_classdev instance when doing the testing.
 LED_REJECT_NAME_CONFLICT rather than re-registering the already registered
 LED class device. Besides that, do a zero initialization of led_lookup_data.
Message-ID: <aivgV_T8QCVXs29-@ucw.cz>
References: <20260610172107.507-1-lorenzoegidioms@gmail.com>
 <aintc15RHlD5iU2m@ucw.cz>
 <20260612084519.GE1212816@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612084519.GE1212816@google.com>

> /* Sashiko Automation: Reviewed (0 Findings) */

If Sashinko can't see problem with this, Sashiko needs to be fixed.

> > > Signed-off-by: Lorenzo Egidio <lorenzoegidioms@gmail.com>
> > > ---
> > >  drivers/leds/led-test.c | 102 ++++++++++++++++++++++++++--------------
> > >  1 file changed, 66 insertions(+), 36 deletions(-)
> > 
> > NAK.
> 
> Definitely, but can you give the contributor something to work on?

Do we put entire changelog in a message subject? No.

BR,
								Pavel
