Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BC443802B
	for <linux-leds@vger.kernel.org>; Thu,  6 Aug 2026 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017358; cv=none; b=MwNLPY6Im/gJHXElRSJmp8BoFzWnFZpHRhfsw7zhpLSXr3/Gvx5YM+IwxO5W+Z7v4I4hNesfIZ2RLwYPwHi1kb+qpeXBxEfr5an0VBHAWa9rspA1kUJAld36ydAPW9ZkNOSS7MBPxBdRr/i5JPjKogmoApxa1USjZcPW1KgUQWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017358; c=relaxed/simple;
	bh=u9DsFEropX/azWpQq0ZKgp0gvOe+LMuO2ny55HM6RWM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HzEIeuHk2KZfyaYdIwgT8NGS/xy4HlGACgAnbvrlRGgnQb0fF7BcLaaNYVusNPbkhxLDKicdh9DaPS0Bf/r3viFuNGdyEMSX3vPSo6hXSxAQ4+CswdizSQcPHqGkd9YsCS9O+lZBcmqbfTI9jR0aIgn3/XYLor/9HE1GaRdSfmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=CB+hr859; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="CB+hr859"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=mzqiDwx/X6pLHYrTCt+QZwp3gtizoxKhbLnGniWuVAw=; t=1786017357; x=1787226957; 
	b=CB+hr859e7tJyA3oewN2ELO3PxoalDy2Y+tMo6jam6JuiYf/rE+7k2jEbZpurE8UTAWhfXXDtET
	r5IKKv+nTFtTzQW54Wt6vfhdYAwQlDFAt7PYYHuXsYUgZXzQkCZSwCrhPtcf6RGZy5GIFMmMN30sA
	P3XLUpdiNIuUXMuOCN6zAh5C3CMFLizZrwS39sym+0GKE4KbFzCNMv/vVJBbymzyRKY1JXj2hoSEy
	NIXBp/Ctne6bq8EIeSfUMx5T4MB+BWKgB5bOE3a8zKN5aRbXT/feD1PXZ0KDpg9kApuCIp58XxyRK
	pR1ZVxSChkw7BAq9hhD9Tnc2GRJU1VSorgVg==;
Date: Thu, 6 Aug 2026 13:55:50 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 linux-leds@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3] leds: is31fl319x: modernize registration
Message-ID: <20260806135550.2d57682c@kemnade.info>
In-Reply-To: <20260806104525.GC10716@google.com>
References: <20260804-led-modern-v3-1-297720eec19f@kemnade.info>
	<20260804135515.5DBFC1F000E9@smtp.kernel.org>
	<20260804164101.43753f1b@kemnade.info>
	<20260806104525.GC10716@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2026 11:45:25 +0100
Lee Jones <lee@kernel.org> wrote:

> On Tue, 04 Aug 2026, Andreas Kemnade wrote:
> 
> > On Tue, 04 Aug 2026 13:55:14 +0000
> > sashiko-bot@kernel.org wrote:
> >   
> > > > leds: is31fl319x: modernize registration    
> > > 
> > > [Severity: Low]
> > > This isn't a bug, but should the description after the subsystem prefix be
> > > capitalized? The LED subsystem guidelines recommend formatting commit messages
> > > as "leds: <Driver>: <Capitalized description>".  
> > 
> > 
> > ~/linux$ grep -R 'leds: <Driver>: <Capitalized description>"' Documentation/
> > ~/linux$ ls Documentation/leds/
> > index.rst                  leds-lp5521.rst      leds-sc27xx.rst
> > leds-blinkm.rst            leds-lp5523.rst      leds-st1202.rst
> > leds-cht-wcove.rst         leds-lp5562.rst      ledtrig-oneshot.rst
> > leds-class-flash.rst       leds-lp55xx.rst      ledtrig-transient.rst
> > leds-class-multicolor.rst  leds-lp5812.rst      ledtrig-usbport.rst
> > leds-class.rst             leds-mlxcpld.rst     uleds.rst
> > leds-el15203000.rst        leds-mt6370-rgb.rst  well-known-leds.txt
> > leds-lm3556.rst            leds-qcom-lpg.rst
> > leds-lp3944.rst            leds-s2m-rgb.rst
> > 
> > nothing look like special guidelines for the system. I do not want to
> > see such comments without a reference.
> > Also MAINTAINERS does not show any additional policy for the LED subsystem.  
> 
> `git log --oneline -- <subsystem>` is your friend.
> 
That is looking at common practice, not guidelines, which is of course
often a good idea.

So Sahiko is hallucinating about non-existant guidelines which
cannot be referenced of course. Well, at least it gives quite an amount of
useful hintse.

Regards,
Andreas
