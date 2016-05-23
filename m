From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 23/54] MAINTAINERS: Add file patterns for led device tree
 bindings
Date: Mon, 23 May 2016 09:23:58 +0200
Message-ID: <5742B00E.3010101@samsung.com>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
 <1463907991-7916-24-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1463907991-7916-24-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Geert,

On 05/22/2016 11:06 AM, Geert Uytterhoeven wrote:
> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: linux-leds@vger.kernel.org
> ---
> Please apply this patch directly if you want to be involved in device
> tree binding documentation for your subsystem.
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ec96da7cb006e823..82c82a72cb9cf02a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6701,6 +6701,7 @@ M:	Jacek Anaszewski <j.anaszewski@samsung.com>
>   L:	linux-leds@vger.kernel.org
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
>   S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/
>   F:	drivers/leds/
>   F:	include/linux/leds.h
>
>

Applied, thanks.

-- 
Best regards,
Jacek Anaszewski
