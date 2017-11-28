From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] leds: trigger: Introduce a NETDEV trigger
Date: Tue, 28 Nov 2017 14:41:11 -0800
Message-ID: <f6edbdbb-2b9d-5ee6-7a74-0567ff7d9ded@infradead.org>
References: <1511906058-30649-1-git-send-email-ben.whitten@gmail.com>
 <1511906058-30649-2-git-send-email-ben.whitten@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:60164 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752616AbdK1WlP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Nov 2017 17:41:15 -0500
In-Reply-To: <1511906058-30649-2-git-send-email-ben.whitten@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

On 11/28/2017 01:54 PM, Ben Whitten wrote:

> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index 3f9ddb9..4ec1853 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -126,4 +126,11 @@ config LEDS_TRIGGER_PANIC
>  	  a different trigger.
>  	  If unsure, say Y.
>  
> +config LEDS_TRIGGER_NETDEV
> +	tristate "LED Netdev Trigger"
> +	depends on NET && LEDS_TRIGGERS
> +	help
> +	  This allows LEDs to be controlled by network device activity.
> +	  If unsure, say Y.
> +
>  endif # LEDS_TRIGGERS

What LEDs do LED triggers manipulate?  I.e., where are they?

-- 
~confuzed
