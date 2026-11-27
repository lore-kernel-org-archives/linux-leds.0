Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790347;
	b=A1lZ1wAeJJMbd+z0sqy3LX3YcrbwGcEZPD4Uy4qjB7Np7qppH6yt1Z/Ov9Yu1bpY5hIK
	 F5l6822OAjP451uH3ffG/Yf22T+GaIL9yREgfbRfEMCqDeXPRPog0vPNtn04FmcZdbs2h
	 KrvZavgOiVJ6/sj3rVrCHvRpZzyCewl2nyANsLIpm1kHzrCa3vQmuXPTtJxnOGO+wlLmO
	 2dKArEI8dRF/3e0lEt0nECDIV6i/XoZaC94jCtkwzCO1wipjZwiXvEn20X5k9WUmEITMJ
	 kPtK2l2xDpSPZlM9odoEv7F8cY+RPpEaiXDR5csZdLmlTeOz7cH1mK4+qfdffe76lhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790347;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FuT5u6gV9CwPq6lEFUhfiStF3L7hgCX0k5qqet4kLmA=;
	b=XfQAKqDL5n631x4FI+iS8Z8CyZv6YPCyVLZUMiV8c9VUZpzBtOxr1R5JtQLTzLHCmfkn
	 etv2MzuVg7a5uedJ/RA78ckmhX7FIN0HkgQKf6ZffgCtZL6V0P5/F4B5/ayZ2waKBZL04
	 FPk6/W7vRUeuWXjO7Mkv1bl6nVnptv/XYO+MuQWWraANwml1hTtNVPePRF6jOyeE8X/D2
	 PL8t2ytM/m4rg0/Hl7Ty8MoHaQBAohjt4Jdr0TGpMGqx7gO0tFZbLLUwX5tsJF0t/n2QP
	 rOv6U4ZRwb1ZEVzDunzOoZ0EasD812gHRGbQPjdRLmaxmr7u20a5HUGVLMaoYm0WaNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fpG/HO3C";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A296F606A333;
	Fri, 27 Nov 2026 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpG/HO3C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CE31F00893;
	Fri, 27 Nov 2026 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795790347;
	bh=FuT5u6gV9CwPq6lEFUhfiStF3L7hgCX0k5qqet4kLmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fpG/HO3CX3nyT8e9qBOaUHXEGZ0NUoJub1N87ltaQsA0CRA3UZsiyIBWOGGuc3rhz
	 OGMgZu8Oi4LMJD5/dRVdkpk26WLo+5pzV9ocp6QZ7oUiYvvFDFEjUesRhxGQAEO20/
	 kceA5j/T3uymws7Ismsoc2DFDYgsTw/PnD9SLu7QpQJorQJEXu8ND5QxMhCTw9C3yb
	 6fSwbTF8p4oWCD94/CpIHgfrrL+I2IFixH2BJ1babWdToB6ISKiaFhjRqDyile1Io/
	 x0qn662uN50IAcggr+QQORijW2Z35trVYBu7P3Q+VC6xnyZMQc9H5DvCAToV/YKRpi
	 HpyOTpXZb4rSg==
Date: Fri, 27 Nov 2026 14:39:02 +0000
From: Lee Jones <lee@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, i@rong.moe
Subject: Re: [PATCH v3 10/11] leds: rgb: ktd202x: Initialize max_brightness
 before registering LED
Message-ID: <20261127143902.GU38590@joneslee-macbookpro.roam.internal>
References: <20261120212431.152081-1-W_Armin@gmx.de>
 <20261120212431.152081-11-W_Armin@gmx.de>
 <498a9e07-3b8e-4dce-86da-37c9eb2837a5@gmx.de>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <498a9e07-3b8e-4dce-86da-37c9eb2837a5@gmx.de>

On Sat, 21 Nov 2026, Armin Wolf wrote:

> Am 20.11.26 um 22:22 schrieb Armin Wolf:
> 
> > Initializing max_brightness after having already registered the LED
> > class device will overwrite any adjustments made via devicetree and
> > mess up the multicolor LED fallback path for multi_intensity_max.
> > 
> > Fix this by initializing max_brightness brefore registering the LED
> > class device.
> 
> Sashiko now complains that initializing info[i].intensity with KTD202X_MAX_BRIGHTNESS
> will cause issues if max_brightness is being lowered by devicetree properties.
> 
> AFAIK many RGB LED drivers have this problem, and i am uneasy in making large changes
> to them without being able to test them on real hardware.
> 
> Do you want me to fix this issue too or do you consider it out-of-scope?

Out of scope for now.

-- 
Lee Jones
