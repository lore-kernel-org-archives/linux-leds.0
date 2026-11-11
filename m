Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418626;
	b=0RPeQqXyenQGK+87CUJukTt4GjbyPhz14vVJuy2o6XbNIpQQKvIizZTgz2mNaDZob0VR
	 bA1CNWDopTeonU96plwxT1uiQ8v82TUyOvAkCVPGoivaGF9pNO8AdAoaOGmUVHiRwYBH/
	 Yq+NfqSwGWbccWZfOF7SzlNaqnPZrm/a8EcUr3CE39KupR0iXg1DeexVRuxcSlb2J2hiL
	 qJIfG9aV+hRvtjileQZHxLg5CfdDHPqwmVhIjmepiLzyjzBvEkY31wvizCLGgWWKkk+LY
	 Vy7s5in5GBVsvHv6JRwZ3Jw38mOG56QZIGxyFTIuYuladVGbd3cC5cOGdf9DuvbK62w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418626;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=9YexrO60oS4rlt/r0sleJ/GTAqTd7929wk1Rl5ZS/8I=;
	b=0gDCGSBg0V4b8WRLaKuTtBkLWBE+br9Zoi/rTjIKMEJPLkHhuFetx/RCZ9Q3hxkZ7K8Z
	 DVKP/nUmJ8XIc77R5WLLEcuWGcVJe8e6wzG6t4Bc2XhlskAhW1GH+RpVuB6E7nrbxnOlz
	 3wezRXtxYEF3zXjNcn5WGx59GfNu4kL/D/9+bejZz7+pUoOSSe8YbHsjB/orYrepEN6zU
	 fvM3geM7jUPqQQkofeqedWr+bDo+VzE7Am0vzjFfBFe75p2TG+bpA2Jq+QcjEmQfANTeh
	 6y7jlBpIuLafn3pbwn3cdqN9QRGz2BCuiQmfF+ovmgYk34aw9pF48BZ38Gwk+/Y4acQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9TyrzvW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFDD606A321;
	Wed, 11 Nov 2026 17:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9TyrzvW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C651F00A05;
	Wed, 11 Nov 2026 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418626;
	bh=9YexrO60oS4rlt/r0sleJ/GTAqTd7929wk1Rl5ZS/8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q9TyrzvWwkKy0snZ8tnWKZTnaDpYaaBhQ/FTfYtllzq2kg3B8Kg1lJ7D4EmfqMADS
	 lpvblbRBAUZV6WB197EVlwvfkkIaZ7yuHJnoDQh1/1vqbNcUz7SbWLbfKwKPuPvKbz
	 x+zIqg/bba7rKXTM05zOMO3Xz/2qrMHiP8wFvTAxQ66L3/dodmRJYDBc4Q+n8i2ZMz
	 fHa0zma96nLMquaWSIVJRZBtA5FSV6vfqyhW3amy5MEdIMsu9SIzENYJcY6WhUt9rV
	 No+AFGP0oV+MeWOkwsfdHBZwpaRvNUnF48jk/++qEA8eW6skYS23CDf0VGaoiHSfRH
	 ZEy/LZgYaE6cw==
Date: Wed, 11 Nov 2026 17:36:59 +0000
From: Lee Jones <lee@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>, Ike Panhc <ikepanhc@gmail.com>,
	Rong Zhang <i@rong.moe>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org,
	Netdev <netdev@vger.kernel.org>, linux-doc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v7 00/13] leds: Add support for hardware-initiated
 hardware control trigger transition
Message-ID: <20261111173659.GD6323@joneslee-macbookpro.roam.internal>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <179425319974.10927.7190572777719580956.b4-ty@b4>
 <20261110090105.GA6323@joneslee-macbookpro.roam.internal>
 <b19ef65f-c563-07f8-1be8-9a0a0689da22@linux.intel.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b19ef65f-c563-07f8-1be8-9a0a0689da22@linux.intel.com>

--- checkpatch.pl (27 issues) ---
Line 1: ERROR: spaces required around that ':' (ctx:VxE)
Line 3: ERROR: spaces required around that ':' (ctx:VxE)
Line 5: ERROR: spaces required around that ':' (ctx:VxE)
Line 7: ERROR: need consistent spacing around '+' (ctx:WxV)
Line 7: ERROR: spaces required around that ':' (ctx:VxE)
Line 10: WARNING: space prohibited between function name and open parenthesis '('
Line 13: WARNING: space prohibited between function name and open parenthesis '('
Line 14: ERROR: spaces required around that ':' (ctx:VxE)
Line 24: ERROR: space required before that '-' (ctx:VxV)
Line 28: ERROR: spaces required around that ':' (ctx:VxE)
Line 29: ERROR: spaces required around that ':' (ctx:VxW)
Line 31: ERROR: spaces required around that ':' (ctx:VxW)
Line 33: ERROR: spaces required around that ':' (ctx:VxW)
Line 35: ERROR: spaces required around that ':' (ctx:VxW)
Line 37: ERROR: spaces required around that ':' (ctx:VxW)
Line 39: ERROR: spaces required around that ':' (ctx:VxW)
Line 41: ERROR: spaces required around that ':' (ctx:VxW)
Line 43: ERROR: spaces required around that ':' (ctx:VxW)
Line 45: ERROR: spaces required around that ':' (ctx:VxW)
Line 47: ERROR: spaces required around that ':' (ctx:VxW)
Line 50: ERROR: space required before that '!' (ctx:VxE)
Line 57: ERROR: trailing whitespace
Line 60: ERROR: trailing whitespace
Line 61: ERROR: trailing whitespace
Line 71: ERROR: trailing whitespace
Line 72: ERROR: trailing whitespace
Line 84: ERROR: spaces required around that '?' (ctx:VxE)
----------------------------------

On Tue, 10 Nov 2026, Ilpo Järvinen wrote:

> On Tue, 10 Nov 2026, Lee Jones wrote:
> 
> > On Mon, 09 Nov 2026, Ilpo Järvinen wrote:
> > 
> > > On Mon, 21 Sep 2026 03:40:14 +0800, Rong Zhang wrote:
> > > 
> > > > Some laptops can tune their keyboard backlight according to ambient
> > > > light sensors (auto mode). This capability is essentially a hardware
> > > > control trigger. Meanwhile, such laptops also offer a shrotcut for
> > > > cycling through brightness levels and auto mode. For example, on
> > > > ThinkBook, pressing Fn+Space ("shortcut") cycles keyboard backlight
> > > > levels in the following sequence:
> > > > 
> > > > [...]
> > > 
> > > Thank you for your contribution, it has been applied to my local
> > > review-ilpo-next branch. Note it will show up in the public
> > > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > > local branch there, which might take a while.
> > > 
> > > FYI [if applicable to your patch], as per Linus' policy change, also
> > > fixes are mostly routed through for-next unless the fix is for a
> > > commit introduced in the most recent cycle or is clearly a regression
> > > fix.
> > > 
> > > The list of commits applied:
> > > [01/13] leds: class: Always protect brightness_show() with led_access
> > >         (no commit info)
> > > [02/13] leds: trigger: Move led_trigger_is_hw_controlled() to the right place
> > >         (no commit info)
> > > [03/13] leds: class: Remove hardware control trigger when writing brightness
> > >         (no commit info)
> > > [04/13] leds: trigger: Move led_trigger_group to the right place
> > >         (no commit info)
> > > [05/13] leds: trigger: Add hw_offloaded() callback and provide trigger_may_offload_to_hw attribute
> > >         (no commit info)
> > > [06/13] leds: cros_ec: Implement hw_offloaded() trigger callback
> > >         (no commit info)
> > > [07/13] leds: turris-omnia: Implement hw_offloaded() trigger callback and declare hw_control_trigger
> > >         (no commit info)
> > > [08/13] leds: trigger: netdev: Implement hw_offloaded() callback
> > >         (no commit info)
> > > [09/13] leds: trigger: Enforce strict checks in led_trigger_is_hw_controlled()
> > >         (no commit info)
> > > [10/13] leds: trigger: Add led_trigger_notify_hw_control_changed() interface
> > >         (no commit info)
> > 
> > This is super confusing!
> 
> I know it is but it's how b4 thankyou mails appear.
> 
> > Where does this list come from?
> 
> The list comes from the original series that b4 caches somewhere.
> I deleted the patches 1-10 and only applied mbox that contained patches 
> 11-13.
> 
> When constructing thankyou mail, b4 seems to take the cached list of 
> patches the series had and does not find 1-10 applied into my tree by me 
> so it says (no commit info). The rest appear as expected:
> 
> > > [11/13] platform/x86: ideapad-laptop: Serialize keyboard backlight tracking
> > >         commit: d288a6f989b7b9e6a730140c601987b886af327e
> > > [12/13] platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for keyboard backlight
> > >         commit: 7d6c073d181d7855561831cb4bba17dc9b7d4aa9
> > > [13/13] platform/x86: ideapad-laptop: Fully support auto keyboard backlight
> > >         commit: 5d805ca01382d63d54c9984e7f19922c4ae6f3dc
> 
> Of course it would be much less confusing if it never showed those no 
> commit info entries at all but unfortunately I don't think I can control 
> that, sorry.

Take a look at my reply to the 0th patch.

For some reason my b4 doesn't do this.  It must be an option?

What command do you use?

My assumption is that you omit `b4 am`s `-P` option, so it thinks it's
working on the whole set, rather than just the sub-set?

-- 
Lee Jones
