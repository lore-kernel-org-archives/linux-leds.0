Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8514251E458;
	Thu, 17 Sep 2026 13:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651524; cv=none; b=UnFs77KiN+WFr7FayZQ5lEnXRyhEuJXWOCJzbvFzulpMv6lO6oymlGoguV+O/wlsksWAOAz3Cd4Z7OHjj2OlllNCbknShJapi20sOIfZMi3i6DLbz7wAbPx6B7WP7WVYh1qc09SpytQd1cTablHCQr0mYSbO/gCXsw+JUUXIEHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651524; c=relaxed/simple;
	bh=gVD9W1CBPVhmrTxtc5WnNSGe+vE1+URZ9q5DxqejVZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMz4bImoMd+gN3oIy6zW9bbwNQmBtWjon5ldJMEsKd9zT+J2DAYOKyRrPEbQYmgRGgdgEX2OA0jaUqAVRsYIWBTeuVu19RauBd35vq4pO8AGFO4o8vCSDtzS5c8JcnsZaOEQ915nWpUebx/MIaiUv2uc7wjghACee9zi63i6svQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovJ6Wwa8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovJ6Wwa8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2C01F000FF;
	Thu, 17 Sep 2026 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789651523;
	bh=Ivvbg2Qy8hiBDPpV3Nl+TEIbuor1OG5KJ7A30t4Qd3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ovJ6Wwa88Aw0uXlEuHmgQ3EdETB269eC3btbORnzZGRTm3bD9WGwIVl03hVNZiGUi
	 GZl5D5RRbWbK64GZY9qOpqxbkw1CEeLyZo7zhWxGojfLpjWNSaNUe+goVr38WnVHrA
	 rR/9KTYWVJWW1eN0idEm2mnM3jWH+7N3EiarmqBlAe/u8Afi+X6ymYQHCoD2CLVmo0
	 s8gWKUsV5NcxPIgUXbGDv/jcPVyAtRZJ0Q9GGjtxvXKZ/1arhYbhmHQ/GkD+vg2BUP
	 PiYqtWJ/G+46c+fHzNpStW1Lyk72JCIi7dv+fWVFrj9JsDjQ2FOS1d8bVdy7smvcON
	 Ibk1T9u8qHGAg==
Date: Thu, 17 Sep 2026 14:25:19 +0100
From: Lee Jones <lee@kernel.org>
To: mileskrause5200@gmail.com
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: max77705: fix fwnode reference leak in
 max77705_add_led()
Message-ID: <20260917132519.GK1605367@google.com>
References: <20260906-leds-max77705-fwnode-leak-v1-1-eba6822529fd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-leds-max77705-fwnode-leak-v1-1-eba6822529fd@gmail.com>

On Sun, 06 Sep 2026, Miles Krause via B4 Relay wrote:

> From: Miles Krause <mileskrause5200@gmail.com>
> 
> max77705_add_led() iterates over the multicolor LED's child nodes with
> fwnode_for_each_child_node() and returns directly from inside the loop
> when parsing a child fails:
> 
> 	fwnode_for_each_child_node(np, child) {
> 		ret = max77705_parse_subled(dev, child, &info[i]);
> 		if (ret < 0)
> 			return ret;
> 		...
> 	}
> 
> The iterator holds a reference on the current child for the duration of
> each iteration: fwnode_get_next_child_node() takes a reference on the
> node it returns and only drops the previous one when it is called again
> (for the OF backend that is the of_node_put(prev) in
> of_get_next_status_child()).  Returning from inside the loop skips that
> final call, so the reference taken for the child that failed to parse is
> never released.
> 
> max77705_parse_subled() rejects a missing, zero or out-of-range "reg"
> property and propagates errors from reading "color", so a malformed
> device tree is enough to leak a device_node reference.
> 
> Use fwnode_for_each_child_node_scoped() instead, which releases the
> reference on every exit path, and drop the now unused 'child'
> declaration.  max77705_led_probe() already uses the equivalent
> device_for_each_child_node_scoped() for the outer loop.
> 
> Fixes: aebb5fc9a0d8 ("leds: max77705: Add LEDs support")
> Signed-off-by: Miles Krause <mileskrause5200@gmail.com>

Beaten to it by this I'm afraid:

  4805e5ec50d0 leds: max77705: Use fwnode_for_each_child_node_scoped() in max77705_add_led()

-- 
Lee Jones
