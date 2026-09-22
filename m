Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E5F51DE17;
	Tue, 22 Sep 2026 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074225; cv=none; b=rhgN4JVPo5xzikGkTkz3NvU7ZCCBsLzwVVitFQFX+A4FuiB27/od62PoNdSl/OsjGfbaLgfAF5fDDSh2cFU94K90QhhLBwdHWCQgWPDBM+K0giezz87Tmp3sAZPdcDI7MWq63obwbK0PBYwke9Y9trJgrzOAud4Vh80K6xrSlqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074225; c=relaxed/simple;
	bh=s6N23h+5iDE8xIahCOAugsRbflX6HGkHTdjUz5iQ2yo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OefMP4HH814Eu8lo+zwtABAVwdUxFGPOSgTFjMkIntDock33IL/y3uEwmE77AIPBIFafRQmK11PmH/MD+8cHgqNJFTY9+6T9O/vK2KIveQFPtTEeb1WboPskvMCiTAk+cJmswjeOUHbgQYLKtct/tkZlL8/tDb3gOBxFaNHjt7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRJcQcaW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRJcQcaW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89691F000FF;
	Tue, 22 Sep 2026 10:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074223;
	bh=tjWrrZP3nr9TBIW65q5/Mtk1Aa2eGu3yKi6G9Z2GbX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IRJcQcaWXJzo26nwQNvE5p4f+Lzmjct3d1EnDZ3+Hq4apzwkh+en6Pj0g5V9Q0HMg
	 BdvPT9mMiC9/0Py6rHnlLvDf5faGQ3M4cUckv2hY3Fx+hWoH60f7uG3LrhrCo0wFcR
	 7hBuVEjM0/Tdd6pIbU/zxdzVNd7q61uQicQI/6uq2iqWtBSfhTztjrQ/AZDNQpZD9D
	 75Udd4BixZoD9B8HQZpiLBpO7jVlixWZLfMLVvOQiFRN1pmr3pJz7gGGcvzZSccdan
	 6dNpCL5upcBANBP1trUkPJnDsNG1HnxHwq6SwEbUm8+uoCUxUOl9AqIX0Qi1Cc1wCB
	 yDVVy2k6R/mow==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Miles Krause <mileskrause5200@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260910-leds-lp8860-of-node-leak-v1-1-d333cff4345b@gmail.com>
References: <20260910-leds-lp8860-of-node-leak-v1-1-d333cff4345b@gmail.com>
Subject: Re: (subset) [PATCH] leds: lp8860: fix device_node leak in
 lp8860_probe()
Message-Id: <179007422171.3288629.785298422075226212.b4-ty@b4>
Date: Tue, 22 Sep 2026 11:50:21 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 10 Sep 2026 15:43:20 -0400, Miles Krause wrote:
> lp8860_probe() looks up the driver's single LED child node with
> of_get_next_available_child() and hands it to the LED core as
> init_data.fwnode, but never drops the reference that lookup returned:
> 
> 	child_node = of_get_next_available_child(np, NULL);
> 	if (!child_node)
> 		return -EINVAL;
> 	...
> 	init_data.fwnode = of_fwnode_handle(child_node);
> 
> [...]

Applied, thanks!

[1/1] leds: lp8860: fix device_node leak in lp8860_probe()
      commit: f9879086c4eb4b3b0f4baa80139a5720b99b229e

--
Lee Jones [李琼斯]

