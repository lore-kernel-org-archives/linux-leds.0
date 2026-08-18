Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7397247D957;
	Tue, 18 Aug 2026 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072242; cv=none; b=pLMGqF1QtGPl+SLtg580ZAc665TcpccMfUxOep7G67nryS9Git+ZSUwBRQqwyWXDPX1526fU5KcaqNXvkdNkmq6/T6VAhKmbiPwVYfJ/soiCNWs2t8DxuXo2U4w5OdeZV1TWzMJ4Cg74OUEJ1nlj7s+1VEYT6GbOogsImzxbQNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072242; c=relaxed/simple;
	bh=RU2UXDqUl3i0/vS71dXUFDphOB1mhaEC3l2I3oRiD80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJjODbTGn8wD3PMzNT7xxz3V4N/cPlOAdbs+VLu10CqTRWmjSeuoy8FPe6khIS6G+g+kpcNcJfzlWIY0wEH7OCiS8oPaJdLDt2WMNKnfsBB30YOta58FOSe//c15/ZAnp3qSIaFnhZqgbVq9+06oT38eQXzOGBQohBmq8SJ446A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0UsKVzo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0UsKVzo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416DD1F00A3A;
	Tue, 18 Aug 2026 16:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787072235;
	bh=lQsNXBGziU74498qXO7nW3L1pK+YW9GnS3YxKL1owCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D0UsKVzoog4pJ3s/ZACOhM7l8BJPH2pRGz08aqSljWEP3VrqisE+Vry8ZbIST2dip
	 TuTREO3P36nnJ5Z0NTbETXDqWdwys0Swz4NUw9MlU7FnBk/kUZ+eXRm39kScaMhBcy
	 bePLvWpxs39wLYit3gUg9UYLWSB/UjTXv73aMDMVrcisllslw4NlUiY8MCqgqpPE+E
	 yqcAMcMhgQ13VV8M1c2MtSB54fD9mNgzuHD3NxkToyekwj3uDANlVrRSYIb3x1sK5B
	 yqnisJIh91gUKUN+4GdL+MgWpSqiG6PLvZPrnaAS1lgh9l1j1kr1n6kUPWHEFrxwxH
	 kg1mlMSJhocXw==
From: Jakub Kicinski <kuba@kernel.org>
To: ahmadexp@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	peda@lysator.liu.se,
	trannamatk@gmail.com,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/7] leds: is32fl3207: Add controller driver
Date: Tue, 18 Aug 2026 09:57:13 -0700
Message-ID: <20260818165713.4008370-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <200b35cd5847c318f4330dd162147b648c402601.1786747084.git.ahmadexp@gmail.com>
References: <200b35cd5847c318f4330dd162147b648c402601.1786747084.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
leds: is32fl3207: Add controller driver

This adds an I2C driver for the Lumissil IS32FL3207 18-channel LED
controller, exposing single and multicolor LEDs via the LED class.
Per-output current limits are programmed into the scaling registers based
on the RISET value and each LED's led-max-microamp property.

> diff --git a/drivers/leds/rgb/leds-is32fl3207.c b/drivers/leds/rgb/leds-is32fl3207.c
> new file mode 100644
> index 0000000000000..6a46f97ba50a5
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-is32fl3207.c
> @@ -0,0 +1,736 @@

[ ... ]

> +static int is32fl3207_configure_channel(struct is32fl3207 *chip,
> +					struct fwnode_handle *fwnode,
> +					unsigned int *channel)
> +{

[ ... ]

> +	ret = fwnode_property_read_u32(fwnode, "led-max-microamp",
> +				       &max_microamp);
> +	if (ret)
> +		return dev_err_probe(chip->dev, ret,
> +				     "failed to read current limit for channel %u\n",
> +				     reg);
> +
> +	if (!max_microamp || max_microamp > chip->output_max_microamp)
> +		return dev_err_probe(chip->dev, -EINVAL,
> +				     "invalid current limit %u uA for channel %u\n",
> +				     max_microamp, reg);
> +
> +	/* GCC is fixed at 0xff, so use each output's scaling register. */
> +	scaling = div_u64((u64)max_microamp * 256 * 256,
> +			  (u64)chip->output_max_microamp *
> +			  IS32FL3207_GLOBAL_CURRENT_MAX);
> +	if (!scaling)
> +		return dev_err_probe(chip->dev, -EINVAL,
> +				     "current limit %u uA is below channel %u resolution\n",
> +				     max_microamp, reg);

[Severity: Medium]
Can this reject device trees that are valid according to the binding?

Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml declares
led-max-microamp with minimum: 1, both for the top-level led@ nodes and for
the multi-led component nodes:

      led-max-microamp:
        minimum: 1
        maximum: 38250
        description: |
          Board-safe peak current for this output. The value must not exceed
          the full-scale current derived from issi,riset-ohms.

In is32fl3207_configure_channel() the scaling quotient truncates to zero for
small currents, and the !scaling case aborts probe with -EINVAL via
is32fl3207_probe() -> is32fl3207_register_led() ->
is32fl3207_register_single()/is32fl3207_register_multicolor() ->
is32fl3207_configure_channel().

With the smallest RISET the binding permits, 2000 ohms,
output_max_microamp is 76500000 / 2000 = 38250, so scaling stays zero for
any led-max-microamp below 149 uA (38250 * 255 / 65536 = 148.8). With the
RISET used in the binding example, 4700 ohms, output_max_microamp is 16276
and the cut-off is 64 uA.

So a device tree that passes dt_binding_check with, say,
led-max-microamp = <50> fails to bind, and the actual lower bound is
board-dependent and not documented anywhere.

Should the binding describe the RISET-dependent lower bound, or should the
driver clamp sub-resolution values to a scaling of 1 instead of failing
probe?

Cross-instance finding from sashiko-gemini (abacfa25c43c61e8a044d405172e276c795bb984d2cf45e93b49076c16419dfc):
[Severity: Medium]
`is32fl3207_clear_retained_scaling` fails to latch the zeroed scaling registers, leading to a brief LED flash during hardware initialization.
