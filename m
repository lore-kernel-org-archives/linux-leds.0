Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773468;
	b=goYZIDG9L2+O44J2JvBO04Rnd2D1m+uMHJ/AxgPSyLWdlo/NEJx8MmsXzLz5ZhwqO8mN
	 BH4UAVRs5xd1E7Vgjnf4ReEC/gHxhIPNhaYBj7CXjNG12KaXH64T0xtkjDM9VshJZAoAw
	 rapHJPF6X7/DoIrLCQG9ZlgJAAevQlXj7vAnsUnrFuZhLfxd3PgTzl7/MrZ7A1KeBTbOZ
	 k4YBTVP1Op81vtvAKE7BfajTS9yf16GFcWKzB+vplEuzaIW6Iis2+sdCPwBk8hSI9gY9t
	 UqFDVhEiQPK57qSFh+YDoz/J6Dv8HtjIoiLiNUmJHN9jdizP5jmHAPQgwK2ggdKC5Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773468;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-AI-Review-Draft;
	bh=/1dki3ql4ILPtX6VVm38QgFRupvHzc8t9wWMswuYXUg=;
	b=ZSxTsFKUAxRJ7Wxjsy3STm1hX6POGyTZtbX6867/xvdN1+SWzhRql9rn9l5pffA+g/Zv
	 GycIYCiNvM/ydar1o76ZEEqn19QyQrWj5WF42dkTxQzASyRJ15AC+dNxQXZdmxKqqL8pk
	 68v8U6jWMYRr1EK/vxEW3ohSeGskb93Loxv14m9RMOrXN7rU8lHETN9nLGw7TOU/Gi9fE
	 GtM43D+QsckYI7uv/8sXkP+jaR/9Wt9ddEboQxadJfw3tc+HpHbQxYBGny1K6GV79O8yK
	 rWCD1OrsFNZUr9BzxNTMYebQpXZV7w0Sre04hyHK/a/LRqswPr5oi8ch0Cv4qOwLRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z1YRA91p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D763606A327;
	Fri, 27 Nov 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z1YRA91p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB391F00924;
	Fri, 27 Nov 2026 09:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795773467;
	bh=/1dki3ql4ILPtX6VVm38QgFRupvHzc8t9wWMswuYXUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z1YRA91pxlqCaT2iXTR0RH53BXW2460m2fJf8J1lqtwZrT3tKCwbYquB72ur/+CX0
	 9VqCEAX6I/KiPhf+zeL32dLMdHkZaI0eAsaAvaX3t+JLJ46oskBvm5f/tNaKR8L00l
	 oAzvfynnwGwQrEhfDzp8msn4XWNnyUhSuXtD7dXwrgGrg6u4nOaL/qlaVo/CwRBYKb
	 cGejZVhCFMzlg5j6o18IfEHHQu1u4qkcGTg2OBoK8hRsqGmVmTwOBeWqgMIH9iEWuJ
	 tqsCZ835343Ud0N24MkXAmBEGAgQUVD+sSwM75i+QXuzUew7or47n+nq4xpVurBaql
	 yTOPhSyCYkJwA==
Date: Fri, 27 Nov 2026 09:57:44 +0000
From: Lee Jones <lee@kernel.org>
To: pladow@gmail.com
Cc: Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lp5860: Fix DOTONOFF register offsets
Message-ID: <179568568416.32537.15684051697969054731@kernel.org>
References: <20261120-fix-lp5860-dotonoff-register-offset-calculation-v1-1-ec1e78842380@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120-fix-lp5860-dotonoff-register-offset-calculation-v1-1-ec1e78842380@gmail.com>
X-AI-Review-Draft: <20261120-fix-lp5860-dotonoff-register-offset-calculation-v1-1-ec1e78842380@gmail.com>

> From: Peter LaDow <pladow@gmail.com>
>
> According to the TI LP5860 datasheet, 18 dots per scanline are
> spread across groups of 3 in the DOTONOFF0..DOTONOFF32 registers,
> rather than spread across the entire range.  Update the register
> offset calculation to correctly calculate the offset and mask
> for scanlines 1 to 10.
>
> Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
> Signed-off-by: Peter LaDow <pladow@gmail.com>
> ---
> I logged a defect in drivers/leds/rgb/lp5860-core.c on the bugzilla
> at kernel.org (but #222303).  Attached is a patch to fix the offset
> calculation for the DOTONOFFn registers.
>
> Per the LP5860 11 × 18 LED Matrix Driver Register Maps
> (see https://www.ti.com/lit/ug/snvu786/snvu786.pdf), the DOTONOFF for each
> of 18 current sinks are spread across 3 registers.  But the current
> mainline code assumes they are tightly packed across all the registers.
>
> This patch calculates the correct offsets by first determining which line
> the appropriate dot is on.  It then chooses the appropriate starting
> register offset for that line, then correctly calculates the mask.
> The comments documenting the registers are longer than 100 columns
> (108 columns to be exactly), but I think this is important to keep the
> information clear.
>
> In the bugzilla entry, I attached Python code that demonstrates the proper
> calculation and how the mainline mismatches.  I also demonstrated the new
> code correctly calculates the offsets to match the datasheet.
> ---
>  drivers/leds/rgb/leds-lp5860-core.c | 67 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> index e21d5f2302be..540463c615d4 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -19,10 +19,73 @@ static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
>  	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
>  }
>
> +// Per the datasheet for the TI LP5860 the DOT_ONOFFn registers group the 18
> +// current sink lines across 3 registers, starting at offset 0x43.
> +// From https://www.ti.com/lit/ds/symlink/lp5860.pdf:
> +//
> +// |  Register   | Address |    D7   |    D6   |    D5   |    D4   |    D3   |    D2   |    D1   |    D0   |
> +// +-------------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
> +// | DOT_ONOFF0  |  043h   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |
> +// |             |         |  L0-CS7 |  L0-CS6 |  L0-CS5 |  L0-CS4 |  L0-CS3 |  L0-CS2 |  L0-CS1 |  L0-CS0 |
> +// +-------------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
> +// | DOT_ONOFF1  |  044h   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |
> +// |             |         | L0-CS15 | L0-CS14 | L0-CS13 | L0-CS12 | L0-CS11 | L0-CS10 |  L0-CS9 |  L0-CS8 |
> +// +-------------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
> +// | DOT_ONOFF2  |  045h   | Reserved                                                  |   Dot   |   Dot   |
> +// |             |         |                                                           | L0-CS17 | L0-CS16 |
> +// +-------------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
> +// | DOT_ONOFF3  |  046h   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |
> +// |             |         |  L1-CS7 |  L1-CS6 |  L1-CS5 |  L1-CS4 |  L1-CS3 |  L1-CS2 |  L1-CS1 |  L1-CS0 |
> +// +-------------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
> +// | DOT_ONOFF4  |  047h   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |
> +// |             |         | L1-CS15 | L1-CS14 | L1-CS13 | L1-CS12 | L1-CS11 | L1-CS10 |  L1-CS9 |  L1-CS8 |
> +// +-------------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
> +// | DOT_ONOFF5  |  048h   | Reserved                                                  |   Dot   |   Dot   |
> +// |             |         |                                                           | L1-CS17 | L1-CS16 |
> +// +-------------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
> +// ... (049h ... 060h)
> +// +-------------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
> +// | DOT_ONOFF30 |  061h   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |
> +// |             |         | L10-CS7 | L10-CS6 | L10-CS5 | L10-CS4 | L10-CS3 | L10-CS2 | L10-CS1 | L10-CS0 |
> +// +-------------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
> +// | DOT_ONOFF31 |  062h   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |   Dot   |
> +// |             |         |L10-CS15 |L10-CS14 |L10-CS13 |L10-CS12 |L10-CS11 |L10-CS10 | L10-CS9 | L10-CS8 |
> +// +-------------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
> +// | DOT_ONOFF32 |  063h   | Reserved                                                  |   Dot   |   Dot   |
> +// |             |         |                                                           |L10-CS17 |L10-CS16 |
> +// +-------------+---------+---------+---------+---------+---------+---------+---------+---------+---------+
> +//
> +// LP5860_MAX_LED_CONSTANT is the number of LEDs per line.
> +// LP5860_MAX_DOT_ONOFF_GROUP_NUM is the number of LEDs per register.
> +// These are 18 and 8, respectively, for the LP5860.
> +//
> +// So to calculate which register to write, we do the following:
> +//
> +//   Which line? (NOTE: integer division, rounding to 0)
> +//     line = dot / LP5860_MAX_LED_CONSTANT
> +//
> +//   Which current sink channel on the line?
> +//     channel = dot % LP5860_MAX_LED_CONSTANT
> +//
> +//   Number of registers per line:
> +//     ceil(LP5860_MAX_LED_CONSTANT / LP5860_MAX_DOT_ONOFF_GROUP_NUM)
> +//
> +//   Starting register for the line:
> +//     line * DIV_ROUND_UP(LP5860_MAX_LED_CONSTANT, LP5860_MAX_DOT_ONOFF_GROUP_NUM)
> +//
> +//   Offset within the line:
> +//     channel / LP5860_MAX_DOT_ONOFF_GROUP_NUM

C++ comments are only used for the SPDX license identifier.

Also, please keep lines within the 100-character limit and consider
making this comment block much more concise - we don't need to duplicate
the entire datasheet register table and repeat the C arithmetic in
prose.

If you must provide this level of documentation, put it in Documentation.

>  static int lp5860_set_dot_onoff(struct lp5860_led *led, unsigned int dot, bool enable)
>  {
> -	unsigned int offset = dot / LP5860_MAX_DOT_ONOFF_GROUP_NUM;
> -	unsigned int mask = BIT(dot % LP5860_MAX_DOT_ONOFF_GROUP_NUM);
> +	unsigned int line = dot / LP5860_MAX_LED_CONSTANT;
> +	unsigned int channel = dot % LP5860_MAX_LED_CONSTANT;

What's the difference between a line and a channel?

> +
> +	// Calculate the register offset.
> +	unsigned int offset = line * DIV_ROUND_UP(LP5860_MAX_LED_CONSTANT, LP5860_MAX_DOT_ONOFF_GROUP_NUM) +
> +		channel / LP5860_MAX_DOT_ONOFF_GROUP_NUM;
> +
> +	// The bit within the register.
> +	unsigned int mask = BIT(channel % LP5860_MAX_DOT_ONOFF_GROUP_NUM);

These comments merely state the obvious from the variable names and can
be dropped.  Please also keep all variable declarations together at the
top of the function without blank lines in between, and wrap lines at
100 characters.

>
>  	if (dot > LP5860_MAX_LED)
>  		return -EINVAL;

If you used AI to draft this patch, you need to teach it about the
kernel coding guidelines.  Did you / it run checkpatch.pl?

-- 
Lee Jones
