From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: Small fixes for Flash class description
Date: Wed, 3 Apr 2019 22:22:06 +0200
Message-ID: <19af37e8-93fd-c343-57ea-9792f18041f0@gmail.com>
References: <20190403181922.21273-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403181922.21273-1-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the patch.

On 4/3/19 8:19 PM, Dan Murphy wrote:
> Fix misspelling and capitalization of LED in the Kconfig.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   drivers/leds/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a72f97fca57b..f24d31138471 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -23,8 +23,8 @@ config LEDS_CLASS_FLASH
>   	tristate "LED Flash Class Support"
>   	depends on LEDS_CLASS
>   	help
> -	  This option enables the flash led sysfs class in /sys/class/leds.
> -	  It wrapps LED Class and adds flash LEDs specific sysfs attributes
> +	  This option enables the flash LED sysfs class in /sys/class/leds.
> +	  It wraps LED Class and adds flash LEDs specific sysfs attributes
>   	  and kernel internal API to it. You'll need this to provide support
>   	  for the flash related features of a LED device. It can be built
>   	  as a module.
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
