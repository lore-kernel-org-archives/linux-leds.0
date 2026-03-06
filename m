Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0794B273803
	for <linux-leds@vger.kernel.org>; Fri,  6 Mar 2026 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772796661; cv=none; b=MOi1kVslq9s1+kvWAoOr1+Z/XbeExmhMIuBXHQ5Itd8w38adGzrvo6Hsq7VcieEOelZSZbuWvVzeI0/5lYp4230Qljp98hiFX+/1htAu8xnYIVgY9I5OX7gbO9+E2zswE8OmeX/I5tVuENT81jOccagHEAxScY4SrRqYaqurnnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772796661; c=relaxed/simple;
	bh=hm5Xf2XuRoxHDTTHAqmZZOpF80zAOq9ZV1uL/8217ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZe/50aKHCN5e79VmFo7nzqHBHZFdsJIOMeyfd2UGKjJN13uZDCn88twpvluAa79IwBjUnhyvnAZgGMhuOsZz3BTDEFLusbU1qo2iwKX8fQC0Tv/jazLCX8Zz9L8/NQxWahSwMbRLGcfkOO2RF/qZZ8t7kSLrYcizzlXNsJUZzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QICC060A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QICC060A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DECC2BC87;
	Fri,  6 Mar 2026 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772796660;
	bh=hm5Xf2XuRoxHDTTHAqmZZOpF80zAOq9ZV1uL/8217ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QICC060Ab614Z/SUOl2yvE27ZK74P1SRodYpUx25cX6zz4lRMpPxt18uw5b+cpEtA
	 RybUopjzq2JH5wc8LDWN0CGxXc+LbVkZ8ZkN8N5oxFLpbWehV/HpRDe/TKvi6N9ysE
	 SeUNVHisLUdsJwc9VevXwRHcGQ/Z6dwGZ0BrXs3dnwNtkoLB/bQ1M+7+OHvAYTOuyU
	 /3S2Qmdhh2QSpa0qFPxYXMUGuWa/UtXDljYWPX9Hb9a2rkh6nwnnKtKN26nsi+2VEL
	 LUJyKx1O2NgtGgrrcQn/XflyZi+mbaecz9ehGi47jzLkR5SQXLRdPJpSfvyCK9XRRt
	 AIXVoVi0DyKCw==
Date: Fri, 6 Mar 2026 11:30:55 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pavel Machek <pavel@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	kernel@pengutronix.de, Khalid Talash <ktalash@topcon.com>
Subject: Re: [PATCH] leds: multicolor: limit intensity to max_brightness of
 LED
Message-ID: <20260306113055.GH183676@google.com>
References: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
 <aamOejvtN8H1zB0E@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aamOejvtN8H1zB0E@black.igk.intel.com>

On Thu, 05 Mar 2026, Andy Shevchenko wrote:

> On Fri, Jan 23, 2026 at 11:13:24AM +0100, Michael Tretter wrote:
> > According to Documentation/ABI/testing/sysfs-class-led-multicolor, the
> > intensity should not exceed /sys/class/leds/<led>/max_brightness.
> > 
> > The interface doesn't check the values and higher values may lead to
> > unexpected color changes if the brightness is changed.
> > 
> > Clamp the intensity value to max_brightness.
> 
> This also brings a regression if somebody doesn't care about wrapping around.
> It's possible to return an error instead, but still the user space will be
> broken (in some rare weird cases).
> 
> Again, I care even less about this change, but be always careful,
> the main rule in the kernel "We do NOT break user space".

What are you saying?  I should remove this patch?

-- 
Lee Jones [李琼斯]
