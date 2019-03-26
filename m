From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/6] leds: netdev trigger: use memcpy in
 device_name_store
Date: Tue, 26 Mar 2019 20:53:20 +0100
Message-ID: <987c3e60-edb3-44f0-be28-434c70bb8659@gmail.com>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-2-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314140619.3309-2-linux@rasmusvillemoes.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Rasmus,

Thank you for the patch.

On 3/14/19 3:06 PM, Rasmus Villemoes wrote:
> If userspace doesn't end the input with a newline (which can easily
> happen if the write happens from a C program that does write(fd,
> iface, strlen(iface))), we may end up including garbage from a
> previous, longer value in the device_name. For example
> 
> # cat device_name
> 
> # printf 'eth12' > device_name
> # cat device_name
> eth12
> # printf 'eth3' > device_name
> # cat device_name
> eth32
> 
> I highly doubt anybody is relying on this behaviour, so switch to
> simply copying the bytes (we've already checked that size is <
> IFNAMSIZ) and unconditionally zero-terminate it; of course, we also
> still have to strip a trailing newline.
> 
> This is also preparation for future patches.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>   drivers/leds/trigger/ledtrig-netdev.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index 3dd3ed46d473..8d476b92f58c 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -122,7 +122,8 @@ static ssize_t device_name_store(struct device *dev,
>   		trigger_data->net_dev = NULL;
>   	}
>   
> -	strncpy(trigger_data->device_name, buf, size);
> +	memcpy(trigger_data->device_name, buf, size);
> +	trigger_data->device_name[size] = 0;
>   	if (size > 0 && trigger_data->device_name[size - 1] == '\n')
>   		trigger_data->device_name[size - 1] = 0;
>   
> 

Added tag:

Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")

and applied to the fixes-for-5.1-rc3 branch.

-- 
Best regards,
Jacek Anaszewski
