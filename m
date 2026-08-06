Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89F3B388F;
	Thu,  6 Aug 2026 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025847; cv=none; b=vDM4QxWOeAthGfyVtoVT0gvfFy3F72lbbOd3Yg8ntfj74hZT+3YvDiW68wCeRwO8ZQxonYKWZqRXS8zEeMOdcR28MTsBOlNxyIP7ZyqAwu93BLGdYCdXpYAFwwb46l+YYPwLFGvYTVI0iLqaOhtvsfC0eCWV3MOdMVN7zUHdc2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025847; c=relaxed/simple;
	bh=ZntzTwtwk4zZ8KoHlnjtHyto7RUKnod87xxP9Lm9ubo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9JJjRc2JAklZjEYd75kx4bxWarq27QUUjZ+YH4B/F/cVSd0rrTDuGZcjfnLIiNjdbmep+giBadpRVR+5NRLmBholHfspqbOjBHoJ0/px8NsBOz7Domh4ted6nziHRYPj3tHBFi56jBj5HcC4rZX5VlutEypEUHth1gvkilT+AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ee+RvjKn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ee+RvjKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3821F00A3A;
	Thu,  6 Aug 2026 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786025845;
	bh=UUnZqnwK4M4Abhgr2XE+JG5NW6Qi3owSemc7rfLE5dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ee+RvjKn6fgjtRipk3Gq1ODG92FlMDgB+kWnmnAroP7dxa7QBCS8lZt8aZtnN0rY5
	 gfcMuy2van5iHRirvnMXNfL+NtEH9QkboOQVyOhtgLv0m/JEhIsUiW1Cbx2ircx/gW
	 TFden/8/pajeX5lJW9EwOnYLseHoUU752QVLPbdJK7VJWck0soIFblYEpI0UMePWSO
	 hRrvBm0gkbdVAR7HEK8ZMTdPkkH/Dxel+n0q5R5yQM4jGwMyseJZpVxArqNcPWR/lY
	 QSBAJz57Au6ZsHrUCfaGE2bnOG6kUPVI+l1k5tQn/efBYXf7lPkn4wA+/chONfJrDd
	 l+PfkqJn3084w==
Date: Thu, 6 Aug 2026 15:17:21 +0100
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] leds: st1202: Add hardware-accelerated blink
 support
Message-ID: <20260806141721.GL2869284@google.com>
References: <GV1PR08MB8497E2498ED9D66AF60A3ACFC5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849709A3BE3D1CBB9E28ABD2C5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV1PR08MB849709A3BE3D1CBB9E28ABD2C5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>

On Tue, 04 Aug 2026, Manuel Fombuena wrote:

> Implement blink_set() to enable hardware-accelerated blinking via the
> timer trigger. The LED1202 pattern engine is used to produce a two-step
> sequence: full brightness for delay_on, off for delay_off, repeating
> indefinitely.
> 
> Requested delays are clamped to the hardware range [22ms, 5610ms] then
> rounded up to the nearest 22ms step. Clamping before rounding prevents
> integer overflow in roundup() for extreme input values; since
> ST1202_MILLIS_PATTERN_DUR_MAX is an exact multiple of
> ST1202_MILLIS_PATTERN_DUR_MIN, rounding a clamped value cannot exceed
> the maximum. A zero delay is replaced with the default of 500ms
> independently for each of delay_on and delay_off.
> 
> The LED1202 pattern sequencer is global and its timing registers are
> shared across all channels, so only one blink configuration can be
> active at a time. Other active channels have their PWM slots zeroed for
> both pattern steps so they remain dark rather than outputting unintended
> values when the sequencer runs. The target channel's ILED register is
> set to full brightness and the channel is enabled, since the timer
> trigger deactivates the current trigger before calling blink_set which
> would otherwise leave the channel disabled.
> 
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
> ---
>  drivers/leds/leds-st1202.c | 80 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)

Sorry, I've just reviewed v3.

I think the points are still valid though.

-- 
Lee Jones
