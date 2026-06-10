Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0D33DB313;
	Wed, 10 Jun 2026 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088689; cv=none; b=FR74fzUeJFn19DXLDMRx0sHZp86pTCB2witDYJrhrjlTg8gwgiwmcvoGaxBMToe7dtqB+Xgk0X+pVbsKIkIUanG1FNI1kEbnF/a+tI7moOze7ek0C+3aWI9VO2iJ9LDDXpGGKScbJi98LPVR/dMebuPkN2r2rb5rxMqKBRg6HzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088689; c=relaxed/simple;
	bh=3JrL8Ay62wh8gIP7T0gDlp29hoygGn7hUTV1FzMD5ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXRi6u44dTRZJKVhdMbXf/CB5E1toni/56YH6ay+96gZRnU39WuW9WXIx6xkFeOrYDPlpLKiJBGqQ6aK1/NYXtK26H86pJY+aJP8mZekJnNv/Gqvl6c/l2177Nj/hvEQMAoRVgdYayyiAQ81esCZKQjwnCMEN8LmBBEz1fuLC6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+U9Vnzk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+U9Vnzk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7D11F00898;
	Wed, 10 Jun 2026 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781088686;
	bh=kF15Ryzri7dKoKzyf+eaUDdbVIzPoz/YgGe7arEocXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m+U9Vnzkhp3F5BXxeb8+iA7r0t8FlCPBuBJOmkp32MCvy04yzz+87MsB+dAV03Ghe
	 R3EX0GYdhLXwHxUMUg8ZWLHAr9YB1iE+4cNovK9tfVrS8/XAMIV4lvwbHnnwiRRx4v
	 g55TEKIzujhr6P9k87HFBoa2lEDlvtQojNERAJ3B59MlAiShfA3Zi6jL+DlCbTWvc5
	 dtWmr7Q2nilTdP8fl59FuhSeg/S837DdKFhe39xJViPHJ/DWUpj7/ZBe1yEGryz8B2
	 xtJydEnHT2VbkTsEQ2i1D4T0D26mUhdu1pNGpPu3J7cEAoLSsp3HfC2TJcWmsITxbY
	 SWzpjOQXj1AAw==
Date: Wed, 10 Jun 2026 11:51:23 +0100
From: Lee Jones <lee@kernel.org>
To: Lorenzo Egidio <lorenzoegidioms@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: tests: clarify name conflict test
Message-ID: <20260610105123.GI4151951@google.com>
References: <CAFxreVGVdXkp2qLGHD30TOxVMCL5RvDaT9A1jmkz_wi5Cab7-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFxreVGVdXkp2qLGHD30TOxVMCL5RvDaT9A1jmkz_wi5Cab7-A@mail.gmail.com>

On Tue, 09 Jun 2026, Lorenzo Egidio wrote:

> Hi
> 
> I noticed that theLED_REJECT_NAME_CONFLICT test in the review of LED
> KUnit tests re-registers an already registeredled_classdev instance.
> 
> This patch replaces the old led_classdev instance with a new one for
> the conflictrejection test, so the test case clearly and explicitly
> deals withname-conflict handling.
> 
> Besides it, struct led_lookup_data is cleared to zero.
> 
> Patch for your consideration is attached.

We don't open attachments.  Please send patches with `git send-email` or `b4.

Also read Documentation/process/submitting-patches.rst et al.

-- 
Lee Jones
