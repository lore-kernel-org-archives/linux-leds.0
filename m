Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF9937A858;
	Thu,  2 Jul 2026 14:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783004015; cv=none; b=jms6RWs8pZXfrynjV4TOp23gzOb+8i3VvJ+5oOWbz1MOBTPk2mDOSUp9TgMlutxS4tutEEYi3pFXaydM5v41QXRsZxseCwFO8Y/zo/SDH/RyphIDFQPNvmlq7RwqP41mDO1E26axi2iH4mumzR72Rpofh2pbfVTJHG+LQ7hW2ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783004015; c=relaxed/simple;
	bh=twOzWXK8RnYUNjWC9BL2cMUMdAws3ECcmPJF9cS/3Mo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QUlNxwwuwzx8jHK0V5G+wE2vmYGk/R7pXlcZd5jxQFogmdo1267H5WxOGPglLJkO9QJVhSiwvEWiD6yMqisLMjcq+wThfCYssAdVKnWvh84CMpOzMC/3qNMMtjA8BtvbAy5C5HdRrOO4M9anJuYQSu7xoc4RH+YUjIHBdXPBbbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRo46e8B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRo46e8B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0F91F000E9;
	Thu,  2 Jul 2026 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783004014;
	bh=pWP9NSYGbUXgzQMWt7ehk6978w195zKXzsVmUj8G8vw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cRo46e8BkiRaVCC/mwfIlOekEGY4ni5wlCIslUydBr5z1ezMiiy6N87Shcr4QG3JH
	 hamcbR0qzsFgH607903dSuqkrQn/Hq+XJ9PBvrOUP/bXQxXhL2wFvPfLD0+hawIHU5
	 IgPu0y8156YYuO4Ue4FKeaHZIpSNT4Vzp2sUsIHj2TTYkf0xqi4geKnOVdPyzakY3M
	 1Z544CcNo1zFSXlVEFXEhhYnno2yt48AeyBHzy2jXxkQGrRx0UpsHDY4bmheK44C63
	 ngZh6vG7gePbZt09Bbr6vg5lzSUgggZhpxxaJxG+BVkHeaTvOnUtoNesTNFJ6VHNEx
	 2xnpidVs55FaQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-leds@vger.kernel.org
In-Reply-To: <311792e767ab803d4744bc26155e6dac253d9b45.1781970783.git.christophe.jaillet@wanadoo.fr>
References: <311792e767ab803d4744bc26155e6dac253d9b45.1781970783.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH] leds: lp5860-spi: Fix an error handling path
Message-Id: <178300401230.2188240.2398403152134635212.b4-ty@b4>
Date: Thu, 02 Jul 2026 15:53:32 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sat, 20 Jun 2026 17:53:22 +0200, Christophe JAILLET wrote:
> If lp5860_device_init() fails, a missing mutex_destroy() should be called.
> 
> Use devm_mutex_init() instead of mutex_init() to fix it.
> This also simplifies the remove function.

Applied, thanks!

[1/1] leds: lp5860-spi: Fix an error handling path
      commit: f647a2266289a35eaa4865f629f2ab7046900d9b

--
Lee Jones [李琼斯]

