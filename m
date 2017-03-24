From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCHv3 1/2] mfd: cpcap: Add missing include dependencies
Date: Fri, 24 Mar 2017 21:44:35 +0100
Message-ID: <d1a18390-fb5f-e192-a54c-1c2574238225@gmail.com>
References: <20170324084732.31255-1-sre@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36538 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965355AbdCXUpW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Mar 2017 16:45:22 -0400
In-Reply-To: <20170324084732.31255-1-sre@kernel.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Sebastianm

On 03/24/2017 09:47 AM, Sebastian Reichel wrote:
> This fixes compilation for files, that try to include the
> cpcap header in alphabetically sorted #include lists.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
> Changes since PATCHv2:
>  - Add Acked-by from Tony & Pavel
> ---
>  include/linux/mfd/motorola-cpcap.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
> index 793aa695faa0..aefc49cb7ba9 100644
> --- a/include/linux/mfd/motorola-cpcap.h
> +++ b/include/linux/mfd/motorola-cpcap.h
> @@ -14,6 +14,9 @@
>   * published by the Free Software Foundation.
>   */
>  
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +
>  #define CPCAP_VENDOR_ST		0
>  #define CPCAP_VENDOR_TI		1
>  
> 

Both patches applied to the for-next branch of linux-leds.git, thanks.

-- 
Best regards,
Jacek Anaszewski
