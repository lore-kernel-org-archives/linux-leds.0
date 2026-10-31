Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442202;
	b=eCtX8WAPIEjKCZiRav0vnNNpi3loa/ajvYuZAFT1CgMgIT4oqx9y1XmCIPCx1wYvsJe7
	 NEHHw9VEkUTunQEyIDLKwPRx6ZnAw4nCtXq2UuBx344CtBC2RVsAgHJgV66045Q0ERXhi
	 GwPi3hPFXyvI14Fc78pFf0sdGGHUKL0i8TBKr93CFOlzPbBQalpAghfWz52JMysPtN4wL
	 kOhpOkrmo2LLpgNO9wsnarKxrJtiR+11g/pemPjlKGiOrCpTfjFELosO4q425xigXLrOg
	 8tdoz0XiKLl3dk6Tdwe6k/Ei5BkB9wtX9APH8788GDnXDrrS+QHh55jbkY/fdHktbsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442202;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iq1VW8nkh3jlpFmdOaxI2MJ1haFWUOn/1TFy/634l24=;
	b=KwevB1Bf79+D1oRQ4CNAFgpp7BiFhelfXaSW3SvyDymCr1TXARuheXxM21SfYoGawCYQ
	 uLFjhEE02Drwjp7zzWHVJuDCFdLr5OYPs3Pl2Vf81PfyMNP6+/5dDIYt9p4lk5Sg6+ZVo
	 3HSff2D39T2HwG40uGFxRGaAJzbE31FUnsKdv34tzuzZRxUnnq68xxWNP6k8++lPiWIZG
	 UuOJAYv1OVIBYxEuze0IUL0rTneopR1OJJb/PCsSwuV54N/7h4BT112/qJ+0k6wj0Ltbo
	 ZT7MsIBm2kH4RepiuIOd+4Y481ypHURznhfkYYvqfHXkPnj/y48uE2T2AZij9aqk3+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2PgfgsYs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E953606A31A;
	Sat, 31 Oct 2026 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2PgfgsYs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A0E1F000C1;
	Sat, 31 Oct 2026 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793442201;
	bh=iq1VW8nkh3jlpFmdOaxI2MJ1haFWUOn/1TFy/634l24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2PgfgsYscZSBXrYMAvlPIYLkaV+PwEBlHmSm3fmtUO+XrqrEKma4j4Y6uvjUO7w6Q
	 AeBxE98zNnIempOLP/11iD1u6VMnQbyqvfVKkPZ7TdIzcVkYZ6yDSn5gqrVE8CdPXK
	 mvgCaw5n0tk1wk1jYDOXAcP27EUmVvCFEsIzMiHY=
Date: Sat, 31 Oct 2026 11:23:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: plaztininikolai@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] leds: triggers: Add led_trigger_for_each_led()
Message-ID: <2026103131-unharmed-dizzy-ade8@gregkh>
References: <20261030-leds-input-events-brightness-v4-0-5ea0ead7480c@gmail.com>
 <20261030-leds-input-events-brightness-v4-1-5ea0ead7480c@gmail.com>
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
In-Reply-To: <20261030-leds-input-events-brightness-v4-1-5ea0ead7480c@gmail.com>

On Fri, Oct 30, 2026 at 09:51:31PM +0800, Nikolay Plastinin via B4 Relay wrote:
> From: Nikolay Plastinin <plaztininikolai@gmail.com>
> 
> led_trigger_event() sets one brightness for all LEDs using a trigger.
> A trigger which restores a different brightness per LED needs to iterate
> over the attached LEDs instead.
> 
> Add led_trigger_for_each_led(), a wrapper around list_for_each_entry_rcu(),
> so triggers can perform this iteration without spelling out the list
> members. Document that callers must hold the RCU read lock throughout
> the iteration and must not sleep while accessing the LEDs.
> 
> Assisted-by: LLM
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>
> ---
>  include/linux/leds.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index a515f075c..675c58661 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/leds/common.h>
>  #include <linux/device.h>
>  #include <linux/mutex.h>
> +#include <linux/rculist.h>
>  #include <linux/rwsem.h>
>  #include <linux/spinlock.h>
>  #include <linux/timer.h>
> @@ -502,6 +503,17 @@ struct led_trigger {
>  	const struct attribute_group **groups;
>  };
>  
> +/**
> + * led_trigger_for_each_led - iterate over the LEDs attached to a trigger
> + * @pos: struct led_classdev pointer used as the loop cursor
> + * @trig: trigger whose LEDs are iterated
> + *
> + * The caller must hold the RCU read lock throughout the iteration and must
> + * not sleep while accessing the LEDs.
> + */
> +#define led_trigger_for_each_led(pos, trig) \
> +	list_for_each_entry_rcu(pos, &(trig)->led_cdevs, trig_list)
> +

No need for this when you are only using it in one place, AND you are
always going to forget to grab the rcu lock.  Just "open code" it
please, that way driver authors don't get confused and use this
accidentally in the future.

thanks,

greg k-h
