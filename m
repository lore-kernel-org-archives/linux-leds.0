Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200426;
	b=r4/gWUPWkf3+0UFmZDCk9deIT1d4HgYMqM+/iuBAcOjmLJUlwAUNkVVxh1kNAi4cfi4K
	 IcsMbQMN1ryvctQwUEqGG1l3B4FL6VAvJvZ+GPNucDo+63diOgNPN2cxi4oSUKTlMEr10
	 +Mf3wvauu+Ykqm0DGRQBEoYU5vqPHIoDDR0hkikWMAgzaSReZozhJ0kB4TMyQJ5PC6pZv
	 ipQlGKOUI/2ExnRWd4B/1NMtV25tx6VRXuXaYJsTxZ/yu839YNlfVnoxLHwEVVo6GOJjF
	 ec7bTcnkkA8BBwZbuP/yd1BsK3P44u0MNtbL54JRxqBIXSEakIqUVvFwBPvELodameg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200426;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=8gYlA1iTRLblzGqs2OMzSFmtPPkUAEBHAeWmIZX5fXo=;
	b=2MybRsSHvudtWhwbBhdFSoHPZa7qkpvzM9dUDK9/SE8saT8ed4PS1Vd1WYE5GJz6VzbR
	 bxqc1BOpAdlH8lV5p/0Ne1SVjfee5tVyC9ZlVI5s1NXDYdX7PwkLEZ9fDoQOb8KpL5Rj5
	 sQbMK8mSSZ30M5G8ObrPOWqOiQ3Qz6uf4KWtZFI2CN4m4eBI9WBk2P7CqhzsubkhwIGC3
	 ZF4mDVT9njTYytfWp+zKXg+xLoi+LMFVB4NvE4S/WLCfrLKjlbel4/ALzvqopGiaD2v4D
	 KtnYUBdEhckTljDAk0ZHhSkR88Bkz9ygQvZpBx1p1Su0eSfS499VemvgYq1EjzCq4GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eapZM1IJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B99606A31A;
	Wed, 28 Oct 2026 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eapZM1IJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F02C1F01825;
	Wed, 28 Oct 2026 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793200425;
	bh=8gYlA1iTRLblzGqs2OMzSFmtPPkUAEBHAeWmIZX5fXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eapZM1IJxGuPA37zaOIrNBarZ23YKu3WE3YUsgJ3m59XFeX2CWJLV2N57Qgb6x/vE
	 OlqFq9XNkNtsVgXcwmupqYHUmTZczCoyoQt6hu2+6VlEqPsaWcwY6CgcpKJua52+67
	 22S3SSlnSc6M8/Zhm2KEnkxOTFXRbx2YGlKWGUf/qhkiE9kHNgaYjGcMqtW75jZO4h
	 FHUWmylK6589YaIeYe64AEOL6ZhcqkPvQA5cSreVr8iaCUD+zcI+nizXqR6o4ny5mn
	 wcZvX2Gj+DbcTLI5xM1KA2Me516W5u8x34w5hzVk1IFdT0ljRXg3uUUak8dGCWrD9J
	 XWR+Xk+75hcyA==
Date: Wed, 28 Oct 2026 15:13:41 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Fl=E1vio?= Amieiro <flavio@amieiro.net>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] leds: is31f132xx: Add support for is31fl3206
Message-ID: <20261028151341.GE3605912@google.com>
References: <20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net>
 <20261013-add-is31fl3206-support-v3-2-66a762a3c12f@amieiro.net>
 <179198370454.839288.5327794631276643738@kernel.org>
 <87bj8noj35.fsf@berlin>
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
In-Reply-To: <87bj8noj35.fsf@berlin>

On Tue, 20 Oct 2026, Flávio Amieiro wrote:

> Lee Jones <lee@kernel.org> writes:
> 
> > --- checkpatch.pl (1 issue) ---
> > Line 172: WARNING: DT compatible string "issi,is31fl3206" appears un-documented -- check ./Documentation/devicetree/bindings/
> >
> > This true, or is it documented in this set?
> >
> 
> It is documented in the first patch in the series[1].
> 
> 
> >
> > New for() loops should initiate the variable.
> >
> >   for (int i = 0; ...
> >
> 
> I will make sure to initialize the variable in the loop for any new code
> I add in v4. Some of this code, though, was old code that simply moved
> around (and by changing the approach in v4 it might not move anymore).
> 
> Should I add a patch to the series to fix this in portions of the code I
> move to another place?
> 
> If it is helpful, I can also change this in the entire file, just let me
> know if this is welcome as a patch in this series or if it better to
> send it in a different one.
> 
> >
> > Spaces around '+' please.
> >
> 
> This is the same as the for loops: I'll make sure to take this into
> consideration for code added in v4.
> 
> >
> > I detest pointers to functions at the device driver level.
> >
> > Please find another way to do this.
> >
> 
> I'll find another approach for this but, since this is my first patch,
> maybe it's better to align on it before sending in a new version
> unnecessarily to the list.

Sorry, I don't have the time to learn about your device.

Have a think about other ways you can support what you're trying to do,
then attempt to find a solid precedent for it.  You can submit
subsequent attempts "unnecessarily", no one is going to get mad.

-- 
Lee Jones
