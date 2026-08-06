Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC803B5E19;
	Thu,  6 Aug 2026 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027249; cv=none; b=hKux3UvDgClNEr6tHEThzAIb9dPXdF8RCphg1iY5XH2O+ubg4Oew+at7fyl/CPNTYGxjwvhAHTeybuINqp1mGbCaSsubAODZwrenTyYCI8KHYKj+erRN7HL5DwJz4dbPH/G/5rQ1U+fpWGD7zObvUi003kOroeICNkSuWUT5t4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027249; c=relaxed/simple;
	bh=CeIRW8ADMGG+CUlfrMknEhjQlOhIKs8Ld2QehrBSDH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ikW6xZ7doPOimRj67l+hUD1DCWtOpYt+YC0K8WFsr6tJGRjHgp+9xW6dmh3t0oNCwPWBRoeL4scEfyz5y1fSnDqKZlnVe6G3OpuyrQhcIDzmGoyMyeGepw/CNwu+Mc9j5V0F8uos1MngLg1WvIILdiK8Bm2jeXL2ue6cwnKgNsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=whXNjc2u; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="whXNjc2u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=FZIEzN2V2JqjGXOQM9wZT4ytUqP9hz4ZNtjjZVESahM=; b=whXNjc2ucP2u5Ow+eZETz+en0+
	bm7YJhpm2Vmh9ZlHytuQIpEb22PB7PBNlEo4Dsso+seWS96A4vfhgaH3AH+2i8f4mvPtg5esLvBVs
	9vt8EXEsu0zvu6UxxCFU5iLUqiECzPAJXNOJWIOHera45DHSMr6AS2VupOOJQgLW0uroACAibh6tA
	5VVuAQaqDitKveo+TK0bbCN1Jt8dfd6QnAeyqWEHkWzx7/Q6ML7kMiEjkjZF1sQlSEJDQe/x72DVF
	I0vSS9e3r7RUgcWdL7jXplqevUE5AZZb+BjIGPMx6GX6K38K3LTRG4/WSINe5sDCKQeFIHEavt7vv
	VLZ0BHwg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Lee Jones <lee@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Date: Thu, 06 Aug 2026 16:40:42 +0200
Message-ID: <7021768.R56niFO833@diego>
In-Reply-To: <20260806143849.GP2869284@google.com>
References:
 <20260711192842.845048-3-samuel@sholland.org> <1954916.R1toDxpfAE@diego>
 <20260806143849.GP2869284@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 6. August 2026, 16:38:49 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Lee Jones:
> On Wed, 29 Jul 2026, Heiko St=C3=BCbner wrote:
>=20
> > Hi Lee,
> >=20
> > Am Donnerstag, 16. Juli 2026, 12:41:59 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Lee Jones:
> > > On Sat, 11 Jul 2026 14:28:26 -0500, Samuel Holland wrote:
> > > > Techvision Intelligent Technology Co., Ltd[1] aka Shenzhen Huiwei
> > > > Intelligent Technology Co., Ltd[2] is a manufacturer of single-board
> > > > computers.
> > >=20
> > > Applied, thanks!
> > >=20
> > > [2/4] dt-bindings: vendor-prefixes: Add techvision
> > >       commit: f0e0417373ca55d07cba596e8afe081c078843ad
> >=20
> > I can't find neither patch1 nor patch2 in neither the LEDs git nor
> > linux-next. Is there a git push missing somewhere?
>=20
> I pushed this a while ago.  Let me know if you still can't find it.

all good now ... it appeared a day or two after that mail on git.kernel.org


Heiko


