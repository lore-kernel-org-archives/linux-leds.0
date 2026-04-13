Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF5F313E15;
	Mon, 13 Apr 2026 22:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776120697; cv=none; b=lTH97whRPd6Z5qd+ubvTCq7pTbrTUAp4oxDEtzBu3hIWxCzunPoOgqlT8CLwrqP8sU6OCj8HQf1oz0lORxSeEiByV2nSdNzj6CfAFEyoxhDb6xLMuJPhjGfcQY6NjA1SyGP6KBsSo/vMV+ZYJmkKiUpv+4rlbof8WsLzAbJlWIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776120697; c=relaxed/simple;
	bh=0altFY3yuMLaI3GkEB2b56A4JNjc0pTnWlSCELaE9Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AEVz/agLITm6r9FN6TX64CJjT5KwGfQ6dtGldkfnOYIhktHFfAF/0bxi7kN6TSMTRlqPlMiA72nb71uaQNjmFUf86/Pb8L3Of7QohbLkUtSHwEAhVXR4SoyGnwInbMy+0tpupW5HURbIgmUf6IFfHnH6ZfoFXjptyHACns+TGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYRkarRl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYRkarRl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01936C2BCAF;
	Mon, 13 Apr 2026 22:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776120697;
	bh=0altFY3yuMLaI3GkEB2b56A4JNjc0pTnWlSCELaE9Jk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FYRkarRlmMHHU08vvrZDPoIyooBAYjHdmGfeuVs4t2D0NHFmxseVwb9Y2zo4SmLQd
	 VFVHaakxuCKg1KFXZd5uYwYbS2tWGsSt5Lwor4QvWUUd/3zHBp63ZcZtxjPw02frW3
	 kB3szv6oGLlNAbJXfUri7sAlpVhpd7MB8HmBC55ePlIgopEjzjw9YEbuCcKUsaqB7S
	 OngWCmqWSBkk2dgNDnjnL4537fG3zNMUpFDKUMGmJsCMujT9SfyEvPaSHYiLQJamof
	 ZGDYvZnz+/YBf7sR/2ZRxP3+AX5CUoxoePcA+30qKcKGCUK3BCfik0DQeHkWuVMx/Y
	 7X++S+xzB5tUw==
Date: Mon, 13 Apr 2026 15:51:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Kory Maincent
 <kory.maincent@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH net-next v4 2/2] net: pse-pd: add LED trigger support
 via notification path
Message-ID: <20260413155134.00120417@kernel.org>
In-Reply-To: <20260410124428.809943-3-github@szelinsky.de>
References: <20260410124428.809943-1-github@szelinsky.de>
	<20260410124428.809943-3-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Apr 2026 14:44:28 +0200 Carlo Szelinsky wrote:
> @@ -266,6 +267,23 @@ struct pse_pi {
>  	int pw_allocated_mW;
>  };
>  
> +#if IS_ENABLED(CONFIG_LEDS_TRIGGERS)
> +/**
> + * struct pse_pi_led_triggers - LED trigger state for a PSE PI
> + *
> + * @delivering: LED trigger for power delivering state
> + * @enabled: LED trigger for admin enabled state
> + * @last_delivering: cached delivering state for change detection
> + * @last_enabled: cached enabled state for change detection
> + */
> +struct pse_pi_led_triggers {
> +	struct led_trigger delivering;
> +	struct led_trigger enabled;
> +	bool last_delivering;
> +	bool last_enabled;
> +};
> +#endif
> +
>  /**

avoid wrapping type definitions in ifdefs.
This only forces other code to also be wrapped in ifdefs.
