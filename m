Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865783594A
	for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 06:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786517009; cv=none; b=QXQzS2dtBAO5tXPvmbHixkYk1OcW0oBQej4qmiJMm3ri4oPWkR3JJ2scyaYixMCq1BaACzt1eoD8Z0zvZI78LG8PNMKtz1QpNFyOH+64hYDyO73E/utrNnk3ASwCA5A2ezV5iyRgfXLeyWlhFJU0YsioqZpbEfa+WZp2Qe3qQtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786517009; c=relaxed/simple;
	bh=HO3kgb3Rzg6mpaKRnBriWOvYD+DVM7tffSSfpsRtkHY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9iPCDEwjYWv0RqTDpe/rSNo6kGnxzcec13SECmNRf7cMxiFaw3pZIhYpPR46KhZ7sKrMZx6Fk/H3covmrumM1gvA7Ghzm+HtrZqkSGb6e0GOdNS6VGKLue6+5h+qY3Ik7KOoiCP9LzFpEBTaRRdZ7SZz1zufiyfO097/jWuE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=9Vhbe4lG; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="9Vhbe4lG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=AfXOw53sapozXifXpKm30CeEsqFjzfBau8Gt2HT8J98=; t=1786517007; x=1787726607; 
	b=9Vhbe4lGT4Ysq5M5EUY9uqQrQ6LdeYz6ZmZgayPFDuNxuffX/EffUCoJv5Wwvkwsk1QhmKty++3
	pVSirgvLoV3HAc9tAZ5+wyvlFR2w0NrzCICG4+LANLLgSLMX0xS46k1fkwN5pu4kao3T+36HH+VKu
	qhY4PQKrWW9HPTXn5sZAZTSpYh7txkUFWhXacfDu/HJ9cEaT4R1Hf0hD9pAcNMano0jVNsQFoVS11
	/2ZWsaZik1zM1eeE6aGdgcTJQeQxCRfxp6gF+ghSEXvfKxQY1LFFvcxL6NlgInOJjr6To6M8t1QpZ
	5qxIZmo4vqJtaWFCnitSZQsdzz0kB4RyWqhw==;
Date: Wed, 12 Aug 2026 08:43:20 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 linux-leds@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3] leds: is31fl319x: modernize registration
Message-ID: <20260812084320.21a7341a@kemnade.info>
In-Reply-To: <20260811185127.GW2869284@google.com>
References: <20260804-led-modern-v3-1-297720eec19f@kemnade.info>
	<20260804135515.5DBFC1F000E9@smtp.kernel.org>
	<20260804164101.43753f1b@kemnade.info>
	<20260806104525.GC10716@google.com>
	<20260806135550.2d57682c@kemnade.info>
	<20260811185127.GW2869284@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Aug 2026 19:51:27 +0100
Lee Jones <lee@kernel.org> wrote:

> On Thu, 06 Aug 2026, Andreas Kemnade wrote:
> 
> > On Thu, 6 Aug 2026 11:45:25 +0100
> > Lee Jones <lee@kernel.org> wrote:
> >   
> > > On Tue, 04 Aug 2026, Andreas Kemnade wrote:
> > >   
> > > > On Tue, 04 Aug 2026 13:55:14 +0000
> > > > sashiko-bot@kernel.org wrote:
> > > >     
> > > > > > leds: is31fl319x: modernize registration      
> > > > > 
> > > > > [Severity: Low]
> > > > > This isn't a bug, but should the description after the subsystem prefix be
> > > > > capitalized? The LED subsystem guidelines recommend formatting commit messages
> > > > > as "leds: <Driver>: <Capitalized description>".    
> > > > 
> > > > 
> > > > ~/linux$ grep -R 'leds: <Driver>: <Capitalized description>"' Documentation/
> > > > ~/linux$ ls Documentation/leds/
> > > > index.rst                  leds-lp5521.rst      leds-sc27xx.rst
> > > > leds-blinkm.rst            leds-lp5523.rst      leds-st1202.rst
> > > > leds-cht-wcove.rst         leds-lp5562.rst      ledtrig-oneshot.rst
> > > > leds-class-flash.rst       leds-lp55xx.rst      ledtrig-transient.rst
> > > > leds-class-multicolor.rst  leds-lp5812.rst      ledtrig-usbport.rst
> > > > leds-class.rst             leds-mlxcpld.rst     uleds.rst
> > > > leds-el15203000.rst        leds-mt6370-rgb.rst  well-known-leds.txt
> > > > leds-lm3556.rst            leds-qcom-lpg.rst
> > > > leds-lp3944.rst            leds-s2m-rgb.rst
> > > > 
> > > > nothing look like special guidelines for the system. I do not want to
> > > > see such comments without a reference.
> > > > Also MAINTAINERS does not show any additional policy for the LED subsystem.    
> > > 
> > > `git log --oneline -- <subsystem>` is your friend.
> > >   
> > That is looking at common practice, not guidelines, which is of course
> > often a good idea.
> > 
> > So Sahiko is hallucinating about non-existant guidelines which
> > cannot be referenced of course. Well, at least it gives quite an amount of
> > useful hintse.  
> 
> It's not hallucinating, I put it there. =:-)
> 
> https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md
> 
> Specifically:
> 
> https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md?plain=1#L8
> 
So, that is another repository of another project. That is not an
intuitive place to look at. So I would expect to see at least some pointer
in that direction in the first place.

Regards,
Andreas
PS: you have seen the corrected v4?
