From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/3] leds: Replace flags bit shift with BIT() macros
Date: Thu, 14 Sep 2017 21:43:00 +0200
Message-ID: <4f5cdd15-eb77-0143-c056-34758831ef7a@gmail.com>
References: <20170913175400.42744-1-dtwlin@google.com>
 <20170913175400.42744-2-dtwlin@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20170913175400.42744-2-dtwlin@google.com>
Sender: linux-doc-owner@vger.kernel.org
To: David Lin <dtwlin@google.com>, corbet@lwn.net, rpurdie@rpsys.net, pavel@ucw.cz, hdegoede@redhat.com, gregkh@linuxfoundation.org
Cc: robh@kernel.org, romlem@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi David,

Thanks for the patch.

On 09/13/2017 07:53 PM, David Lin wrote:
> This is for readability as well as to avoid checkpatch warnings when
> adding new bit flag information in the future.
> 
> Signed-off-by: David Lin <dtwlin@google.com>
> ---
>  include/linux/leds.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index bf6db4fe895b..5579c64c8fd6 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -40,16 +40,16 @@ struct led_classdev {
>  	int			 flags;
>  
>  	/* Lower 16 bits reflect status */
> -#define LED_SUSPENDED		(1 << 0)
> -#define LED_UNREGISTERING	(1 << 1)
> +#define LED_SUSPENDED		BIT(0)
> +#define LED_UNREGISTERING	BIT(1)
>  	/* Upper 16 bits reflect control information */
> -#define LED_CORE_SUSPENDRESUME	(1 << 16)
> -#define LED_SYSFS_DISABLE	(1 << 17)
> -#define LED_DEV_CAP_FLASH	(1 << 18)
> -#define LED_HW_PLUGGABLE	(1 << 19)
> -#define LED_PANIC_INDICATOR	(1 << 20)
> -#define LED_BRIGHT_HW_CHANGED	(1 << 21)
> -#define LED_RETAIN_AT_SHUTDOWN	(1 << 22)
> +#define LED_CORE_SUSPENDRESUME	BIT(16)
> +#define LED_SYSFS_DISABLE	BIT(17)
> +#define LED_DEV_CAP_FLASH	BIT(18)
> +#define LED_HW_PLUGGABLE	BIT(19)
> +#define LED_PANIC_INDICATOR	BIT(20)
> +#define LED_BRIGHT_HW_CHANGED	BIT(21)
> +#define LED_RETAIN_AT_SHUTDOWN	BIT(22)
>  
>  	/* set_brightness_work / blink_timer flags, atomic, private. */
>  	unsigned long		work_flags;
> 

This one should not raise any doubts.

Applied to the for-4.15 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
