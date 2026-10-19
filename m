Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425729;
	b=JF/toJUUMCYtU498gijtYbYJ/vI5161WkosUHq+VdZrKKhgZqXGtxbMFLKu69j4uNq21
	 R5m9t001qBl/JLfC8DkwfsIRHlgZjEir24VAEJ5rO4h3KTGFkLtAI4lPUz8O9r8D34lba
	 kBMBXaXzwBnHWMockKoJsc1ev7ANhAZ8FnVnwU1NulzpAjaTQobW6H/KWYL7TRcvw13QF
	 DBcCPKUH/LW6ec19DsuWKe8v6yDgnXIElJS2hUbAg6NPnNC8ndeuqjeIGU1Y/mQVyyMut
	 wOs5rNDs8UDGMWA/e3bhvkBg/t7UFchQvjqlDb7YCIiP+3ZsQKuyF0YQrmKKsaOuh3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425729;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=T3OoZrJmi4UHul4Ly0uuZfTsyT/nHjsTbt0mJe/Vio4=;
	b=49nUPDLgOFI6Wgfwq4m1cR6HD8mGF5GGemq1GcjwiEABIJUyEYaRxM8iy/VBBwqK/bIZ
	 CTW/XP7HOltraDQs7Lo9s5X86XatCWnrouq1ObdEPvv+63+X454rJxHW3plQOxyrAEFCL
	 I5baLohFhvjg3ha7ZXXcXfCJhcycJKozBXHDdZZ0OzvhQBc8cot5HP5ZYjd7VeEMOOiah
	 q3/u7Q4Z/7DiAS9GhcYvtsTU0V4rnn+cuyHfmYHygcIu6+9nMBVRujX5MzV7VEhV/LCCm
	 3zGEzi2gwKQgUzlHsvaCFoZLuk7q5NWomc3O0CQczD4+uyL4SCKUzpm5NiX7zTG0rPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EdB6yR8k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB92606C922;
	Mon, 19 Oct 2026 16:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EdB6yR8k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B596D1F000CC;
	Mon, 19 Oct 2026 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792425729;
	bh=T3OoZrJmi4UHul4Ly0uuZfTsyT/nHjsTbt0mJe/Vio4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EdB6yR8kJC4sXU4MNUh4QIbYaP5Wd0PFI3iddBSVOq8fOboeNm4Hlw8vly2KDYW9t
	 OJX+sV9a5FjLS7GpSTVlI8YOOXD5wmADM5R57HaoW2paGhJS91TMYGn6YYLt5tBtSQ
	 Jar41G4wElLe3Ur5wEEvmxuw/2ryGazJ3eL0oH2X3pERF/MAqAX8A97fopNy3/6IF2
	 GufucKqBmwGszQaWpCX9w4ruH6/bVYnFisaTgRQg0fKOblz2fJ5mlSzX0cazClD6PR
	 RzVKLHmP4/Zke+BzWuW4yGVcH2V8McuZqIg9YdEvXWXH8vOfcYvINEwQm+LkMgjseh
	 SeMCaa64EuW+w==
Date: Mon, 19 Oct 2026 17:02:02 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Message-ID: <20261019160202.GE2663669@google.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
 <20261013180933.487013-2-clamor95@gmail.com>
 <179198322819.839288.5272985130898382430@kernel.org>
 <CAPVz0n08bXQrujADdgQwuLu10JNjOrjBq-zNS6agSBGLLWt0OQ@mail.gmail.com>
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
In-Reply-To: <CAPVz0n08bXQrujADdgQwuLu10JNjOrjBq-zNS6agSBGLLWt0OQ@mail.gmail.com>

On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:

> пн, 19 жовт. 2026 р. о 17:52 Lee Jones <lee@kernel.org> пише:
> >
> > Wrong subject line.
> >
> 
> What do you mean by "Wrong subject line"? Specify.

This is a LEDs patch, but you have incorrectly tagged it as `mfd:`.
Honestly, I would have thought it would have been obvious, hence the
lack of further explanation.

> > > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
> > > Management Unit.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
> > >  1 file changed, 124 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> >
> > [...]
> >
> > --
> > Lee Jones

-- 
Lee Jones
