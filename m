Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A1F41DED5;
	Thu, 24 Sep 2026 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240007; cv=none; b=CdqvNOdVFMMj80nreAOwBWj7pQFijD9ryyQyr+ORtS5ZmrIZD3U2FqCeBR2fVllxa6DoNxqFoJ0zM0D7r/N8ION/BiJwpJY3jb52xvyyOSrPGQdhnInJn/F++oB3TmQAj5zG7RMWr7wxMW3f+zzdXDE4ryk327cQGUFyQ+u1TGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240007; c=relaxed/simple;
	bh=8zMY95UsKXoFMVj5xzDi6BABEaFDzDbRaEvijWOEOm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKSI6RsIKe5qnJ41OeZx//D1l/epL5ttYR3lkNdp7GyxoTdsHKXvft45/1BxuSr8bX0lNnLzf/bRh048FwNhW9qnQuBo1Q9enxoY2FbkZhY2z/LHApfXvKkOvWbUoJj/RJ3lYmSoKXmv7wZPcSGrkVvQRbIMlT+dvhofwtFo30M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG0THUcI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG0THUcI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F2E1F000FF;
	Thu, 24 Sep 2026 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790240004;
	bh=LreKG5s8ANGaXmTv6uJ69a5K2A2KXRsAIRlVkBPv88k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PG0THUcIFNCsYMBQ331DbPXGEH00J9x3XpTVyCz+YQ7fU1o96Y/Xhoze6MMGTx6U5
	 fdr1cuqoWdtEf74gvFl4GlMD/7wPj6GAZ5XF7tNyOAUgncueTCX1hj1THFvquAZ7FB
	 RRlfbFU4EqymHh9L0LNrTattB7KNtgb0tJyO3xaqDd8Ys2ej/k4YeP8S2nnYBcb5dk
	 Et0BAEeniMXnCJ6QAWN3fRbJO3Qgbz3zJAIaeM2Boiodz3AAhKxWI1wOqz1dh+Lvxj
	 sxa0HJSwEqBLzbdgwSe/2vy2xQbIXll6sgvy/NTsEYrZo9FnRsDTHv66EkWRkYP3Ut
	 kp0xHQAEEm5yA==
Date: Thu, 24 Sep 2026 09:53:16 +0100
From: Lee Jones <lee@kernel.org>
To: Rong Zhang <i@rong.moe>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v7 08/13] leds: trigger: netdev: Implement hw_offloaded()
 callback
Message-ID: <20260924085316.GB331088@google.com>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-8-fe3cdb6dec51@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-8-fe3cdb6dec51@rong.moe>

--- checkpatch.pl: clean (0 issues) ---

On Mon, 21 Sep 2026, Rong Zhang wrote:

> "netdev" can run in hardware control according to hardware capabilities
> and trigger options.
> 
> Implement hw_offloaded() callback to provide its hardware control state
> to the LED core, and document the relation between the custom
> "offloaded" attribute and the generic "trigger_may_offload_to_hw"
> attribute.
> 
> The callback mimics how the existing "offloaded" attribute does, i.e.,
> locklessly reads hw_control, as it's just a hint and don't need to be
> accurate.
> 
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v7:
> - Rename the offloaded() callback to hw_offloaded() (thanks Lee Jones)
> - Rename the trigger_may_offload attribute to
>   trigger_may_offload_to_hw (ditto)
> 
> Changes in v3:
> - Do not deprecate netdev's "offloaded" attribute (thanks Thomas
>   Weißschuh)
> - Document the relation between the custom "offloaded" attribute and the
>   generic "trigger_may_offload" attribute (ditto)
> ---
>  Documentation/ABI/testing/sysfs-class-led                | 3 +++
>  Documentation/ABI/testing/sysfs-class-led-trigger-netdev | 3 +++
>  drivers/leds/trigger/ledtrig-netdev.c                    | 8 ++++++++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index 123e3a15b7d6..ea113fed10ef 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -101,6 +101,9 @@ Description:
>  		- `[foo_trigger]`: the trigger is selected and offloaded to
>  		  hardware.
>  
> +		The "netdev" trigger also provides a custom attribute to
> +		indicate its state, see `/sys/class/leds/<led>/offloaded`.
> +
>  What:		/sys/class/leds/<led>/inverted
>  Date:		January 2011
>  KernelVersion:	2.6.38
> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> index ed46b37ab8a2..203ea58396ed 100644
> --- a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> @@ -75,6 +75,9 @@ Description:
>  		If 1, the LED blinking in requested mode is offloaded to
>  		hardware.
>  
> +		LED trigger core also provides a generic attribute for this
> +		purpose, see `/sys/class/leds/<led>/trigger_may_offload_to_hw`.
> +
>  What:		/sys/class/leds/<led>/link_10
>  Date:		Jun 2023
>  KernelVersion:	6.5
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index 5b4e92c14dbb..60409f054e22 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -798,10 +798,18 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
>  	kfree(trigger_data);
>  }
>  
> +static bool netdev_trig_hw_offloaded(struct led_classdev *led_cdev)
> +{
> +	struct led_netdev_data *trigger_data = led_get_trigger_data(led_cdev);
> +
> +	return trigger_data->hw_control;

How sure are we that trigger_data can NEVER be NULL?

> +}
> +
>  static struct led_trigger netdev_led_trigger = {
>  	.name = "netdev",
>  	.activate = netdev_trig_activate,
>  	.deactivate = netdev_trig_deactivate,
> +	.hw_offloaded = netdev_trig_hw_offloaded,
>  	.groups = netdev_trig_groups,
>  };
>  
> 
> -- 
> 2.55.0
> 

-- 
Lee Jones
