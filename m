Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8782349CD3
	for <linux-leds@vger.kernel.org>; Tue,  4 Aug 2026 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785854470; cv=none; b=IB/YJBzN+n++4YwnE2ScVTImE/Oi2RU5EQokPkUcbSWgV7JcQdNsaKGYYY6l0K7sDT68+KyZnzRvmzpiaAqKINdROO1DNC5R3ho/NBLgbS6MOorDJxvIikyBx+hawlgx3GyKxG19MN5cn/8xKoQhJ2QmAkOd+A29dUsNqauc+aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785854470; c=relaxed/simple;
	bh=cq0nHALLi0tMHAVAK/aPY3SV7ESZLUW+ZjXlOpXq2LU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GtOXLw1TIrE165qr5LJewAHRRd+6sVY05YtT5ERXSzzinPWF9Picpu6vqTzlSgTcpC8Cj1YxNh/DVNji/Bv6jCkn1WA2HZAbQiNErR+qmJOcUUH1g6ci6Ihfg6NQyX52t3YW4cm2NcScaACUKe4WJo2k+41bjwV5oZg61I8FNDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=pHZDzj+t; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="pHZDzj+t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=umx+0Xbf1pGIjPYZoWYg8y6Brc8GBYfdVPjn8jMxYQI=; t=1785854469; x=1787064069; 
	b=pHZDzj+txQHNEaHiLTCegW1lFCLbaXMLcIHRmJ3h0qCamAsnQ8q+1O7HkwgZjpg30P0/L31iR3t
	hkzgCu4RsYe5cCHVQiODjAJG2oonTMU3Dr7HL0GylkDgmEH3iZ3El/OP/em3QDVyXWnUyni/prPG9
	xLmlzUkfbMMz4ERyzWL3sOMCcz0RN21o/OasvyPgv78cLKOFbHObWcgHm/pAurZ8gn6Q5UnW17R4J
	UMKA8cJVAB8BHj81nH/VQD0dVHVuaQyRUDocYAxYVINwQIKR3oUCvFanK/amyya0LLoWEQbltNi70
	e+pqx/gDCyiByEdQL1gc8g8Ofr7qgiPiFNXA==;
Date: Tue, 4 Aug 2026 16:41:01 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, lee@kernel.org,
 linux-leds@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3] leds: is31fl319x: modernize registration
Message-ID: <20260804164101.43753f1b@kemnade.info>
In-Reply-To: <20260804135515.5DBFC1F000E9@smtp.kernel.org>
References: <20260804-led-modern-v3-1-297720eec19f@kemnade.info>
	<20260804135515.5DBFC1F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 04 Aug 2026 13:55:14 +0000
sashiko-bot@kernel.org wrote:

> > leds: is31fl319x: modernize registration  
> 
> [Severity: Low]
> This isn't a bug, but should the description after the subsystem prefix be
> capitalized? The LED subsystem guidelines recommend formatting commit messages
> as "leds: <Driver>: <Capitalized description>".


~/linux$ grep -R 'leds: <Driver>: <Capitalized description>"' Documentation/
~/linux$ ls Documentation/leds/
index.rst                  leds-lp5521.rst      leds-sc27xx.rst
leds-blinkm.rst            leds-lp5523.rst      leds-st1202.rst
leds-cht-wcove.rst         leds-lp5562.rst      ledtrig-oneshot.rst
leds-class-flash.rst       leds-lp55xx.rst      ledtrig-transient.rst
leds-class-multicolor.rst  leds-lp5812.rst      ledtrig-usbport.rst
leds-class.rst             leds-mlxcpld.rst     uleds.rst
leds-el15203000.rst        leds-mt6370-rgb.rst  well-known-leds.txt
leds-lm3556.rst            leds-qcom-lpg.rst
leds-lp3944.rst            leds-s2m-rgb.rst

nothing look like special guidelines for the system. I do not want to
see such comments without a reference.
Also MAINTAINERS does not show any additional policy for the LED subsystem.

Regards,
Andreas
