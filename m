Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301273;
	b=oKrRsq/DXOxae8dXCVlx/f2y/iNv3nyNMhDn7kZ6lmbOXOWk9t0FEw7q5hlGpL/CaeKZ
	 hSAlCM3aavYAwR2JmA6vzaJTU4O4++5gant5fOl7n/oJr9fJ/V9kuB8mnA+jF8kjga3tl
	 LNMWgzhS/J1FborkAP4AS8y45BEH0XcDJ6tDyrlJiTHsoc/V50T6Dlj9zLxepGuOh7jLP
	 QshLDfY9CyII4DiHIkuHJDPetmNoC/pa4NKMb+YbMLr7BhxDPwfgKa2WspfedDihS9pDX
	 V2NdQNUItuwsWr05yRFtFByTCIeJ0RQBh/RJkJDRr/JCgH81WLf1o73HuxCKtxQUSsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301273;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=uuAWQXqnz1U0BUVQyMKxygbDOS8iqng/23yeDqKQ//8=;
	b=dfhzH6/5uDh00LU9Zmv8hznLbCTrbERuqnwqE1xhXxK67w//3qd6GcCuw51wQp0kUnzZ
	 JmqisIaKLeuhAFbY4ZkWx6lvYYvlkzrpKn1GJmJ8V4Q5uzOOoAtrRZwebmuXVx3jwDd70
	 hCD7yB7m5HtXrh7RiUkfcUAtdPM9fnjiEHZ5tsHQgtyIQkHzqYWZVPm8pLsWDX4LaKVVK
	 Jtxu5ae6Yq6SQL+1w74zeNBETPBjRDzyzA54azHzCJfuS4+VfZXjUGTNzsfS+qe0CaLKl
	 w4Bvy04T9pXqwK5wFibgGvGNTZlGqD6M+kcqeJIKb5dPZDs9dHzf3KWiI2d7gsz23tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sm2ffuk+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C3A606A31C;
	Tue, 10 Nov 2026 09:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sm2ffuk+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E04E1F0089F;
	Tue, 10 Nov 2026 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794301272;
	bh=uuAWQXqnz1U0BUVQyMKxygbDOS8iqng/23yeDqKQ//8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sm2ffuk+J2Zrts19t5DZts9ivVjcpcqXKjUI9nPLJhex4qiPGAs93ciN1rvY0OdWx
	 Zl0kHbW3j8NuRqlkW4z2UhJ7dJnIKEjWY/gLPTOmEAX4k0ZiOF0BCXLB/+4tmP2e5G
	 wKExwb+LKDjwP9/dSYfmtKILBD7fWW1xBvcM+yg30QzyA0u1acIN6pBJI5UxnysmjH
	 V/VTG/D1jc+gSduUsmRezswdOEA77uZVSv0hspQ7w7kMYWz7dVx4sNAY3B/dFFkor4
	 qrF6SOe4Jtdj7MPd2vqXczJchZlAItHUi4tR+Qd/5r08kPhhtanD3+Oo9gpjXU/AIs
	 rooNjsJqjaHpA==
Date: Tue, 10 Nov 2026 09:01:05 +0000
From: Lee Jones <lee@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>, Ike Panhc <ikepanhc@gmail.com>,
	Rong Zhang <i@rong.moe>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v7 00/13] leds: Add support for hardware-initiated
 hardware control trigger transition
Message-ID: <20261110090105.GA6323@joneslee-macbookpro.roam.internal>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <179425319974.10927.7190572777719580956.b4-ty@b4>
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
In-Reply-To: <179425319974.10927.7190572777719580956.b4-ty@b4>

On Mon, 09 Nov 2026, Ilpo Järvinen wrote:

> On Mon, 21 Sep 2026 03:40:14 +0800, Rong Zhang wrote:
> 
> > Some laptops can tune their keyboard backlight according to ambient
> > light sensors (auto mode). This capability is essentially a hardware
> > control trigger. Meanwhile, such laptops also offer a shrotcut for
> > cycling through brightness levels and auto mode. For example, on
> > ThinkBook, pressing Fn+Space ("shortcut") cycles keyboard backlight
> > levels in the following sequence:
> > 
> > [...]
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
> 
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
> 
> The list of commits applied:
> [01/13] leds: class: Always protect brightness_show() with led_access
>         (no commit info)
> [02/13] leds: trigger: Move led_trigger_is_hw_controlled() to the right place
>         (no commit info)
> [03/13] leds: class: Remove hardware control trigger when writing brightness
>         (no commit info)
> [04/13] leds: trigger: Move led_trigger_group to the right place
>         (no commit info)
> [05/13] leds: trigger: Add hw_offloaded() callback and provide trigger_may_offload_to_hw attribute
>         (no commit info)
> [06/13] leds: cros_ec: Implement hw_offloaded() trigger callback
>         (no commit info)
> [07/13] leds: turris-omnia: Implement hw_offloaded() trigger callback and declare hw_control_trigger
>         (no commit info)
> [08/13] leds: trigger: netdev: Implement hw_offloaded() callback
>         (no commit info)
> [09/13] leds: trigger: Enforce strict checks in led_trigger_is_hw_controlled()
>         (no commit info)
> [10/13] leds: trigger: Add led_trigger_notify_hw_control_changed() interface
>         (no commit info)

This is super confusing!

Where does this list come from?

> [11/13] platform/x86: ideapad-laptop: Serialize keyboard backlight tracking
>         commit: d288a6f989b7b9e6a730140c601987b886af327e
> [12/13] platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for keyboard backlight
>         commit: 7d6c073d181d7855561831cb4bba17dc9b7d4aa9
> [13/13] platform/x86: ideapad-laptop: Fully support auto keyboard backlight
>         commit: 5d805ca01382d63d54c9984e7f19922c4ae6f3dc
> 
> --
>  i.
> 

-- 
Lee Jones
