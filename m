Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C01B2C08CF;
	Wed, 12 Aug 2026 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541388; cv=none; b=ulEoLttqXtQ6lDdtOo0uKVaeCOW/qELC4y35sgIqBHnTT0iEkqF3ZLMQQloyGI3Sa5gKTP9JFktut3pSivjYF6BWBAvkHft7PuUf2XtTNvZ64ta8FJY7GhGLmndttdQyuKIKSVbGKQ0IiA58dXov852guBiu9EeLhZY641yk3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541388; c=relaxed/simple;
	bh=aZdh186rewXp+ADdfyyVy4aJnVjHGVxSi3EG5G1ikNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TccUVzOnKmRqlwYhpuEY+cQO28F00/7wrHAmEsY0rJavLY3uS4xRvoQkNrHnXz6jysyAdQt4gIq4eInFGySpBZiFxNpAYNVtKXqyqzDTTZvIDqpv4T9QXj0ZtSwzWnGAxwRPANi1AQ4rIztHPwBKt7W+mqeYfgZ3M8hL8XQJJns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFEKrfwK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFEKrfwK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C491F000E9;
	Wed, 12 Aug 2026 13:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786541384;
	bh=XgwTFUtPYyqT0NUfz4rFDzSzFqf+dYRSbWg0aGLpN/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CFEKrfwKTprkS51W66TVsiM2A0pMoGSh4mvOvOoi1krTMrObk1LH+FOr60P0bXHll
	 KfbTX12D4wyOr4wttmofIK6M2k7Dnl1G4sd1lXbzFSFFeaLRLA/rZV6z3JRDCZfSM4
	 3p3Dp5lmNvQIGKk2WYQljfomLYf8zo2ZZojht7cpGyV5y5IqqV8MbMF+e2abzPgAX6
	 XeoYRdSKQOat0IFHOtFLzuFWFHpEzyOr5FMj7jl4LImgwQ750DdUikfQSnrDoLok+y
	 Zkk6BTCOi+gvdZgIkdQXFDcCl0ISl0kDes4q57VdB7bla+9b1Fkia6yV29lcVf1d9q
	 Wee5GxmhyhDuw==
Date: Wed, 12 Aug 2026 14:29:41 +0100
From: Lee Jones <lee@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-leds@vger.kernel.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3] leds: is31fl319x: modernize registration
Message-ID: <20260812132941.GU1072730@google.com>
References: <20260804-led-modern-v3-1-297720eec19f@kemnade.info>
 <20260804135515.5DBFC1F000E9@smtp.kernel.org>
 <20260804164101.43753f1b@kemnade.info>
 <20260806104525.GC10716@google.com>
 <20260806135550.2d57682c@kemnade.info>
 <20260811185127.GW2869284@google.com>
 <20260812084320.21a7341a@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812084320.21a7341a@kemnade.info>

On Wed, 12 Aug 2026, Andreas Kemnade wrote:

> On Tue, 11 Aug 2026 19:51:27 +0100
> Lee Jones <lee@kernel.org> wrote:
> 
> > On Thu, 06 Aug 2026, Andreas Kemnade wrote:
> > 
> > > On Thu, 6 Aug 2026 11:45:25 +0100
> > > Lee Jones <lee@kernel.org> wrote:
> > >   
> > > > On Tue, 04 Aug 2026, Andreas Kemnade wrote:
> > > >   
> > > > > On Tue, 04 Aug 2026 13:55:14 +0000
> > > > > sashiko-bot@kernel.org wrote:
> > > > >     
> > > > > > > leds: is31fl319x: modernize registration      
> > > > > > 
> > > > > > [Severity: Low]
> > > > > > This isn't a bug, but should the description after the subsystem prefix be
> > > > > > capitalized? The LED subsystem guidelines recommend formatting commit messages
> > > > > > as "leds: <Driver>: <Capitalized description>".    
> > > > > 
> > > > > 
> > > > > ~/linux$ grep -R 'leds: <Driver>: <Capitalized description>"' Documentation/
> > > > > ~/linux$ ls Documentation/leds/
> > > > > index.rst                  leds-lp5521.rst      leds-sc27xx.rst
> > > > > leds-blinkm.rst            leds-lp5523.rst      leds-st1202.rst
> > > > > leds-cht-wcove.rst         leds-lp5562.rst      ledtrig-oneshot.rst
> > > > > leds-class-flash.rst       leds-lp55xx.rst      ledtrig-transient.rst
> > > > > leds-class-multicolor.rst  leds-lp5812.rst      ledtrig-usbport.rst
> > > > > leds-class.rst             leds-mlxcpld.rst     uleds.rst
> > > > > leds-el15203000.rst        leds-mt6370-rgb.rst  well-known-leds.txt
> > > > > leds-lm3556.rst            leds-qcom-lpg.rst
> > > > > leds-lp3944.rst            leds-s2m-rgb.rst
> > > > > 
> > > > > nothing look like special guidelines for the system. I do not want to
> > > > > see such comments without a reference.
> > > > > Also MAINTAINERS does not show any additional policy for the LED subsystem.    
> > > > 
> > > > `git log --oneline -- <subsystem>` is your friend.
> > > >   
> > > That is looking at common practice, not guidelines, which is of course
> > > often a good idea.
> > > 
> > > So Sahiko is hallucinating about non-existant guidelines which
> > > cannot be referenced of course. Well, at least it gives quite an amount of
> > > useful hintse.  
> > 
> > It's not hallucinating, I put it there. =:-)
> > 
> > https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md
> > 
> > Specifically:
> > 
> > https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md?plain=1#L8
> > 
> So, that is another repository of another project. That is not an
> intuitive place to look at. So I would expect to see at least some pointer
> in that direction in the first place.

It's not common for maintainers to document all of their idiosyncrasies
and preferences.  You've asked if the review comment is legitimate and
I've told you that it is.

-- 
Lee Jones
