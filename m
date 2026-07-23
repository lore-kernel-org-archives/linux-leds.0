Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E14D43E9DF;
	Thu, 23 Jul 2026 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814683; cv=none; b=qwoC9DWhJXF5rwrbQhj4rbouP6l4Qx2eQw+n2TT+a4RMByZuXR7cNX0TDKJODclWfV3OdG8ceXLPN4Uz/anim1rmC4T7Un0Fl1qU9Ee/pnw4i/5dxy5Flmv6NJI+4q7AtK6sYk+KiBy5/VP3RkDSoChT9GMm3YIin0ylF0+viMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814683; c=relaxed/simple;
	bh=MzoR27tifuWzDBS7by+J3zZ2PzBEyw8+5dj2cuC8V+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eOLF34F+ZIau9L4dMfRDMLoNViqVNn7vahfre6/G8MUE9+3f/U4zKtHLsiAby7yfutH2/ikaezQ5McEcZVdUrRCJKx/hnAF0MnSQN1v6MZs2MwD8hl5XXhNP3rZifpNYAEjR+FGo3qg92+FJuxNqtBANhtiX1u679a5ALlHeZ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E211F000E9;
	Thu, 23 Jul 2026 13:51:17 +0000 (UTC)
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, riku.voipio@iki.fi, 
 Cosmo Chou <chou.cosmo@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, linux-leds@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 cosmo.chou@quantatw.com
In-Reply-To: <20260715080747.1638097-1-chou.cosmo@gmail.com>
References: <20260715080747.1638097-1-chou.cosmo@gmail.com>
Subject: Re: (subset) [PATCH] leds: pca9532: Fix phantom device
 registration on missing hardware
Message-Id: <178481467735.3460330.9170439328076726240.b4-ty@b4>
Date: Thu, 23 Jul 2026 14:51:17 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 15 Jul 2026 16:07:47 +0800, Cosmo Chou wrote:
> The initial PWM and PSC register writes in pca9532_configure() do not
> check the return values of i2c_smbus_write_byte_data(). If the I2C
> device is physically absent from the bus, the write fails with -ENXIO.
> However, the driver ignores this error and allows probe() to complete
> successfully.
> 
> This results in the registration of phantom LED class devices and
> gpiochips backed by non-existent hardware. Subsequent GPIO reads from
> these phantom chips return bogus values (due to -ENXIO being truncated
> to an unsigned char in pca9532_gpio_get_value()), silently corrupting
> hardware state tracking in userspace.
> 
> [...]

Applied, thanks!

[1/1] leds: pca9532: Fix phantom device registration on missing hardware
      commit: 8d6b6c05b8e33d11e3fb3203309385e1a9cceecd

--
Lee Jones [李琼斯]

