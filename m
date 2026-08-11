Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E74353A8E;
	Tue, 11 Aug 2026 18:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474293; cv=none; b=GqC8DXVEdK7FS7JRDJAFA2CUELjT3aqrW5Z1gGJuoriCqvkRUFSFBj/G3nNKP14IvdUsbjC7cJirPjGR4801puKDQhBZLkUdSPNkTknr497pjf9Aya29DzZfOtp8I0svuofrd2MuE3E5uJ+v8gmzc3YfR312+bWlguRheDRitLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474293; c=relaxed/simple;
	bh=66VH6nMG4PDZQsFsQxrZMaRcZWJR8pKt9tNxXhfARBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0E+/vXZl/uW6ppPGru8aT0bOjL1ye3E/ZsMLb1e7OtkHZ8Fymx+72wgo4K81qwK1gWkq1x49tmPKpr5iIjOwjUfBepeSQR7vW28eI7WIInAPoCaIWh3C42GS0/T2Xke5tYZikVhFaKH3mcWhQRdzhEB2jC+ZminyC+M7o7DVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHtYul6Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHtYul6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CAA1F000E9;
	Tue, 11 Aug 2026 18:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786474291;
	bh=hTVeY3xp2/ljRXo5vVCbpJM7fMCz9DiVY9+vuk1hcRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oHtYul6ZKapiHNulP+p4c++1IgTvN3U2a3H2kPJpChtO9DdVJUKkXtbSQ3yf2UVme
	 eqV5t4Mcl+j3M8zYgw5gfpwTKaD3T9MOc8vacvk6UG1uxaUkzo2XTrRYWnvEJ77xFG
	 Y5e6AX3g0TkSoegD9FIVHD8sqHM1R/sxCTKMpsbyAHbx1lgP7Xbx3BmFuhSfhuC9y1
	 vg9s/A9WI1/dYC570yd38GAknowCeRomgbQqKl7hA7LBVo8HU4pZl3+Gkfc1CQV4XP
	 Q5KuQkaxf11yyMn2wlTVTAwTIVtTOnmf9AgjCyBy/MR4ZBQvdWzmwD9AmmV+MmCZCN
	 FsWZhkshIVq9Q==
Date: Tue, 11 Aug 2026 19:51:27 +0100
From: Lee Jones <lee@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-leds@vger.kernel.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3] leds: is31fl319x: modernize registration
Message-ID: <20260811185127.GW2869284@google.com>
References: <20260804-led-modern-v3-1-297720eec19f@kemnade.info>
 <20260804135515.5DBFC1F000E9@smtp.kernel.org>
 <20260804164101.43753f1b@kemnade.info>
 <20260806104525.GC10716@google.com>
 <20260806135550.2d57682c@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806135550.2d57682c@kemnade.info>

On Thu, 06 Aug 2026, Andreas Kemnade wrote:

> On Thu, 6 Aug 2026 11:45:25 +0100
> Lee Jones <lee@kernel.org> wrote:
> 
> > On Tue, 04 Aug 2026, Andreas Kemnade wrote:
> > 
> > > On Tue, 04 Aug 2026 13:55:14 +0000
> > > sashiko-bot@kernel.org wrote:
> > >   
> > > > > leds: is31fl319x: modernize registration    
> > > > 
> > > > [Severity: Low]
> > > > This isn't a bug, but should the description after the subsystem prefix be
> > > > capitalized? The LED subsystem guidelines recommend formatting commit messages
> > > > as "leds: <Driver>: <Capitalized description>".  
> > > 
> > > 
> > > ~/linux$ grep -R 'leds: <Driver>: <Capitalized description>"' Documentation/
> > > ~/linux$ ls Documentation/leds/
> > > index.rst                  leds-lp5521.rst      leds-sc27xx.rst
> > > leds-blinkm.rst            leds-lp5523.rst      leds-st1202.rst
> > > leds-cht-wcove.rst         leds-lp5562.rst      ledtrig-oneshot.rst
> > > leds-class-flash.rst       leds-lp55xx.rst      ledtrig-transient.rst
> > > leds-class-multicolor.rst  leds-lp5812.rst      ledtrig-usbport.rst
> > > leds-class.rst             leds-mlxcpld.rst     uleds.rst
> > > leds-el15203000.rst        leds-mt6370-rgb.rst  well-known-leds.txt
> > > leds-lm3556.rst            leds-qcom-lpg.rst
> > > leds-lp3944.rst            leds-s2m-rgb.rst
> > > 
> > > nothing look like special guidelines for the system. I do not want to
> > > see such comments without a reference.
> > > Also MAINTAINERS does not show any additional policy for the LED subsystem.  
> > 
> > `git log --oneline -- <subsystem>` is your friend.
> > 
> That is looking at common practice, not guidelines, which is of course
> often a good idea.
> 
> So Sahiko is hallucinating about non-existant guidelines which
> cannot be referenced of course. Well, at least it gives quite an amount of
> useful hintse.

It's not hallucinating, I put it there. =:-)

https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md

Specifically:

https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md?plain=1#L8

-- 
Lee Jones
