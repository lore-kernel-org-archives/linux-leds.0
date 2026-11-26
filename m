Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697245;
	b=MPVqF/pOBgG+O8KTXhKbo35Fe5Vw3mjx5nm2cstH5d+TpVGawQrsHJ/6NZDYow8kdEim
	 gTHWXMWRWA844ouZNvNIbattzjOjwDHAPYseZciBFsvn9ZE44uJ9UTLVjyYFt+j9aFKup
	 UyRqejEYibJSv6UIMk0smAq8Y04egskfwKEH+kGvBIHY8BVXK9wq2Z8i27W5ippQYuGm7
	 ouyDUbIvMMO5MDujJkHpe0XewxBIU0Nz0ZMtaNPrjgghGai0An8g8GFyLNK9Sm140W+XM
	 Oj8f2FXLsGu5WezMQ2a7rO/0tOobZVJUdJI804avnPPh9prqj8mDkTYQA/2YmCy3QDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697245;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=q4oaVRG88t+rJ671yZUZBq0iKBzOxZgNztWtKYUJVTI=;
	b=sGXXexJqY9GSiTZluJlrC6sGTdM82kX52NkQJ7grVmUBa/47sAqgHNn9vKn/wRnExsp0
	 fxjDsouVjDsdq02yesWWyi9tGl3VCKwy9btZ8ixMc7K+Aa5Rocw+F15/Zdzrrc54vC7cD
	 QtvL8AvpccCuqlyRuZpxMICnu8figE82lXvv5dQEqSgVDyimGlF1VTM2SOJEvQfP6X4IE
	 DAfRvO2ZZ7mFBmvG94TBPRIrNFod/wRWg/PofA1UGQrhIoE9kKIlQTGbdnuv0GQO3b+Tb
	 YUhi6b4XTBx5yjMXbLZ5oyf1ZdMCq0TSu5VlBMFkgUpBcivoK/92xBGl7xHMJCIyTOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0VY7+XD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECA2606A338;
	Thu, 26 Nov 2026 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0VY7+XD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D721F000D0;
	Thu, 26 Nov 2026 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697244;
	bh=q4oaVRG88t+rJ671yZUZBq0iKBzOxZgNztWtKYUJVTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z0VY7+XDTSGwCNFGY9Vo4wDSQRlh/DcTkHoq0uA68MVx8XxzkifE1qxOEUGbbeuLO
	 BH6J9AxzdCEljo4uH0bHCasdJR+FlF7JeF7IJyZwQtA9P1UVFb4Im/q5Vl3wa2uCIT
	 FRvg8X8zfykFpphpk9NnITVPR4NWv97L0nnN7Wb/mImjqwfCjcqd7R0JrdFbe7tPhe
	 pWgqQ1O5+AQB9pc2FkU/G6Jw56nDY0FyHogp7TdzTD43uTFYoW1KpDKRke+9UICWwm
	 Nx135+KNmoFylG3do5CAJz6JYa9vTDI2n9MuUc0Gl2KwDDYr2M9sLwSAM39Ur3lSgT
	 NShKA0E4s989g==
Date: Thu, 26 Nov 2026 12:47:19 +0000
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO
 power supplies
Message-ID: <20261126124719.GJ38590@joneslee-macbookpro.roam.internal>
References: <20261115085826.89641-1-clamor95@gmail.com>
 <20261115085826.89641-5-clamor95@gmail.com>
 <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
 <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com>

On Thu, 26 Nov 2026, Svyatoslav Ryhel wrote:

> чт, 26 лист. 2026 р. о 13:47 Lee Jones <lee@kernel.org> пише:
> >
> > On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
> >
> > > The AAT2870 supports a dedicated main power supply input alongside parent
> > > power supply for its internal regulators.
> > >
> > > Add support for retrieving and managing these supply regulators
> > > (vin-supply and in-ldo-supply) using the regulator framework to ensure
> > > proper power supply dependencies and power-up sequencing.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/mfd/aat2870-core.c            | 5 +++++
> > >  drivers/regulator/aat2870-regulator.c | 1 +
> >
> > Is this a build dep?
> >
> 
> More a logical link, I can break it but it still will be part of this patch set.
> 
> > Would something that was working before, break?
> 
> Other way, it was broken (aat2870 may have a dedicated supply) and now
> it is fixed.

Great.  Split it and Mark and I will take them into our own subsystems.

Thanks.

-- 
Lee Jones
