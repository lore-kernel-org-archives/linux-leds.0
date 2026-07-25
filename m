Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E04A17B418;
	Sat, 25 Jul 2026 21:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785013683; cv=none; b=H3KiUeQvde20mQ3t4uvQQ1Xx+td/hmkXOYtAEXJFkM9PS36W5h5Obm9nXYnWGTJoJs2g5vVbxUA0tM21Uhws2If7+1Mu/tscWd4V4MWauGRVTkJ7M5zkf5iyPX5X2AahQKdMoi2wY2povza5MfnEu97jPmK3gE1ieOe/QEOQFAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785013683; c=relaxed/simple;
	bh=WCKwmnv+Dre8IIde9Vio1GITjiopZo5e8iu1MsCuha4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khQUuMqGU684M6PJCqY5tUZidqFXECp1h3WM0C3EF5158fojNW3SqMq8iEA2a1zlTGklTcoaAHQ3JzLVV9O8jsGne9pTRIBXNwiLPtTjynN5bibBqBS6EXtmQztw6rYkKupHeAQrnl+TQwPta6EEvbEdrMcG/ZB8NaGGReZU23Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLTGreJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLTGreJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE881F000E9;
	Sat, 25 Jul 2026 21:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785013682;
	bh=zK2W7XnfhLHZwo5OuA5GVAxklIXTwrHCQBOa0VnhdYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gLTGreJ11hwkRNoFwC3cBfg42SNt5MBiyteFJ9lToBppEJAc9E9+iQl2CFQwK+Tr0
	 /p0KE2vzWrlC3MbmL+dJ9nhDI0wNk+LSdLSnJJCdkDHSic9bcWYw5ASKFtx8uBZMUr
	 0mm78o31amOEbsYT4GqQmFdvp+TU5ToZITWGmWKSs21UfXQ9VBI0qK+B1y1WPTR6ZH
	 FUzxrwWKCqeYL/r1yRKuzsJ3jyihGx0q3r2wbdMnCZ4kHLujmr7UWGrEQmP43Qq0BD
	 ie+LMoFVYRUWsLn6r2ezAdAQGKta/3fzGG8YEp5s/n3E7Pp/PMXUoVGErFy+S/IDKz
	 CjHAzt50qifhA==
Date: Sat, 25 Jul 2026 22:07:54 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v18 0/2] Introduce Synology Microp driver
Message-ID: <20260725210754.GE3526803@google.com>
References: <20260724-synology_microp_initial-v18-0-fb2f49f10e77@posteo.de>
 <20260724184128.10861-1-work@onurozkan.dev>
 <ad14014c1faf415d51b494d57100e47c5f8234ad.camel@posteo.de>
 <20260724202036.14055-1-work@onurozkan.dev>
 <2da3a7a15cce427c4171d45e172d99b47bb52043.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2da3a7a15cce427c4171d45e172d99b47bb52043.camel@posteo.de>

On Fri, 24 Jul 2026, Markus Probst wrote:

> On Fri, 2026-07-24 at 23:20 +0300, Onur Özkan wrote:
> > On Fri, 24 Jul 2026 18:45:56 +0000
> > Markus Probst <markus.probst@posteo.de> wrote:
> > 
> > > On Fri, 2026-07-24 at 21:41 +0300, Onur Özkan wrote:
> > > > On Fri, 24 Jul 2026 17:10:44 +0000
> > > > Markus Probst <markus.probst@posteo.de> wrote:
> > > > 
> > > > > Synology uses a microcontroller in their NAS devices connected to a
> > > > > serial port to control certain LEDs, fan speeds, a beeper, to handle
> > > > > proper shutdown and restart, buttons and fan failures.
> > > > > 
> > > > > This patch series depends on the rust led abstraction [1] and the rust
> > > > > serdev abstraction [2]. The latter already being in driver-core.
> > > > > 
> > > > > This is only a initial version of the driver able to control LEDs.
> > > > > The following rust abstractions would be required, to implement the
> > > > > remaining features:
> > > > > - hwmon (include/linux/hwmon.h)
> > > > > - input (include/linux/input.h)
> > > > > - sysoff handler (include/linux/reboot.h)
> > > > > 
> > > > > [1] https://lore.kernel.org/rust-for-linux/20260716-rust_leds-v23-0-e91f5b608b56@posteo.de/
> > > > > [2] https://lore.kernel.org/rust-for-linux/20260718-rust_serdev-v16-0-5809384d2e1b@posteo.de/
> > > > > 
> > > > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > > > ---
> > > > > Changes in v18:
> > > > > - fix issues reported by Sashiko:
> > > > >   - fix hardware blink delays not reported if every subled has
> > > > >     intensity = 0
> > > > > - fix blink aborting if every subled has intensity = 0
> > > > > - Link to v17: https://patch.msgid.link/20260724-synology_microp_initial-v17-0-e2f70b4dc691@posteo.de
> > > > > 
> > > > > Changes in v17:
> > > > > - adapted to rust serdev abstraction v16
> > > > > - Link to v16: https://patch.msgid.link/20260629-synology_microp_initial-v16-0-601e91c49e0d@posteo.de
> > > > > 
> > > > 
> > > > Hi Markus,
> > > > 
> > > > Please avoid sending multiple versions within a very short timeframe and give us
> > > > some time (at least a day) to review before sending another version.
> > > Correct me if I am wrong, but wasn't Sashiko reviews the exception to
> > > this?
> > > 
> > 
> > To me, that doesn't make much sense because it effectively means you could send
> > 3–4 versions depending on how Sashiko behaves. Imagine multiple people sending
> > large patch series several times in a row (and it could easily be more than
> > twice). That would make things much harder for other people as the mailing list
> > would become very spammy.
> Yes, that would be an issue, especially in your example.
> 
> A pre-review Sashiko mailing list would be great to avoid the issue
> alltogether.

You can run Sashiko locally.

-- 
Lee Jones
